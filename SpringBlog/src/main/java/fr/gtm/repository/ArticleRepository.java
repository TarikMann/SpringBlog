package fr.gtm.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.gtm.domaine.Article;

public interface ArticleRepository extends JpaRepository< Article, Integer> {

}
