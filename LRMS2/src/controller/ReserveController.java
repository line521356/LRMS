package controller;




import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import other.ExecResult;
import entity.Announcement;
import entity.Course;
import entity.Laboratory;
import entity.Reservation;
import entity.Term;
import entity.lab_reservation;
import entity.lab_schedule;
import entity.user_lab_reservation;
import service.LaboratoryService;
import service.ReserveLaboratoryService;
import service.UserService;

import org.apache.commons.lang.StringUtils;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveLaboratoryService reserveLaboratoryService;
	@Autowired
	private LaboratoryService laboratoryService;
	@Autowired
	private UserService userService;

	@RequestMapping("getLabReserveById")
	public ModelAndView getLabReserveById(HttpServletRequest request,HttpSession session){
		ModelAndView view=new ModelAndView("reservation");
		int lab_id=Integer.parseInt(request.getParameter("lab_id"));
		int user_id=Integer.parseInt(request.getParameter("user_id"));
		List<lab_reservation> lab_reservation_list=reserveLaboratoryService.getLab_reservations(lab_id);
		view.addObject("lab_reservation_list",lab_reservation_list);
		view.addObject("lab_id", lab_id);
		
		List<Term> termList=userService.getTermList();
		view.addObject("termList",termList);
		
		List<Course> courseList=userService.getCourseList(user_id);
		view.addObject("courseList",courseList);
		
		return view;
	}
	
	@RequestMapping("reserveLab")
	@ResponseBody
	public ExecResult reserveLab(HttpSession session,HttpServletRequest request) throws ParseException{
		ExecResult er=new ExecResult();
		System.out.println("LaboratoryController - addLab");
		Reservation reservation=new Reservation();
		
		if(StringUtils.isNotBlank(request.getParameter("course_id"))){
			reservation.setCourse_id(Integer.parseInt(request.getParameter("course_id")));
		}
		if(StringUtils.isNotBlank(request.getParameter("lab_id"))){
			reservation.setLab_id(Integer.parseInt(request.getParameter("lab_id")));
		}
		if(StringUtils.isNotBlank(request.getParameter("user_id"))){
			reservation.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		}
		if(StringUtils.isNotBlank(request.getParameter("reserve_type"))){
			reservation.setReserve_type(Integer.parseInt(request.getParameter("reserve_type")));
		}
		if(StringUtils.isNotBlank(request.getParameter("time_interval"))){
			reservation.setTime_interval(Integer.parseInt(request.getParameter("time_interval")));
		}
		if(StringUtils.isNotBlank(request.getParameter("weekday"))){
			reservation.setWeekday(Integer.parseInt(request.getParameter("weekday")));
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    Date create_time = sdf.parse(request.getParameter("create_time"));
	    reservation.setCreate_time(create_time);
	    
	    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");  
	    if(Integer.parseInt(request.getParameter("reserve_type"))==1){
		    if(StringUtils.isNotBlank(request.getParameter("person_number"))){
				reservation.setPerson_number(Integer.parseInt(request.getParameter("person_number")));
			}
		    Date reserve_date =(Date)sdf1.parse(request.getParameter("reserve_date"));
		    reservation.setReserve_date(reserve_date);
	    }
	    else{
	    	if(StringUtils.isNotBlank(request.getParameter("person_number2"))){
				reservation.setPerson_number(Integer.parseInt(request.getParameter("person_number2")));
			}
		    Date reserve_date = sdf1.parse(request.getParameter("reserve_date2"));
		    reservation.setReserve_date(reserve_date);
	    }
		
		if(StringUtils.isNotBlank(request.getParameter("modify_time"))){
			Date modify_time = sdf.parse(request.getParameter("modify_time"));
			reservation.setModify_time(modify_time);
		}
		if(StringUtils.isNotBlank(request.getParameter("courseName"))){
			reservation.setCourseName(request.getParameter("courseName"));
		}
		if(StringUtils.isNotBlank(request.getParameter("description"))){
			reservation.setDescription(request.getParameter("description"));
		}
		
		int result=(int)reserveLaboratoryService.reserveLab(reservation);
		if(result>0){
			er.setMsg("恭喜您，预约成功");
			er.setSuccess(true);
		}
		else{
			er.setMsg("实验室可供预约人数不够");
			er.setSuccess(false);
		}
		return er;
	}	
	
	@RequestMapping("schedule_table")
	public ModelAndView schedule_table(HttpServletRequest request,HttpSession session){
		ModelAndView view=new ModelAndView("schedule_table");
		int lab_id=Integer.parseInt(request.getParameter("lab_id"));
		List<lab_schedule> list=reserveLaboratoryService.getSchedule_table(lab_id);
		List<Laboratory> labList=laboratoryService.getAllLab();
		view.addObject("labList",labList);
		view.addObject("list",list);
		return view;
	}
	
	//显示某个用户所有预约信息列表
	@RequestMapping("reservationByUser")
	public ModelAndView reservationByUser(HttpServletRequest request,HttpSession session){
		ModelAndView view=new ModelAndView("manage_reservation_info");
		int user_id=Integer.parseInt(request.getParameter("user_id"));
		int user_type=Integer.parseInt(request.getParameter("user_type"));
		List<lab_reservation> list=reserveLaboratoryService.reservationByUser(user_id);
		view.addObject("list",list);
		
		if(user_type==2){//获得属于该学生所在课堂的预约信息
			List<lab_reservation> list2=reserveLaboratoryService.ReservationTeacherForStudent(user_id);
			view.addObject("list2",list2);
		}
		return view;
	}
	
	/*//显示某个用户某条预约信息，并显示在update_reservation页面中
	@RequestMapping("single_reservation_info")
	public ModelAndView single_reservation_info(HttpServletRequest request,HttpSession session){
		ModelAndView view=new ModelAndView("update_reservation");
		int reserve_id=Integer.parseInt(request.getParameter("reserve_id"));
		lab_reservation lab_reservation=reserveLaboratoryService.single_reservation_info(reserve_id);
		view.addObject("lab_reservation",lab_reservation);
		return view;
	}*/
	
	
	@RequestMapping("deleteReservation")
	@ResponseBody
	public ExecResult deleteReservation(HttpSession session,HttpServletRequest request) {
		ExecResult er=new ExecResult();
		int reserve_id=Integer.parseInt(request.getParameter("reserve_id"));
		int result=(int)reserveLaboratoryService.deleteReservation(reserve_id);
		if(result>0){
			er.setMsg("恭喜您，成功取消预约");
			er.setSuccess(true);
		}
		else{
			er.setMsg("取消预约失败");
			er.setSuccess(false);
		}
		return er;
	}
	
	//课堂预约
	@RequestMapping("reserveLab2")
	@ResponseBody
	public ExecResult reserveLab2(HttpSession session,HttpServletRequest request) throws ParseException{
		ExecResult er=new ExecResult();
		int result=0;
		Reservation reservation=new Reservation();
		if(StringUtils.isNotBlank(request.getParameter("lab_id"))){
			reservation.setLab_id(Integer.parseInt(request.getParameter("lab_id")));
		}
		if(StringUtils.isNotBlank(request.getParameter("user_id"))){
			reservation.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		}
		if(StringUtils.isNotBlank(request.getParameter("reserve_type"))){
			reservation.setReserve_type(Integer.parseInt(request.getParameter("reserve_type")));
		}
		if(StringUtils.isNotBlank(request.getParameter("course_id"))){
			reservation.setCourse_id(Integer.parseInt(request.getParameter("course_id")));
		}
		if(StringUtils.isNotBlank(request.getParameter("time_interval"))){
			reservation.setTime_interval(Integer.parseInt(request.getParameter("time_interval")));
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    Date create_time = sdf.parse(request.getParameter("create_time"));
	    reservation.setCreate_time(create_time);
	    if(StringUtils.isNotBlank(request.getParameter("modify_time"))){
			Date modify_time = sdf.parse(request.getParameter("modify_time"));
			reservation.setModify_time(modify_time);
		}
	    if(StringUtils.isNotBlank(request.getParameter("description"))){
			reservation.setDescription(request.getParameter("description"));
	    }
	    
	    if(StringUtils.isNotBlank(request.getParameter("from"))&&StringUtils.isNotBlank(request.getParameter("end"))){
			String from=request.getParameter("from");
			String end=request.getParameter("end");
			int year1=Integer.parseInt(from.substring(0, 4));
			int month1=Integer.parseInt(from.substring(5, 7));
			int day1=Integer.parseInt(from.substring(8, 10));
			int year2=Integer.parseInt(end.substring(0, 4));
			int month2=Integer.parseInt(end.substring(5, 7));
			int day2=Integer.parseInt(end.substring(8, 10));
			if(StringUtils.isNotBlank(request.getParameter("weekday"))){
				int weekday=Integer.parseInt(request.getParameter("weekday"));
				Calendar calendar = new GregorianCalendar();//定义一个日历，变量作为年初
			   	Calendar calendarEnd = new GregorianCalendar();//定义一个日历，变量作为年末
			    calendar.set(Calendar.YEAR, year1);
			   	calendar.set(Calendar.MONTH, month1-1);
			   	calendar.set(Calendar.DAY_OF_MONTH, day1-1);//设置年初的日期为1月1日
			   	calendarEnd.set(Calendar.YEAR, year2);
			   	calendarEnd.set(Calendar.MONTH, month2-1);
			   	calendarEnd.set(Calendar.DAY_OF_MONTH, day2-1);//设置年末的日期为12月31日
			   	   
			   	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
			   	while(calendar.getTime().getTime()<=calendarEnd.getTime().getTime()){//用日期区间循环
				   	if(calendar.get(Calendar.DAY_OF_WEEK)==weekday+1){//判断如果为weekday时
				   		String date1=sf.format(calendar.getTime());
				   		Date date2=sf.parse(date1);
				   		reservation.setReserve_date(date2);
				   		reservation.setWeekday(weekday);
				   		result=reserveLaboratoryService.reserveLab(reservation);
				   	}
				   	calendar.add(Calendar.DAY_OF_MONTH, 1);//日期+1
			   	}
			}
		}
		if(result>0){
			er.setMsg("恭喜您，预约成功");
			er.setSuccess(true);
		}
		else{
			er.setMsg("实验室可供预约人数不够，请调整预约区间或课堂");
			er.setSuccess(false);
		}
		return er;
	}
	
	//高级搜索，根据用户、预约类别、预约期间等模糊搜索
	@RequestMapping("selectReservation")
	public ModelAndView selectReservation(HttpServletRequest request,HttpSession session){
		ModelAndView view=new ModelAndView("selectReservation");
		int user_type=0; 
		String user_name=null;
		int reserve_type=0;
		String from=null;
		String end=null;
		int user_id=Integer.parseInt(request.getParameter("user_id"));
		if(StringUtils.isNotBlank(request.getParameter("user_type"))){
			user_type=Integer.parseInt(request.getParameter("user_type"));
		}
		if(StringUtils.isNotBlank(request.getParameter("user_name"))){
			user_name=request.getParameter("user_name");
		}
		if(StringUtils.isNotBlank(request.getParameter("reserve_type"))){
			reserve_type=Integer.parseInt(request.getParameter("reserve_type"));
		}
		if(StringUtils.isNotBlank(request.getParameter("from"))){
			from=request.getParameter("from");
		}
		if(StringUtils.isNotBlank(request.getParameter("end"))){
			end=request.getParameter("end");
		}
		System.out.println("bjhed");
		List<user_lab_reservation> list=reserveLaboratoryService.selectReservation(user_id,user_type,user_name,reserve_type,from,end);
		view.addObject("list1",list);
		return view;
	}
	
}
