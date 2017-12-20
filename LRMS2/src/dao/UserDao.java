package dao;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import entity.Announcement;
import entity.Course;
import entity.Term;
import entity.User;

public interface UserDao {
	public User login(User user);
	public boolean update(User user);
	public List<User> getAllUser(User user);
	public boolean delUser(User user);
	public int addAnnouncement(Announcement announcement);
	public List<Announcement> getAnnouncement();
	public int addTerm(Term term);
	public List<Term> getTermList();
	public List<Course> getCourseList(int user_id);
	public int uploadCourse_User(int js_id,String courseNumber, String courseName, String fileName) throws IOException;
	public int deleteAnnouncement(int publish_id);
	
}
