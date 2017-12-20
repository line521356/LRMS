package serviceimpl;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDao;
import service.UserService;
import entity.Announcement;
import entity.Course;
import entity.Term;
import entity.User;

@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	
	@Override
	public User login(User user) {
		System.out.println("UserServiceImpl");
		User loginUser=userDao.login(user);
		if(loginUser!=null && loginUser.getIs_firstlogin()==0){
			userDao.update(loginUser);
		}
		return loginUser;
	}

	@Override
	public boolean update(User user) {
		user.setIs_firstlogin(1);
		boolean isupdate=userDao.update(user);
		return isupdate;
	}
	
	@Override
	public List<User> getAllUser(User user){
		return userDao.getAllUser(user);
	}
	
	@Override
	public boolean delUser(User user) {
		boolean isDel=userDao.delUser(user);
		return isDel;
	}

	@Override
	public int addAnnouncement(Announcement announcement) {
		int result=userDao.addAnnouncement(announcement);
		return result;
	}

	@Override
	public List<Announcement> getAnnouncement() {
		return userDao.getAnnouncement();
	}

	@Override
	public int addTerm(Term term) {
		return userDao.addTerm(term);
	}

	@Override
	public List<Term> getTermList() {
		return userDao.getTermList();
	}

	@Override
	public List<Course> getCourseList(int user_id) {
		return userDao.getCourseList(user_id);
	}

	@Override
	public int uploadCourse_User(int js_id,String courseNumber, String courseName, String fileName)throws IOException {

		return userDao.uploadCourse_User(js_id,courseNumber,courseName,fileName);
	}

	@Override
	public int deleteAnnouncement(int publish_id) {
		// TODO Auto-generated method stub
		return userDao.deleteAnnouncement(publish_id);
	}
}
