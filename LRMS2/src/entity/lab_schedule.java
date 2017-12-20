package entity;

import java.io.Serializable;


import java.util.Date;


/**
 * The persistent class for the schedule database table.
 * 
 */
public class lab_schedule {
//	private static final long serialVersionUID = 1L;
	
	private int lab_id;

	private String building_name;
	private int room_number;
	private int person_number;

	private Date schedule_date;

	private int t1;
	private int t1_free;
	private int t2;
	private int t2_free;
	private int t3;
	private int t3_free;
	private int t4;
	private int t4_free;
	private int t5;
	private int t5_free;
//	public lab_schedule(){}
	public lab_schedule(int lab_id, String building_name, int room_number, int person_number){
		this.lab_id=lab_id;
		this.building_name=building_name;
		this.room_number=room_number;
		this.person_number=person_number;
	}
	public lab_schedule(int lab_id, String building_name, int room_number, int person_number, Date schedule_date,
		int t1, int t1_free, int t2, int t2_free, int t3, int t3_free, int t4, int t4_free, int t5, int t5_free) {
		this.lab_id=lab_id;
		this.building_name=building_name;
		this.room_number=room_number;
		this.person_number=person_number;
		this.schedule_date=schedule_date;
		this.t1=t1;
		this.t1_free=t1_free;
		this.t2=t2;
		this.t2_free=t2_free;
		this.t3=t3;
		this.t3_free=t3_free;
		this.t4=t4;
		this.t4_free=t4_free;
		this.t5=t5;
		this.t5_free=t5_free;
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

	public int getPerson_number() {
		return person_number;
	}

	public void setPerson_number(int person_number) {
		this.person_number = person_number;
	}

	public Date getSchedule_date() {
		return schedule_date;
	}

	public void setSchedule_date(Date schedule_date) {
		this.schedule_date = schedule_date;
	}

	public int getT1() {
		return t1;
	}

	public void setT1(int t1) {
		this.t1 = t1;
	}

	public int getT1_free() {
		return t1_free;
	}

	public void setT1_free(int t1_free) {
		this.t1_free = t1_free;
	}

	public int getT2() {
		return t2;
	}

	public void setT2(int t2) {
		this.t2 = t2;
	}

	public int getT2_free() {
		return t2_free;
	}

	public void setT2_free(int t2_free) {
		this.t2_free = t2_free;
	}

	public int getT3() {
		return t3;
	}

	public void setT3(int t3) {
		this.t3 = t3;
	}

	public int getT3_free() {
		return t3_free;
	}

	public void setT3_free(int t3_free) {
		this.t3_free = t3_free;
	}

	public int getT4() {
		return t4;
	}

	public void setT4(int t4) {
		this.t4 = t4;
	}

	public int getT4_free() {
		return t4_free;
	}

	public void setT4_free(int t4_free) {
		this.t4_free = t4_free;
	}

	public int getT5() {
		return t5;
	}

	public void setT5(int t5) {
		this.t5 = t5;
	}

	public int getT5_free() {
		return t5_free;
	}

	public void setT5_free(int t5_free) {
		this.t5_free = t5_free;
	}

	
}