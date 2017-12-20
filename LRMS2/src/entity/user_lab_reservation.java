package entity;

import java.util.Date;

public class user_lab_reservation  {
//	private static final long serialVersionUID = 1L;

	private int lab_id;
	private String building_name;
	private int room_number;
	
	private int reserve_id;
	private int reserve_type;
	private int course_id;
	private String course_name;
	private Date reserve_date;
	private int time_interval;
	private int weekday;
	private int person_number;
	private String description;
	private Date create_time;
	
	private int user_id;
	private String login_name;
	private String user_name;
	private int user_type;
	
	
	public user_lab_reservation(int lab_id,String building_name,int room_number,
int reserve_id,int reserve_type,int course_id,String course_name,Date reserve_date,int time_interval,int person_number,String description,Date create_time,
String login_name,String user_name,int user_type){
		this.lab_id=lab_id;
		this.building_name=building_name;
		this.room_number=room_number;
		
		this.reserve_id=reserve_id;
		this.reserve_type=reserve_type;
		this.course_id=course_id;
		this.course_name=course_name;
		this.reserve_date=reserve_date;
		this.time_interval=time_interval;
		this.person_number=person_number;
		this.description=description;
		this.create_time=create_time;
		
		this.login_name=login_name;
		this.user_name=user_name;
		this.user_type=user_type;
	}


	public int getLab_id() {
		return lab_id;
	}


	public void setLab_id(int lab_id) {
		this.lab_id = lab_id;
	}


	public String getBuilding_name() {
		return building_name;
	}


	public void setBuilding_name(String building_name) {
		this.building_name = building_name;
	}


	public int getRoom_number() {
		return room_number;
	}


	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}


	public int getReserve_id() {
		return reserve_id;
	}


	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}


	public int getReserve_type() {
		return reserve_type;
	}


	public void setReserve_type(int reserve_type) {
		this.reserve_type = reserve_type;
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


	public Date getReserve_date() {
		return reserve_date;
	}


	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}


	public int getTime_interval() {
		return time_interval;
	}


	public void setTime_interval(int time_interval) {
		this.time_interval = time_interval;
	}


	public int getWeekday() {
		return weekday;
	}


	public void setWeekday(int weekday) {
		this.weekday = weekday;
	}


	public int getPerson_number() {
		return person_number;
	}


	public void setPerson_number(int person_number) {
		this.person_number = person_number;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Date getCreate_time() {
		return create_time;
	}


	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public String getLogin_name() {
		return login_name;
	}


	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public int getUser_type() {
		return user_type;
	}


	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	
	
}
