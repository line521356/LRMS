package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Announcement;
import entity.Reservation;
import entity.Term;
import entity.User;
import other.ExecResult;
import service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("login")
	@ResponseBody
	public ExecResult login(User user,HttpSession session){
		ExecResult er=new ExecResult();
		User loginuser=userService.login(user);
		System.out.println(loginuser);
		if(loginuser==null){
			er.setMsg("用户名或者密码错误");
			er.setSuccess(false);
		}else{
			session.setAttribute("loginuser", loginuser);		
			er.setMsg("恭喜您，登陆成功！");
			er.setSuccess(true);
		}
		return er;
		
	}		
	@RequestMapping("index")
	public ModelAndView toMain(){
		ModelAndView view=new ModelAndView("index");
		List<Announcement> announcementList=userService.getAnnouncement();
		view.addObject("announcementList",announcementList);
		return view;
	}
	@RequestMapping("toLogin")
	public ModelAndView toLogin(){
		ModelAndView view=new ModelAndView("login");
		return view;
	}
	
	//首页显示公告列表
	@RequestMapping("AnnouncementList")
	public ModelAndView AnnouncementList(){
		ModelAndView view=new ModelAndView("AnnouncementList");
		List<Announcement> announcementList=userService.getAnnouncement();
		view.addObject("list",announcementList);
		return view;
	}
	
	@RequestMapping("changePwd")
	@ResponseBody
	public ExecResult changePwd(User user,HttpSession session){
		ExecResult er=new ExecResult();
		boolean isupdate=userService.update(user);
		if(isupdate){
			er.setMsg("恭喜亲，你是第一个密码修改成功的人哟！");
			er.setSuccess(true);
		}
		else{
			er.setMsg("修改失败，亲，不要伤心，下次还可以修改");
			er.setSuccess(false);
		}
		return er;
	}
	
	@RequestMapping("userList")
	public ModelAndView getAllUser(User user,int user_type){
		ModelAndView view=new ModelAndView("userList");
		user.setUser_type(user_type);
		List<User> userList=userService.getAllUser(user);
		view.addObject("userList",userList);
		view.addObject("user_type",user_type);		
		return view;
	}
	
	@RequestMapping("deleteUser")
	@ResponseBody
	public ExecResult deleteUser(User user,HttpSession session){
		ExecResult er=new ExecResult();
		boolean isDel=userService.delUser(user);
		if(isDel){
			er.setMsg("删除成功");
			er.setSuccess(true);
		}
		else{
			er.setMsg("删除失败");
			er.setSuccess(false);
		}
		return er;
	}
	
	@RequestMapping("addAnnouncement")
	@ResponseBody
	public ExecResult addAnnouncement(HttpServletRequest request,HttpSession session) throws ParseException{
		ExecResult er=new ExecResult();
		Announcement announcement=new Announcement();
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    Date create_time = sdf.parse(request.getParameter("create_time"));
//		System.out.println("创建时间:"+create_time);
		announcement.setTitle(title);
		announcement.setContent(content);
		announcement.setCreate_time(create_time);
		int result=userService.addAnnouncement(announcement);
		if(result>0){
			er.setMsg("公告发布成功");
			er.setSuccess(true);
		}
		else{
			er.setMsg("公告发布失败");
			er.setSuccess(false);
		}
		return er;
		}
	
	@RequestMapping("addTerm")
	@ResponseBody
	public ExecResult addTerm(HttpServletRequest request,HttpSession session) throws ParseException{
		ExecResult er=new ExecResult();
		Term term=new Term();
		
		String term_name=request.getParameter("term_name");
		String description=request.getParameter("description");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");  
		Date from =(Date)sdf1.parse(request.getParameter("from"));
//		System.out.println("开始日期:"+from);
		Date end =(Date)sdf1.parse(request.getParameter("end"));
//		System.out.println("结束日期:"+end);
		term.setTerm_name(term_name);
		term.setFrom_date(request.getParameter("from"));
		term.setEnd_date(request.getParameter("end"));
		term.setDescription(description);
//		System.out.println(description);
		
		int result=userService.addTerm(term);
		if(result>0){
			er.setMsg("新增学期成功");
			er.setSuccess(true);
		}
		else{
			er.setMsg("新增学期失败");
			er.setSuccess(false);
		}
		return er;
		}


	@RequestMapping("uploadCourse_User")
	@ResponseBody
	public ExecResult uploadCourse_User(HttpServletRequest request,HttpSession session)throws IOException {
		ExecResult er=new ExecResult();
		System.out.println("uploadCourse_User:");
		int js_id=Integer.parseInt(request.getParameter("js_id"));
		String courseNumber=request.getParameter("courseNumber");
		String courseName=request.getParameter("courseName");
		String fileName=request.getParameter("fileName");
		
		System.out.println("user_id:"+js_id);
		System.out.println("courseName:"+courseName);
		System.out.println("fileName:"+fileName);
		
		int result=userService.uploadCourse_User(js_id,courseNumber,courseName,fileName);
		if(result>0){
			er.setMsg("上传成功");
			er.setSuccess(true);
		}
		else{
			er.setMsg("您未教授此课程，故不能上传相关花名册");
			er.setSuccess(false);
		}
		return er;
		
	}
	
	//删除公告页面  显示公告列表
	@RequestMapping("ManageAnnouncementList")
	public ModelAndView ManageAnnouncementList(){
		ModelAndView view=new ModelAndView("deleteAnnouncementList");
		List<Announcement> announcementList=userService.getAnnouncement();
		view.addObject("list",announcementList);
		return view;
	}
	@RequestMapping("deleteAnnouncement")
	@ResponseBody
	public ExecResult deleteAnnouncement(HttpServletRequest request,HttpSession session){
		ExecResult er=new ExecResult();
		int publish_id=Integer.parseInt(request.getParameter("publish_id"));
		int result=userService.deleteAnnouncement(publish_id);
		if(result>0){
			er.setMsg("删除成功");
			er.setSuccess(true);
		}
		else{
			er.setMsg("删除失败");
			er.setSuccess(false);
		}
		return er;
		
	}
	
	/*public static List<essay> ReadExcelFile(String path) throws IOException{
		 InputStream is = new FileInputStream(path);
		 XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
		 ArrayList<essay> list = new ArrayList<essay>();
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
		              essay EachEssay=new essay();
		              EachEssay.setEssayID(xssfRow.getCell(0).toString());
		              EachEssay.setPaper(xssfRow.getCell(1).toString());
		              EachEssay.setScore(Float.parseFloat(xssfRow.getCell(2).toString()));
		              list.add(EachEssay);
		              }
		          }
		       }
//		       for(int i=0;i<list.size();i++){
//                 System.out.println(list.get(i).getEssayID());
//
//		       }
		       return list;
	}*/


}