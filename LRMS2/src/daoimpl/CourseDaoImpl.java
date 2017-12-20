package daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.CourseDao;
import entity.Course;
import entity.Laboratory;

@Repository
public class CourseDaoImpl implements CourseDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Course> getAllCourse(int user_id) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer( "from Course where js_id=?");  
		Query query = session.createQuery(hql.toString());  
		query.setString(0,Integer.toString(user_id));
		return query.list();  
	}

	@Override
	public int addCourse(Course course) {
		Session session=sessionFactory.getCurrentSession();
		int result=0;
		StringBuffer hql =new StringBuffer("from Course where courseNumber=? and js_id=?");  
		Query query = session.createQuery(hql.toString());  
		query.setString(0,course.getCourseNumber());
		query.setInteger(1, course.getJs_id());
		if(query.list().size()!=0){
			return 3;
		} 
		else{
			result=(int)session.save(course);
			return result;
		}
	}

	@Override
	public Course getCourseById(int course_id) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer( "from Course where course_id=?");  
		Query query = session.createQuery(hql.toString());  
		query.setInteger(0, course_id);  
		return (Course) query.uniqueResult();  
	}

	@Override
	public boolean updateCourse(Course course) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer( "update Course set courseName=?,person_number=?,courseDescription=? where course_id=?");
		Query query = session.createQuery(hql.toString()); 
		query.setString(0, course.getCourseName());  
		query.setInteger(1, course.getPerson_number());  
		query.setString(2, course.getCourseDescription());  
		query.setInteger(3, course.getCourse_id());  
		return (query.executeUpdate() > 0);
	}

	@Override
	public boolean deleteCourse(int course_id) {
		StringBuffer hql =new StringBuffer("delete Course  where course_id=?");  
	    Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());  
	    query.setInteger(0, course_id);  
	    return (query.executeUpdate() > 0); 
	}  
}
