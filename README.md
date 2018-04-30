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

