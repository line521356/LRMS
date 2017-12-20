package daoimpl;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.StringUtils;

import dao.UserDao;
import entity.Announcement;
import entity.Course;
import entity.Course_user;
import entity.Laboratory;
import entity.Term;
import entity.User;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		Session  session =sessionFactory.getCurrentSession();
//		StringBuffer hql=new StringBuffer("from User where login_name=? and password=? and user_type=?");
		StringBuffer hql=new StringBuffer("from User where login_name=? and password=? ");
		Query query = session.createQuery(hql.toString());
		query.setString(0,user.getLogin_name());
		query.setString(1,user.getPassword());
//		query.setInteger(2,user.getUser_type());
		return (User) query.uniqueResult();
	}
	
	//用户登陆之后设置为非第一次登陆&&更新密码
	@Override
	public boolean update(User user){
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql=new StringBuffer("update User set");
		System.out.println(user.getIs_firstlogin()==0);
		if(user.getIs_firstlogin()==1){//修改密码
			hql.append(" password="+"'"+user.getPassword()+"'");
		}else{//设置其为非第一次登陆
			hql.append(" is_firstlogin="+1);
		}
		if(user.getUser_id()!=0){
			hql.append("  where User_id="+user.getUser_id());
		}else{
			hql.append("  where Login_name="+"'"+user.getLogin_name()+"'");
		}
		
		Query query=session.createQuery(hql.toString());
		return(query.executeUpdate()>0);
	}

	//查找用户信息
	 @Override  
     public List<User> getAllUser(User user) {//查找所有用户信息  
		 Session session=sessionFactory.getCurrentSession();
		 StringBuffer hql =new StringBuffer( "from User where user_type="+"'"+user.getUser_type()+"'");  
		 Query query = session.createQuery(hql.toString());  
		 return query.list();  
	 }  
	 
	 @Override  
	 public boolean delUser(User user) {//删除用户  
		 StringBuffer hql =new StringBuffer("delete User  where user_id=?");  
	     Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());  
	     query.setInteger(0, user.getUser_id());  
	     return (query.executeUpdate() > 0);  
	 }

	@Override
	public int addAnnouncement(Announcement announcement) {
		Session session=sessionFactory.getCurrentSession();
		int result=(int)session.save(announcement);
		return result;
	}

	@Override
	public List<Announcement> getAnnouncement() {
		 Session session=sessionFactory.getCurrentSession();
		 StringBuffer hql =new StringBuffer( "from Announcement order by create_time DESC");  
		 Query query = session.createQuery(hql.toString());  
		 return query.list(); 
	}

	@Override
	public int addTerm(Term term) {
		Session session=sessionFactory.getCurrentSession();
		int result=(int)session.save(term);
		return result;
	}

	@Override
	public List<Term> getTermList() {
		 Session session=sessionFactory.getCurrentSession();
		 StringBuffer hql =new StringBuffer( "from Term where end_date>curdate()");  
		 Query query = session.createQuery(hql.toString());  
		 return query.list(); 
	}

	@Override
	public List<Course> getCourseList(int user_id) {
		Session session=sessionFactory.getCurrentSession();
		 StringBuffer hql =new StringBuffer( "from Course where js_id="+user_id);  
		 Query query = session.createQuery(hql.toString());  
		 return query.list(); 
	}

	@Override
	public int uploadCourse_User(int js_id,String courseNumber, String courseName, String fileName) throws IOException {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer( "from Course where js_id="+js_id+" and courseNumber="+courseNumber);  
		Query query = session.createQuery(hql.toString()); 
		if(query.list().size()==0){
			return 0;
		}
		else{
			 int result=0;
//			InputStream is = new FileInputStream(fileName);
			InputStream is = new FileInputStream("");
			XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
			 ArrayList<Course_user> list = new ArrayList<Course_user>();
			 for (XSSFSheet xssfSheet : xssfWorkbook) {
			      if (xssfSheet == null) {
			           continue;
			      }
			      // Read the Row
			      for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
			         XSSFRow xssfRow = xssfSheet.getRow(rowNum);
			         int minColIx=xssfRow.getFirstCellNum();
			         int maxColIx=xssfRow.getLastCellNum();
			         
			         if (xssfRow != null) {
			        	 Course_user course_user=new Course_user();
			        	 Course course=getCourseByNumber(courseNumber);
			        	 course_user.setCourse_id(course.getCourse_id());
			        	 course_user.setCourse_name(course.getCourseName());
			        	
			        	 User user=getUserByLoginName(xssfRow.getCell(0).toString());
			        	 course_user.setUser_id(user.getUser_id());
			        	 course_user.setUser_name(xssfRow.getCell(1).toString());
			        	 course_user.setSumscore(0);
			        	 result=(int)session.save(course_user);
			              }
			      }
			  }
			 return result;
		}
	}  
	
	public Course getCourseByNumber(String courseNumber) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer("from Course where courseNumber='"+courseNumber+"'");  
		Query query = session.createQuery(hql.toString());  
		return (Course) query.uniqueResult();  
	}
	
	public User getUserByLoginName(String login_name) {
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql =new StringBuffer("from User where login_name="+login_name);  
		Query query = session.createQuery(hql.toString());  
		return (User) query.uniqueResult();  
	}

	@Override
	public int deleteAnnouncement(int publish_id) {
		 StringBuffer hql =new StringBuffer("delete Announcement  where publish_id=?");  
	     Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());  
	     query.setInteger(0, publish_id);  
	     return query.executeUpdate() ;  
	}
}
