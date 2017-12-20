package entity;

import java.io.Serializable;
import java.util.Date;

public class lab_reservation  {
//	private static final long serialVersionUID = 1L;

	private int lab_id;
	private String building_name;
	private int room_number;
	private int lab_person_number;
	private int is_free;
	private String lab_description;
	
	private int reserve_id;
	private int reserve_type;
	private int course_id;
	private String course_name;
	private String js_name;
	public String getJs_name() {
		return js_name;
	}

	public void setJs_name(String js_name) {
		this.js_name = js_name;
	}
	private Date reserve_date;
	private int time_interval;
	private int weekday;
	private int r_person_number;
	private String r_description;
	private Date create_time;
	
	private long remain_person_number;//剩余人数，即laboratory.person_number-reservation.person_number
	
	public lab_reservation( int lab_id,String building_name,int room_number,int lab_person_number,
			 int reserve_id,int reserve_type,int course_id,String course_name,Date reserve_date,int time_interval,
			 int weekday,int r_person_number,String r_description, Date create_time){
				this.lab_id=lab_id;
				this.building_name=building_name;
				this.room_number=room_number;
				this.lab_person_number=lab_person_number;
				
				 this.reserve_id=reserve_id;
				 this.reserve_type=reserve_type;
				 this.course_id=course_id;
				 this.course_name=course_name;
				 this.reserve_date=reserve_date;
				 this.time_interval=time_interval;
				 this.weekday=weekday;
				 this.r_person_number=r_person_number;
				 this.r_description=r_description;
				 this.create_time=create_time;
				
	}
	
	public lab_reservation( int lab_id,String building_name,int room_number,int lab_person_number,int is_free,String lab_description,
	 int reserve_id,int reserve_type,int course_id,Date reserve_date,int time_interval,
	 int weekday,int r_person_number,String r_description, Date create_time){
		this.lab_id=lab_id;
		this.building_name=building_name;
		this.room_number=room_number;
		this.lab_person_number=lab_person_number;
		this.is_free=is_free;
		this.lab_description=lab_description;
		
		 this.reserve_id=reserve_id;
		 this.reserve_type=reserve_type;
		 this.course_id=course_id;
		 this.reserve_date=reserve_date;
		 this.time_interval=time_interval;
		 this.weekday=weekday;
		 this.r_person_number=r_person_number;
		 this.r_description=r_description;
		 this.create_time=create_time;
		
	}
	public lab_reservation(int lab_id,String building_name,int room_number,int reserve_type,Date reserve_date,int time_interval,long remain_person_number, int is_free){
		this.lab_id=lab_id;
		this.building_name=building_name;
		this.room_number=room_number;
		this.reserve_type=reserve_type;
		this.reserve_date=reserve_date;
		this.time_interval=time_interval;
		this.remain_person_number=remain_person_number;
		this.is_free=is_free;
		
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

	public Date getReserve_date() {
		return reserve_date;
	}

	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}

	public int getReserve_type() {
		return reserve_type;
	}

	public void setReserve_type(int reserve_type) {
		this.reserve_type = reserve_type;
	}

	public int getTime_interval() {
		return time_interval;
	}

	public void setTime_interval(int time_interval) {
		this.time_interval = time_interval;
	}

	public long getRemain_person_number() {
		return remain_person_number;
	}

	public void setRemain_person_number(long remain_person_number) {
		this.remain_person_number = remain_person_number;
	}

	public int getIs_free() {
		return is_free;
	}

	public void setIs_free(int is_free) {
		this.is_free = is_free;
	}
	public int getLab_person_number() {
		return lab_person_number;
	}
	public void setLab_person_number(int lab_person_number) {
		this.lab_person_number = lab_person_number;
	}
	public String getLab_description() {
		return lab_description;
	}
	public void setLab_description(String lab_description) {
		this.lab_description = lab_description;
	}
	public int getReserve_id() {
		return reserve_id;
	}
	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
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
	public int getWeekday() {
		return weekday;
	}
	public void setWeekday(int weekday) {
		this.weekday = weekday;
	}
	public int getR_person_number() {
		return r_person_number;
	}
	public void setR_person_number(int r_person_number) {
		this.r_person_number = r_person_number;
	}
	public String getR_description() {
		return r_description;
	}
	public void setR_description(String r_description) {
		this.r_description = r_description;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
	
}
