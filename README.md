# SpringBlog
Projet Blog avec utilisation du Framework Spring
utilisation de LogBack , JSP , 

>> Spring est un framework pour developper des applications d'entreprises qui permet d'avoir un squelette de projet.




// Sources : 

> - https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html
> - https://mvnrepository.com/



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

		<beans xmlns="http://www.springframework.org/schema/beans"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
		xmlns:context="http://www.springframework.org/schema/context"
		xsi:schemaLocation="http://www.springframework.org/schema/beans
	        http://www.springframework.org/schema/beans/spring-beans.xsd
	        http://www.springframework.org/schema/context
	        http://www.springframework.org/schema/context/spring-context.xsd">
		...












































 

	
	