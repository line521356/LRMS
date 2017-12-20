package entity;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the reservation database table.
 * 
 */
@Entity
@Table(name="Reservation")
public class Reservation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="Reserve_id")
	private int reserve_id;

	@Column(name="Create_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date create_time;

	@Column(name="Description")
	private String description;

	@Column(name="Lab_id")
	private int lab_id;

	@Column(name="Modify_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modify_time;

	@Column(name="Person_number")
	private int person_number;

	@Column(name="Reserve_date")
	@Temporal(TemporalType.DATE)
	private Date reserve_date;

	@Column(name="Reserve_type")
	private int reserve_type;

	@Column(name="Time_interval")
	private int time_interval;

	@Column(name="User_id")
	private int user_id;

	@Column(name="Weekday")
	private int weekday;
	
	@Column(name="Course_id")
	private int course_id;

	@Column(name="CourseName")
	private String courseName;

	public Reservation() {
	}

	public int getReserve_id() {
		return this.reserve_id;
	}

	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}

	public Date getCreate_time() {
		return this.create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getLab_id() {
		return this.lab_id;
	}

	public void setLab_id(int lab_id) {
		this.lab_id = lab_id;
	}

	public Date getModify_time() {
		return this.modify_time;
	}

	public void setModify_time(Date modify_time) {
		this.modify_time = modify_time;
	}

	public int getPerson_number() {
		return this.person_number;
	}

	public void setPerson_number(int person_number) {
		this.person_number = person_number;
	}

	public Date getReserve_date() {
		return this.reserve_date;
	}

	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}

	public int getReserve_type() {
		return this.reserve_type;
	}

	public void setReserve_type(int reserve_type) {
		this.reserve_type = reserve_type;
	}

	public int getTime_interval() {
		return this.time_interval;
	}

	public void setTime_interval(int time_interval) {
		this.time_interval = time_interval;
	}

	public int getUser_id() {
		return this.user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getWeekday() {
		return this.weekday;
	}

	public void setWeekday(int weekday) {
		this.weekday = weekday;
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
	

}