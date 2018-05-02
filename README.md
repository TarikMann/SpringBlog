# SpringBlog
Projet Blog avec utilisation du Framework Spring.
>Utilisation de JavaEE/ Maven / TomCat / LogBack / JSP / JSTL.

>> Spring est un framework pour developper des applications d'entreprises qui permet d'avoir un squelette de projet.




// Sources : 

> - https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html
> - https://mvnrepository.com/

I - Mise en place de l'infrastructure.

1- Ajout du Build 

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
	
	
2 - Ajout du LogBag

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

3 - Ajouter les dependances manquantes.

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


4 - Configuration du fichier web.xml

		...
		<servlet>
			<servlet-name>BestofBlog</servlet-name>
			<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		</servlet>
		...


5 - Creation d'un fichier XML dans les ressources avec le nom de la servlet

> Dans le fichier Creer  :

		<?xml version="1.0" encoding="UTF-8"?>
		<beans xmlns="http://www.springframework.org/schema/beans"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:schemaLocation="http://www.springframework.org/schema/beans
				http://www.springframework.org/schema/beans/spring-beans.xsd">
		// Le Corp du beans
		</beans>
	
	
6 - Création de la couche Domaine : 

> Création de la classe Article.java
	
		private Integer id;
		private String title;
		private String description;

		
7 - On rempli le corp du Beans :  BestOfBlog-servlet.xml 
	
		...
		<bean id="article" class="fr.gtm.domaine.Article">
	
			<constructor-arg type="Integer" value="1" />
			<constructor-arg type="String" value="Article n°1" />
			<constructor-arg type="String" value="Super description ..." />
	
		</bean>
		...


8 -  Creation du Controller  : IndexController.java

>> Utilisation des annotations   : @Controller , @RequestMapping

		@Controller
		public class IndexController {

			@RequestMapping(path="/", method = RequestMethod.GET)
			ModelAndView displayIndex() {
				
				ModelAndView monModelAndView = new ModelAndView("index");
				return monModelAndView;
			}

		}


		
9 - Modification de l'entete du beans

		<!-- Bean Metier basique -->
		<beans xmlns="http://www.springframework.org/schema/beans"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
		xmlns:context="http://www.springframework.org/schema/context"
		xsi:schemaLocation="http://www.springframework.org/schema/beans
	        http://www.springframework.org/schema/beans/spring-beans.xsd
	        http://www.springframework.org/schema/context
	        http://www.springframework.org/schema/context/spring-context.xsd">
		...


10 - gestion du chemin de la servlet 
> dans web.xml

	<servlet-mapping>
		<servlet-name>BestofBlog</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>


11 - Configuration des pages JSP

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

>> Deplacement du fichier "BestOfBlog-servlet.xml" dans le WEB-INF

12 - faire une redirection vers une autre pages.

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




12- Creation du fichier welcome.jsp

> Creation du dossier views dans Web-INF
>> Creation du fichier welcome.jsp

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

	
	
13- modification de IndexController.java
		
		
		
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





II - Integration Hibernate.

1 -  Ajout des dependences Hibernate/JPA, JAXB et Mysql

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
		
2 - Creation du fichier "persistence.xml"

> creation d'un fichier dans  src --> main --> webapp --> META-INF --> persistence.xml

		
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

> Definir les entité " Classe Java <--> Table SQL "
> Pour Chaque entité 
>>  1- Definir un Identifiant  " ID <--> PK "
>>  2- Definir les propriétés  " Attribut Java <--> Colonne SQL "
>>  3- Definir les relations entre les entités
>>>   - OneToMany <--> FK
>>>   - ManyToMany <--> FK 
>>>   - ManyToMany <--> Table intermediaire + 2 FK


3 - Ajout des annotation et definition des entitées dans la classe Article.java

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
			private String description;
			
			...
			
			}

			
4- Configuration de JPA 

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


 
 5- Ajout de l'entete  spring JPA  pour le  BestofBlog-servlet.java 
 
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
	
	
6- ajout et configuration des Repository	
	
	<!-- Repository -->
	<jpa:repositories base-package="fr.gtm.repository" />
	
	
	Creation de l'interface ArticleRepository
	
	public interface ArticleRepository extends JpaRepository< Article, Integer> {

	}

	
	
	
	
	
	
	
	
	
	
	
	