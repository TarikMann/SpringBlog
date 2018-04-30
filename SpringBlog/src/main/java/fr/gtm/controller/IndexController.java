package fr.gtm.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import fr.gtm.domaine.Article;




@Controller
public class IndexController {

	/**
	 * Autowired :
	 */
	
	@Autowired
	private Article article;
	
	/**
	 * Definition du lien avec les URLs qui declenchent cette methode. 
	 *
	 * @return ModelAndView la vue Welcome.
	 */
	
	@RequestMapping(path="/welcome", method = RequestMethod.GET)
	ModelAndView displayIndex() {
		
		ModelAndView monModelAndView = new ModelAndView("welcome");
		
		//Creation d'une liste article
		final List<Article> articles = new ArrayList<>();
		articles.add(this.article);
// mettre dans la partie modeles
		monModelAndView.getModel().put("articles", articles);
		return monModelAndView;
	}

}
