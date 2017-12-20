package entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the course database table.
 * 
 */
@Entity
@Table(name="Term")
public class Term implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="Term_id")
	private int term_id;

	@Column(name="Term_name")
	private String term_name;
	
	@Column(name="From_date")
	private String from_date;
	
	@Column(name="End_date")
	private String end_date;
	
	@Column(name="Description")
	private String description;

	public Term() {
	}

	public int getTerm_id() {
		return term_id;
	}

	public void setTerm_id(int term_id) {
		this.term_id = term_id;
	}

	public String getTerm_name() {
		return term_name;
	}

	public void setTerm_name(String term_name) {
		this.term_name = term_name;
	}

	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from) {
		this.from_date = from;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end) {
		this.end_date = end;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String Description) {
		this.description = Description;
	}


}