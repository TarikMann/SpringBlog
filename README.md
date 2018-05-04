# SpringBlog
Projet Blog avec utilisation du Framework Spring.
>Utilisation de JavaEE/ Maven / TomCat / LogBack / JSP / JSTL.

>> Spring est un framework pour developper des applications d'entreprises qui permet d'avoir un squelette de projet.




// Sources : 

> - https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html
> - https://mvnrepository.com/
> - https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories.query-methods

## I - Mise en place de l'infrastructure.

### 1- Ajout du Build 

		...
		<build>
			<finalName>SpringBlog</finalName>
			<plugins>
				<plugin>
					<groupId>org.apache.maven.plugins</groupId>
					<artifactId>maven-compiler-plugin</artifactId>
					<version>3.7.0</version>
					<configuration>
						<encoding>UTF-8</encoding>
						<source>1.8</source>
						<target>1.8</target>
					</configuration>
				</plugin>
			</plugins>
		</build>
		...
	
	
### 2 - Ajout du LogBag

> LogBack permet d'avoir des logs.

		...
		<!-- https://mvnrepository.com/artifact/ch.qos.logback/logback-classic -->
		<dependency>
			<groupId>ch.qos.logback</groupId>
			<artifactId>logback-classic</artifactId>
			<version>1.2.3</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/javax.servlet/jstl -->
		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
			<version>1.2</version>
		</dependency>
		...

### 3 - Ajouter les dependances manquantes.

		...
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>5.0.5.RELEASE</version>
		</dependency>
		
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>5.0.5.RELEASE</version>
		</dependency>
		...


### 4 - Configuration du fichier web.xml

		...
		<servlet>
			<servlet-name>BestofBlog</servlet-name>
			<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		</servlet>
		...


### 5 - Création d'un fichier XML dans les ressources avec le nom de la servlet.

> Dans le fichier Creer  :

		<?xml version="1.0" encoding="UTF-8"?>
		<beans xmlns="http://www.springframework.org/schema/beans"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:schemaLocation="http://www.springframework.org/schema/beans
				http://www.springframework.org/schema/beans/spring-beans.xsd">
		// Le Corp du beans
		</beans>
	
	
### 6 - Création de la couche Domaine : 

> Création de la classe Article.java
	
		private Integer id;
		private String title;
		private String description;

		
### 7 - On rempli le corp du Beans :  BestOfBlog-servlet.xml 
	
		...
		<bean id="article" class="fr.gtm.domaine.Article">
	
			<constructor-arg type="Integer" value="1" />
			<constructor-arg type="String" value="Article n°1" />
			<constructor-arg type="String" value="Super description ..." />
	
		</bean>
		...


### 8 -  Création du Controller  : IndexController.java

>> Utilisation des annotations   : @Controller , @RequestMapping

		@Controller
		public class IndexController {

			@RequestMapping(path="/", method = RequestMethod.GET)
			ModelAndView displayIndex() {
				
				ModelAndView monModelAndView = new ModelAndView("index");
				return monModelAndView;
			}

		}


		
### 9 - Modification de l'entête du beans.

		<!-- Bean Metier basique -->
		<beans xmlns="http://www.springframework.org/schema/beans"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
		xmlns:context="http://www.springframework.org/schema/context"
		xsi:schemaLocation="http://www.springframework.org/schema/beans
	        http://www.springframework.org/schema/beans/spring-beans.xsd
	        http://www.springframework.org/schema/context
	        http://www.springframework.org/schema/context/spring-context.xsd">
		...


### 10 - Gestion du chemin de la servlet. 
> dans web.xml

	<servlet-mapping>
		<servlet-name>BestofBlog</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>


### 11 - Configuration des pages JSP.

> Dans BestOfBlog-servlet.xml

	<!-- Bean de configuration Spring : Objet permettant de resoudre les noms 
		de vues (ModelAndView) en page JSP -->
	<bean id="viewResolver"
		class="org.springframework.web.servlet.view.InternalResourceViewResolver">

		<property name="prefix" value="/WEB-INF/views/" />
		<property name="suffix" value=".jsp" />
		<property name="viewClass"
			value="org.springframework.web.servlet.view.jstlView" />

	</bean>

>> Déplacement du fichier "BestOfBlog-servlet.xml" dans le WEB-INF.

### 12 - Faire une redirection vers une autre pages.

> modifier l'index.jsp 

	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>Best of Blog</title>
		</head>
		<body>
			<c:redirect url="/welcome.html"/>
		</body>
	</html>




### 13- Création du fichier welcome.jsp

> Création du dossier views dans Web-INF
>> Création du fichier welcome.jsp

	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Listes des articles</title>
	</head>
	<body>
		<h1>Liste des articles</h1>
		<c:forEach items="${ articles }" var="article">
			<div title="${article.id }">
				<h2>${article.title }</h2>
				<p>${article.description }</p>
			</div>
		</c:forEach>
	</body>
	</html>	

	
	
### 14- Modification de IndexController.java
		
		
	@Controller
	public class IndexController {

		@Autowired
		private Article article;

		@RequestMapping(path="/welcome", method = RequestMethod.GET)
		ModelAndView displayIndex() {
			
			ModelAndView monModelAndView = new ModelAndView("welcome");
			
			final List<Article> articles = new ArrayList<>();
			articles.add(this.article);
			monModelAndView.getModel().put("articles", articles);
			return monModelAndView;
			
		}

	}



## II - Integration Hibernate.

### 1 -  Ajout des dependences Hibernate/JPA, JAXB et Mysql

		...
		<!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>5.1.6</version>
		</dependency>

		<!-- https://mvnrepository.com/artifact/org.hibernate/hibernate-core -->
		<dependency>
			<groupId>org.hibernate</groupId>
			<artifactId>hibernate-core</artifactId>
			<version>5.2.17.Final</version>
		</dependency>
		
		<!-- https://mvnrepository.com/artifact/javax.xml.bind/jaxb-api -->
		<dependency>
			<groupId>javax.xml.bind</groupId>
			<artifactId>jaxb-api</artifactId>
			<version>2.3.0</version>
		</dependency>
		....
		
### 2 - Création du fichier "persistence.xml"

> Création d'un fichier dans  src --> main --> webapp --> META-INF --> persistence.xml

		
		<?xml version="1.0" encoding="UTF-8"?>
		<persistence xmlns="http://java.sun.com/xml/ns/persistence"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:schemaLocation="http://java.sun.com/xml/ns/persistence http://java.sun.com/xml/ns/persistence/persistence_2_0.xsd"
			version="2.0">
			<persistence-unit name="springblog">
				<provider>org.hibernate.jpa.HibernatePersistenceProvider</provider>

				<properties>
					<property name="hibernate.connection.driver_class" value="com.mysql.jdbc.Driver" />
					<property name="hibernate.connection.url" value="jdbc:mysql://localhost:3306/springblogbdd" />
					<property name="hibernate.connection.user" value="root" />
					<property name="hibernate.connection.password" value="root" />
					<property name="hibernate.dialect" value="org.hibernate.dialect.MySQL57Dialect" />
					<property name="hibernate.hbm2ddl.auto" value="create,update" />
				</properties>
			</persistence-unit>
		</persistence>
		
	

///  Object - Relational Mapping  "ORM" ///

> Définir les entitées " Classe Java <--> Table SQL "
> Pour Chaque entité 
>>  1- Definir un Identifiant  " ID <--> PK " <br>
>>  2- Definir les propriétés  " Attribut Java <--> Colonne SQL "<br>
>>  3- Definir les relations entre les entités
>>>   - OneToMany <--> FK
>>>   - ManyToMany <--> FK 
>>>   - ManyToMany <--> Table intermediaire + 2 FK


### 3 - Ajout des annotation et definition des entitées dans la classe Article.java

> @Entity
> @Table
> @id
> @Column
> @GeneratedValue(strategy = GenerationType.IDENTITY)


		@Entity
		@Table(name = "article")
		public class Article {

			@Id
			@Column(name = "idArticle")
			@GeneratedValue(strategy = GenerationType.IDENTITY)
			private Integer id;

			@Column
			private String title;

			@Column
			@Lob
			private String description;
			
			...
			
			}

			
### 4- Configuration de JPA 

> - Ajout de la  dependance Maven de Spring Data  :

	<!-- https://mvnrepository.com/artifact/org.springframework.data/spring-data-commons -->
	<dependency>
		<groupId>org.springframework.data</groupId>
		<artifactId>spring-data-commons</artifactId>
		<version>2.0.6.RELEASE</version>
	</dependency>



> - Ajout et configuration du Bean entityManagerFactory et transactionManager dans  BestofBlog-servlet.java


	<!-- Configuration JPA -->
	<bean id="entityManagerFactory"
		class="org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean">
		<property name="persistenceUnitName" value="springblog" />
	</bean>

	<bean id="transactionManager" class="org.springframework.orm.jpa.JpaTransactionManager">
		<property name="entityManagerFactory" ref="entityManagerFactory" />
	</bean>


 
### 5 - Ajout de l'entete  spring JPA  pour le  BestofBlog-servlet.java 
 
	 <beans xmlns="http://www.springframework.org/schema/beans"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
		xmlns:context="http://www.springframework.org/schema/context"
		xmlns:jpa="http://www.springframework.org/schema/data/jpa"
		xsi:schemaLocation="http://www.springframework.org/schema/beans
			http://www.springframework.org/schema/beans/spring-beans.xsd
			http://www.springframework.org/schema/context
			http://www.springframework.org/schema/context/spring-context.xsd
			http://www.springframework.org/schema/data/jpa
			http://www.springframework.org/schema/data/jpa/spring-jpa.xsd">
		
		...
		
	</beans>	
	
	
### 6 - Ajout et configuration des Repository	
	
	<!-- Repository -->
	<jpa:repositories base-package="fr.gtm.repository" />
	
	
	Creation de l'interface ArticleRepository
	
	public interface ArticleRepository extends JpaRepository< Article, Integer> {

	}

	
## III- Création d'un formulaire : 

### 1 - Création du formulaire 

	<form method="post">

		<div>
			<label for="title">Titre    : </label>
			 <input type="text" id="title"	name="title" />
		</div>
		<br>
		<div>
			<label for="description">description : </label>
			<textarea id="description" name="description"></textarea>			
		</div>
		<div>
			<button>Valider</button>
		</div>
		
	</form>
	
	
### 2 - Création de la méthode displayform pour afficher le formulaire dans le indexController.java

	@RequestMapping("/formulaire")
	ModelAndView displayForm() {
		ModelAndView mav = new ModelAndView("formulaire");
		// Préparer un nouvel article à remplir.
		return mav;
	}
	
	
### 3 - Création de la methode ValidateForm() dans le indexController.java
	
	@RequestMapping(path = "/formulaire", method = RequestMethod.POST)
	ModelAndView validateForm(@RequestParam String title, @RequestParam String description) {
		// Sauvegarde dans la bdd
		final Article MonArticle = new Article(title, description);
		this.articleRepository.save(MonArticle);

		// renvoyer vers la page displayIndex
		return this.displayIndex();

	}
	
	
	
### 4 - Ajouter les valeur dans la liste .	
	
	...
	articles.addAll(this.articleRepository.findAll());
	...
	
	
	
## IV - Mise en place de bootstrap 

### 1 - Télecharger la biblioteque Bootstrap : 	

> https://getbootstrap.com/docs/4.1/getting-started/download/

### 2 - Ajouter les dossier Css et js au projet

> Copier les dossiers css et js dans le dossier webapp

### 3 - Création d'une jsp include pour ajouter les biblioteque dans tous les fichiers

> Dans views on creer un fichier  header.jsp

>> Modifier l'encoding windows --> preferences --> jsp Files --> UTF-8
	
### 4 - Mise en place de bootstrap

	<c:url value="/js" var="jsUrl" />
	<script src="${jsUrl}/jquery-3.3.1.min.js"></script>
	<script src="${jsUrl}/bootstrap.min.js}"></script>
	<c:url value="/css/bootstrap.min.css" var="bootstrapCssUrl"/>
	<link rel="stylesheet" href="${bootstrapCssUrl}"/>
	
	
### 5 - Gestion de l'erreur Bootstrap : 
 
> Dans l'entete du fichier il faut ajouter  : ** isELIgnored="false" **
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
## V - Ajout du mvc

### 1 - Dans le fichier BestOfBlog-servlet.java on ajoute :

	<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:jpa="http://www.springframework.org/schema/data/jpa" 
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context.xsd
        http://www.springframework.org/schema/data/jpa
        http://www.springframework.org/schema/data/jpa/spring-jpa.xsd
		http://www.springframework.org/schema/mvc
		http://www.springframework.org/schema/mvc/spring-mvc.xsd">

	<!-- Activation du scan du package controller pour l'analyse des classes 
		annotées -->
	<context:component-scan base-package="fr.gtm.controller" />

	<mvc:annotation-driven />
	<mvc:resources location="/js/" mapping="/js/**" />
	<mvc:resources location="/css/" mapping="/css/**" />
	
	...
	
	</beans>
	
	
	
### 2 - Mise en place du titre

> Dans le fichier header.jsp
 
	<title>${param.title}</title>
	

> Dans le fichier Welcome.jsp 
	<jsp:param value="Liste des articles" name="title" />

### 3 - Ajout du taglib de spring 

	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

> Pour ne pas prendre les balises autant que balise html on utilise : 
		<spring:escapeBody> ${article.description} </spring:escapeBody>

> Modifier l'entete du fichier web.xml


	<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
			http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
			version="4.0">

> Ajouter le contex param dans web.xml
	
	<context-param>
		<description>Paramétre générique permettant de déclancher l'echappement de caractére HTML dans les JSP</description>
		<param-name>defaultHtmlEscape</param-name>
		<param-value>true</param-value>
	</context-param>

	
	
	
## VI - Mettre en place le logBack

### 1 - Créer un fichier logback.xml dans resources

	<?xml version="1.0" encoding="UTF-8"?>
	<configuration>

		<appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
			<layout class="ch.qos.logback.classic.PatternLayout">
				<Pattern>
					%d{yyyy-MM-dd HH:mm:ss} [%thread] %-5level %logger{36} - %msg%n
				</Pattern>
			</layout>
		</appender>

		<logger name="fr.gtm.SpringBlog" level="debug"
			additivity="false">
			<appender-ref ref="STDOUT" />
		</logger>
		
		<logger name="org.springframework.security" level="debug"
			additivity="false">
			<appender-ref ref="STDOUT" />
		</logger>

		<root level="error">
			<appender-ref ref="STDOUT" />
		</root>

	</configuration>
	
## VII - La suppression

### 1 - Première Méthode :

#### a - Création du bouton supprimer 

	
	<c:url value="/images" var="imgUrl"/>
	
	<a href="/bestOfBlog/delete.html?articleId=${article.id}">
		<img alt="Supprimer" src="${imgUrl}/delete.png"> 
	</a>

#### b - La méthode de suppression
> Création de la méthode deleteArticle  pour supprimer  dans IndexController.java

	
	ModelAndView deleteArticle(@RequestParam Integer articleId) {
		this.articleRepository.deleteById(articleId);
		
		return this.displayIndex();
	}

> Ajouter l'anotation

	@GetMapping("/delete")

### 2- Deuxième Méthode :

#### a - Création du bouton supprimer 

	<c:url value="/delete" var="deleteUrl"/>
	<c:url value="/images" var="imgUrl"/>
	
	<a href="">
		<img alt="Supprimer" src="${imgUrl}/delete.png"> 
	</a>

#### b - La méthode de suppression delete dans IndexController.java

> Création de la methode delete pour supprimer  dans IndexController.java

	@GetMapping("/delete/{articleId}")
	ModelAndView delete(@PathVariable (name="articleId") Integer articleId) {
		this.articleRepository.deleteById(articleId);
		
		return this.displayIndex();
	}


> Ajouter l'anotation

	@GetMapping("/delete/{articleId}")


## VIII - Les formulaires Spring "Modifier l'article "

### 1 - Création de la methode de displayEdit

	@GetMapping("/displayEdit/{articleId}")
	ModelAndView displayEdit(@PathVariable(name = "articleId") Integer articleId) {
		ModelAndView monModelAndViewedit = new ModelAndView("editformul");

		Optional<Article> Monarticlerecup = this.articleRepository.findById(articleId);
		if (Monarticlerecup.isPresent()) {

			monModelAndViewedit.addObject("larticle", Monarticlerecup);
			
		}
		return monModelAndViewedit;
	}

	
### 1 - Création du fichier editformul.jsp

> Ajout du taglib de spring  dans le editformul.jsp

	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

> ajout les balises de formulaire.

	<form:form modelAttribute="editArticle" method="post"
		action="${editUrl}">

		<form:hidden path="id" />

		<div class="form-group">
			<label for="title">Titre :</label>
			<form:input id="title" path="title" cssClass="form-control" />
		</div>

		<div class="form-group">
			<label for="description">description :</label>
			<form:textarea id="description" path="description"
				cssClass="form-control"></form:textarea>

		</div>
		<div class="form-group">
			<form:button>Modifier</form:button>
		</div>

	</form:form>
	
###	2 - Création de la méthode modifier

	@PostMapping("/modify")
	ModelAndView validateEdit(@ModelAttribute Article article) {

		this.articleRepository.save(article);

		return this.displayIndex();
	}
	
	
##	IX - Repository

> - https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories.query-methods

### 1 - dans le repository ArticleRepository

	public interface ArticleRepository extends JpaRepository< Article, Integer> {
	
		List<Article> findAllByTitleContaining(String search);
	}

### 2 - On creer un lien pour la recherche

	<c:url value="/search.zzz" var="searchUrl" />
	<a href="${searchUrl}">Rechercher des articles</a>
	
### 3 - Création de la méthode de redirection pour la recherche 	 dans indexController.java

	@GetMapping("/search")
	String displaySearch() {
		
		return "search";
	}

### 4 - Création de la page search.jsp 

	<form method="post">
		<center>
			<div class="form-group">
				<label class="col-md-4 control-label" for="search">Rechercher
					: </label>
				<div class="col-md-4">
					<input id="search" name="search" type="text" placeholder="Titre"
						class="form-control input-md">
				</div>
				<div class="col-md-4">
					<button class="btn btn-block btn-lg btn-success">Rechercher</button>
				</div>
			</div>
		</center>
	</form>

	<c:if test="${not empty resultList}">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>article</th>
					<th>description</th>
				</tr>
			</thead>
			<c:forEach items="${ resultList }" var="article">
				<tbody>
					<tr>
						<td>${article.id}</td>
						<td>${article.title}</td>
						<td>${article.description}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</c:if>



### 5 - Creation de la méthode rechercher dans IndexController

	@PostMapping("/search")
	ModelAndView validateSearch(@RequestParam String search) {
		final ModelAndView monModelAndView = new ModelAndView("search");
		
		monModelAndView.addObject("resultList", this.articleRepository.findAllByTitleContaining(search));
		return monModelAndView;
	}
	
	
## X - Logging API

### 1 - Présentation 

> Java -> JUL "Problème limité car sorti out uniquement"

- https://docs.oracle.com/javase/7/docs/api/java/util/logging/package-summary.html

> Ils existent plusieurs librairies de log : Log4J, LogBack. ""
- Logger  : est un objet Java qui permet de construire le message et de produire des Logs.	
- Handler / Appender : est une classe Java qui permet de persister les logs.
- Level / Severity : Importance du message .
    | 
>>  |->Fatal > Error > Warning > Info > Debug > Trace

- Formatter : Pattern . Modèle de format des messages.

### 2 - Configuration LogBack

-> le "root"  Logger : Parent de toutes les instances de Logger .
> Chaque Logger  configuré est associé à un package Java et à un level.
	<logger name = "fr.gtm.SpringBlog" level ="info" />
	
> Chaque logger ( même Root ) est associé a 1 ou plusieurs Appender.

Un appender est configuré avec un nom et une classe d'implementation "Destination des logs"

- https://logback.qos.ch/manual/index.html

### 3 - Utilisation du LogBack

Precedement dans le partie VI on a mis en place d'un fichier logBack.xml.

#### 1 - Avoir les log dans un fichier 

	<property name="myPattern"	value="%d{dd/MM/yyyy HH:mm:ss} [%thread] %-5level %logger{36} - %msg%n " />

	<appender name="APPLOG"
		class="ch.qos.logback.core.FileAppender">
		<file>C:\formationJava\Dossier Git\git clone\BlogSpring\SpringBlog\logs\BestOfBLog.log</file>
		<layout class="ch.qos.logback.classic.PatternLayout">
			<Pattern>
				${myPattern}
			</Pattern>
		</layout>
	</appender>

 

	<root level="error">
		<appender-ref ref="STDOUT" />
			<appender-ref ref="APPLOG" />
	</root>



#### b - Utilisation des Log dans le controller IndexController

		private static final Logger LOGGER = LoggerFactory.getLogger(IndexController.class);

> Dans les methode on ajoute :

		...
		...

		
		
## XI - Les Filtres

### 1 - Mise en place des filtres

> dans le web.xml on ajoute


	...
	<filter>
		<filter-name>charEncodingFilter</filter-name>
		<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
		<init-param>
			<param-name>encoding</param-name>
			<param-value>UTF-8</param-value>
		</init-param>
		<init-param>
			<param-name>forceEncoding</param-name>
			<param-value>true</param-value>
		</init-param>
	</filter>
	<filter-mapping>
		<filter-name>charEncodingFilter</filter-name>
		<url-pattern>/*</url-pattern>
	</filter-mapping>
	...	





























	