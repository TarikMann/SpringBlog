package fr.gtm.service;

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
public class ArticleService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ArticleService.class);

	@Autowired
	private ArticleRepository articleRepository;
	private Article article;

	public void saveService(Article monarticle) {
		this.articleRepository.save(monarticle);
	}

	public void deleteByIdService(Integer IdArticle) {
		this.articleRepository.deleteById(IdArticle);

	};

	public Optional<Article> findByIdService(Integer articleId) {
		 return this.articleRepository.findById(articleId);
		
	}

}
