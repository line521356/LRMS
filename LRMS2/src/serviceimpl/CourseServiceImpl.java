package serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.CourseDao;
import dao.UserDao;
import service.CourseService;
import service.UserService;
import entity.Course;
import entity.User;

@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class CourseServiceImpl implements CourseService {
	@Autowired
	private CourseDao courseDao;

	//根据教师id获得该教师所教课程list
	@Override
	public List<Course> getAllCourse(int user_id) {
		List<Course> courseList=courseDao.getAllCourse(user_id);
		return courseList;
	}

	@Override
	public int addCourse(Course course) {
		return courseDao.addCourse( course);
	}

	@Override
	public Course getCourseById(int course_id) {
		return courseDao.getCourseById( course_id);
	}

	@Override
	public boolean updateCourse(Course course) {
		return courseDao.updateCourse( course);
	}

	@Override
	public boolean deleteCourse(int course_id) {
		return courseDao.deleteCourse( course_id);
	}
	
	
}
