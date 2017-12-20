package entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the laboratory database table.
 * 
 */
@Entity
@Table(name="Laboratory")
public class Laboratory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="Lab_id")
	private int lab_id;

	@Column(name="Building_name")
	private String building_name;

	@Column(name="Description")
	private String description;

	@Column(name="Is_free")
	private int is_free;

	@Column(name="Person_number")
	private int person_number;

	@Column(name="Room_number")
	private int room_number;

	public Laboratory() {
	}

	public int getLab_id() {
		return this.lab_id;
	}

	public void setLab_id(int lab_id) {
		this.lab_id = lab_id;
	}

	public String getBuilding_name() {
		return this.building_name;
	}

	public void setBuilding_name(String building_name) {
		this.building_name = building_name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getIs_free() {
		return this.is_free;
	}

	public void setIs_free(int is_free) {
		this.is_free = is_free;
	}

	public int getPerson_number() {
		return this.person_number;
	}

	public void setPerson_number(int person_number) {
		this.person_number = person_number;
	}

	public int getRoom_number() {
		return this.room_number;
	}

	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}

}