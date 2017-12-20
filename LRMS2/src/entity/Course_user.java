package entity;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the `class-student` database table.
 * 
 */
@Entity
@Table(name="Course_user")
public class Course_user implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="Id")
	private int id;

	@Column(name="Course_id")
	private int course_id;
	
	@Column(name="Course_name")
	private String course_name;

	@Column(name="User_id")
	private int user_id;
	
	@Column(name="User_name")
	private String user_name;

	@Column(name="Sumscore")
	private int sumscore;

	public Course_user() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getSumscore() {
		return sumscore;
	}

	public void setSumscore(int sumscore) {
		this.sumscore = sumscore;
	}


}