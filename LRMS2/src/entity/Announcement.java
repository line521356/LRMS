package entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the announcement database table.
 * 
 */
@Entity
@Table(name="Announcement")
public class Announcement implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="Publish_id")
	private int publish_id;

	@Column(name="Content")
	private String content;

	@Column(name="Title")
	private String title;

	@Column(name="Create_time")
	@Temporal(TemporalType.TIMESTAMP)
	private Date create_time;

	public Announcement() {
	}

	public int getPublish_id() {
		return this.publish_id;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public void setPublish_id(int publish_id) {
		this.publish_id = publish_id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}