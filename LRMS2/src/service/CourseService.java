package service;

import java.util.List;

import entity.Course;

public interface CourseService {
	public List<Course> getAllCourse(int user_id);

	public int addCourse(Course course);

	public Course getCourseById(int course_id);

	public boolean updateCourse(Course course);

	public boolean deleteCourse(int course_id);
}
