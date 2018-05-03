package fr.gtm.domaine;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

//@Component : Annotation permettant de déclarer un bean Spring.

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

	// Constructeur
	public Article() {
		super();
	}

	public Article(Integer id, String title, String description) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
	}

	public Article( String title, String description) {
		super();
		this.title = title;
		this.description = description;
	}

	// Get & Set

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", description=" + description + "]";
	}

}
