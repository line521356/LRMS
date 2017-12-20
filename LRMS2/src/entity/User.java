package entity;

import java.io.Serializable;

import javax.persistence.*;

/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name="User")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "User_id")
	private int user_id;
	
	@Column(name = "Age")
	private int age;
	
	@Column(name = "Institute")
	private String institute;
	
	@Column(name = "Is_firstlogin")
	private int is_firstlogin;

	@Column(name = "Login_name")
	private String login_name;

	@Column(name = "Major")
	private String major;

	@Column(name = "Password")
	private String password;

	@Column(name = "Sex")
	private int sex;

	@Column(name = "User_name")
	private String user_name;

	@Column(name = "User_type")
	private int user_type;

	public User() {
	}

	public int getUser_id() {
		return this.user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getInstitute() {
		return this.institute;
	}

	public void setInstitute(String institute) {
		this.institute = institute;
	}

	public int getIs_firstlogin() {
		return this.is_firstlogin;
	}

	public void setIs_firstlogin(int is_firstlogin) {
		this.is_firstlogin = is_firstlogin;
	}

	public String getLogin_name() {
		return this.login_name;
	}

	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}

	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getSex() {
		return this.sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getUser_name() {
		return this.user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUser_type() {
		return this.user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}

}