package controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import other.ExecResult;
import entity.Course;
import service.CourseService;

@Controller
public class CourseController {
	@Autowired
	private CourseService courseService;

	@RequestMapping("courseList")
	public ModelAndView getAllCourse(int user_id){
		ModelAndView view=new ModelAndView("courseList");
		List<Course> courseList=courseService.getAllCourse(user_id);
		view.addObject("courseList",courseList);
		return view;
	}
	
	@RequestMapping("addCourse")
	@ResponseBody
	public ExecResult addCourse(Course course,HttpSession session) throws ParseException{
		ExecResult er=new ExecResult();
		int result=courseService.addCourse(course);
		if(result==3){
			er.setMsg("您已经有该课程，请勿重复添加！");
			er.setSuccess(false);
		}
		else{
			if(result>0){
				er.setMsg("添加成功");
				er.setSuccess(true);
			}
			else{
				er.setMsg("添加失败");
				er.setSuccess(false);
			}
		}
		return er;
		}
	
	
	@RequestMapping("getCourseById")
	public ModelAndView getCourseById(int course_id,HttpSession session){
		ModelAndView view=new ModelAndView("updateCourse");
		Course course=courseService.getCourseById(course_id);
		view.addObject("course",course);
		return view;
	}
	
	@RequestMapping("updateCourse")
	@ResponseBody
	public ExecResult updateCourse(Course course,HttpSession session){
		ExecResult er=new ExecResult();
		boolean isUpdate=courseService.updateCourse(course);
		if(isUpdate){
			er.setMsg("更新成功");
			er.setSuccess(true);
		}
		else{
			er.setMsg("更新失败");
			er.setSuccess(false);
		}
		return er;
	}
	
	@RequestMapping("deleteCourse")
	@ResponseBody
	public ExecResult deleteCourse(int course_id,HttpSession session){
		ExecResult er=new ExecResult();
		boolean isDel=courseService.deleteCourse(course_id);
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
}
