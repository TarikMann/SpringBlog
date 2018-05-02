package fr.gtm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fr.gtm.domaine.Article;
import fr.gtm.repository.ArticleRepository;

@Controller
public class IndexController {

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

		ModelAndView monModelAndView = new ModelAndView("welcome");

		// Creation d'une liste article
		final List<Article> articles = new ArrayList<>();
		articles.add(this.article);
		articles.addAll(this.articleRepository.findAll());
		
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

}
