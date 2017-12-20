package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import other.ExecResult;
import entity.Laboratory;
import entity.User;
import service.LaboratoryService;

@Controller
public class LaboratoryController {
	
	@Autowired
	private LaboratoryService laboratoryService;

	@RequestMapping("addLab")
	@ResponseBody
	public ExecResult addLab(Laboratory laboratory,HttpSession session,HttpServletRequest request){
		ExecResult er=new ExecResult();
//		System.out.println("LaboratoryController - addLab");
//		System.out.println(request.getParameter("description"));
		int result=(int)laboratoryService.addLab(laboratory);
		if(result>0){
			er.setMsg("新增成功");
			er.setSuccess(true);
		}
		else{
			er.setMsg("新增失败");
			er.setSuccess(false);
		}
		return er;
	}	
	
	@RequestMapping("labList")
	public ModelAndView getAllLab(){
		ModelAndView view=new ModelAndView("labList");
		List<Laboratory> labList=laboratoryService.getAllLab();
		view.addObject("labList",labList);
		return view;
	}
	@RequestMapping("reserveLabList")
	public ModelAndView getreserveLabList(){
		ModelAndView view=new ModelAndView("reserveLabList");
		List<Laboratory> labList=laboratoryService.getAllLab();
		view.addObject("labList",labList);
		return view;
	}
	
	@RequestMapping("deleteLab")
	@ResponseBody
	public ExecResult deleteLab(Laboratory laboratory,HttpSession session){
		ExecResult er=new ExecResult();
		if(laboratory.getLab_id()==1){
			er.setMsg("该实验室被限制为永久不能删除！");
			er.setSuccess(false);
		}
		else{
			boolean isDel=laboratoryService.delLab(laboratory);
			if(isDel){
				er.setMsg("删除成功");
				er.setSuccess(true);
			}
			else{
				er.setMsg("删除失败");
				er.setSuccess(false);
			}
		}
		return er;
	}
	
	@RequestMapping("getLabById")
	public ModelAndView getLabById(Laboratory laboratory,HttpSession session){
		ModelAndView view=new ModelAndView("updateLab");
		Laboratory lab=laboratoryService.getLabById(laboratory);
		view.addObject("lab",lab);
		return view;
	}
	
	@RequestMapping("updateLab")
	@ResponseBody
	public ExecResult updateLab(Laboratory laboratory,HttpSession session){
		ExecResult er=new ExecResult();
		boolean isUpdate=laboratoryService.updateLab(laboratory);
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
	
	
	/*@RequestMapping("updateLab")
	@ResponseBody
	public ExecResult updateLab(User user,HttpSession session){
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
	}*/
	
}
