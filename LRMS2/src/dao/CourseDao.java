package dao;


import java.util.List;

import entity.Course;
import entity.User;

public interface CourseDao {
	 public List<Course> getAllCourse(int user_id);

	public int addCourse(Course course);

	public Course getCourseById(int course_id);

	public boolean updateCourse(Course course);

	public boolean deleteCourse(int course_id);
}
