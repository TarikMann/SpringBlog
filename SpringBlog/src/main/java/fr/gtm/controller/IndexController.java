package fr.gtm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fr.gtm.domaine.Article;
import fr.gtm.repository.ArticleRepository;

@Controller
public class IndexController {

	private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);


	/**
	 * Autowired :
	 */

	@Autowired
	private Article article;

	@Autowired
	private ArticleRepository articleRepository;

	@RequestMapping("/formulaire")
	ModelAndView displayForm() {
		ModelAndView mav = new ModelAndView("formulaire");
		// Préparer un nouvel article à remplir.
		return mav;
	}

	/**
	 * Definition du lien avec les URLs qui declenchent cette methode.
	 *
	 * @return ModelAndView la vue Welcome.
	 */

	@RequestMapping(path = "/welcome", method = RequestMethod.GET)
	ModelAndView displayIndex() {
		IndexController.LOGGER.debug("Utilisation de la methode displayIndex");
		ModelAndView monModelAndView = new ModelAndView("welcome");

		// Creation d'une liste article
		final List<Article> articles = new ArrayList<>();
		articles.add(this.article);
		articles.addAll(this.articleRepository.findAll());
		IndexController.LOGGER.debug("{} Article afficher" , articles.size());
		// mettre dans la partie modeles
		monModelAndView.getModel().put("articles", articles);
		return monModelAndView;
	}

	@RequestMapping(path = "/formulaire", method = RequestMethod.POST)
	ModelAndView validateForm(@RequestParam String title, @RequestParam String description) {
		// Sauvegarde dans la bdd
		final Article MonArticle = new Article(title, description);
		this.articleRepository.save(MonArticle);

		// renvoyer vers la page displayIndex
		return this.displayIndex();

	}

	//
	// @GetMapping("/delete")
	// ModelAndView deleteArticle(@RequestParam Integer articleId) {
	// this.articleRepository.deleteById(articleId);
	//
	// return this.displayIndex();
	// }
	//

	@GetMapping("/delete/{articleId}")
	ModelAndView delete(@PathVariable(name = "articleId") Integer articleId) {
		this.articleRepository.deleteById(articleId);

		return this.displayIndex();
	}

	@GetMapping("/displayEdit/{articleId}")
	ModelAndView displayEdit(@PathVariable(name = "articleId") Integer articleId) {
		ModelAndView monModelAndViewedit = new ModelAndView("editformul");

		Optional<Article> Monarticlerecup = this.articleRepository.findById(articleId);
		if (Monarticlerecup.isPresent()) {

			monModelAndViewedit.addObject("editArticle", Monarticlerecup);

		}
		return monModelAndViewedit;
	}

	@PostMapping("/modify")
	ModelAndView validateEdit(@ModelAttribute Article article) {

		this.articleRepository.save(article);

		return this.displayIndex();
	}

	@GetMapping("/search")
	String displaySearch() {

		return "search";
	}

	@PostMapping("/search")
	ModelAndView validateSearch(@RequestParam String search) {
		final ModelAndView monModelAndView = new ModelAndView("search");

		monModelAndView.addObject("resultList", this.articleRepository.findAllByTitleContaining(search));
		return monModelAndView;
	}

}
