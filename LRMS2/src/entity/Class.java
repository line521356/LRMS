package entity;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the class database table.
 * 
 */
@Entity
@Table(name="Class")
public class Class implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Class_id")
	private int class_id;

	@Column(name="Class_description")
	private String class_description;

	@Column(name="Class_name")
	private String class_name;

	public Class() {
	}

	public int getClass_id() {
		return this.class_id;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

	public String getClass_description() {
		return this.class_description;
	}

	public void setClass_description(String class_description) {
		this.class_description = class_description;
	}

	public String getClass_name() {
		return this.class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

}