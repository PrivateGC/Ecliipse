package com.bigdata.curd.controller;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bigdata.crud.bean.Teacher;
import com.bigdata.curd.service.TeacherServive;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class TeacherController {
	
	@Autowired
	TeacherServive teacherServive;
	
	
	@RequestMapping("/works")
	public String getworks(@RequestParam(value = "pn",defaultValue = "1") Integer pn,Model model1) {
		PageHelper.startPage(pn, 10);
		List<Teacher> wroks = teacherServive.getAll();
//		
//		for (Teacher teacher : wroks) {
//			System.out.println(teacher.getTname()+"\\"+teacher.getDept().getBname());
//			
//		}
		
		
		PageInfo page = new PageInfo(wroks,5);
		model1.addAttribute("pageinfo",page);
		return "minddle1";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkStuInfo",method=RequestMethod.POST)
	public boolean check(@RequestParam(value="teaNum")Integer teaId) {
		System.out.println(teaId);
		boolean b=teacherServive.check(teaId);
		if (b) {
			return true;
		} else {
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkTeaPhone",method=RequestMethod.POST)
	public boolean checkTeaPhone(@RequestParam(value="teaPhone")String teaPhone) {
		System.out.println(teaPhone);
		String telRegex = "^((13[0-9])|(15[^4])|(18[0-9])|(18[0-8])|(147,145))\\d{8}$";
		Pattern compile = Pattern.compile(telRegex);
		Matcher matcher = compile.matcher(teaPhone);
		Boolean b = matcher.matches();
		if (b) {
			return true;
		} else {
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/teaInfo",method=RequestMethod.POST)
	public boolean save(Teacher teacher) {
		boolean b = teacherServive.save(teacher);
		if (b) {
			return true;
		} else {
			return false;
		}
		
	}
	@RequestMapping(value = "/editTeaInfo",method=RequestMethod.PUT)
	@ResponseBody
	public boolean editTeaInfo(Teacher teacher) {
		boolean b = teacherServive.editTeaInfo(teacher);
			return b;
	}
	
	@ResponseBody
	@RequestMapping(value="/teacherInfo/{teaNum}",method=RequestMethod.DELETE)
	public boolean deleteTea(@PathVariable("teaNum") Integer teaNum) {
		System.out.println(teaNum);
		 boolean b = teacherServive.deleteTea(teaNum);
		return b;
	}
	@RequestMapping("/teachers")
	public String findTeaWithNum( Model model,
			@RequestParam(value="input_info")Integer input_info) {
		//�����ֲ�ѯ
		Teacher teacher = teacherServive.findTeaNum(input_info);
		model.addAttribute("tea", teacher);
		return "search";
	}
}
