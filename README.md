# SpringBlog
Projet Blog avec utilisation du Framework Spring
utilisation de LogBack , JSP , 


1- Ajout du Build 

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

2 - ajout du LogBag

LogBack permet d'avoir des logs.


		<!-- https://mvnrepository.com/artifact/ch.qos.logback/logback-classic -->
		<dependency>
			<groupId>ch.qos.logback</groupId>
			<artifactId>logback-classic</artifactId>
			<version>1.2.3</version>
		</dependency>
		

3 - Ajouter les dependances manquantes


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

	<servlet>
		<servlet-name>BestofBlog</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
	</servlet>

5 - Creation d'un fichier XML dans les resrouce avec le nom du nom de la servlet

