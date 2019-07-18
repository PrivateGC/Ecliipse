package com.bigdata.curd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bigdata.crud.bean.Teacher;
import com.bigdata.crud.bean.TeacherExample;
import com.bigdata.crud.bean.TeacherExample.Criteria;
import com.bigdata.crud.dao.TeacherMapper;

@Service
public class TeacherServive {
	
	@Autowired
	TeacherMapper teacherMapper;
	
	public List<Teacher> getAll() {
		
		return teacherMapper.selectByExampleWithDept(null);
	}

	public boolean check(Integer teaId) {
		// TODO Auto-generated method stub
		TeacherExample example = new TeacherExample();
		Criteria criteria = example.createCriteria();
		criteria.andTidEqualTo(teaId);
		long c=teacherMapper.countByExample(example);
		
		return c==0;
	}

	public boolean save(Teacher teacher) {
		// TODO Auto-generated method stub
		int c = teacherMapper.insert(teacher);
		return c!=0;
	}

	public boolean editTeaInfo(Teacher teacher) {
		int b = teacherMapper.updateByPrimaryKeySelective(teacher);
		return b!=0;
	}
	public boolean deleteTea(Integer teaNum) {
		
		int b = teacherMapper.deleteByPrimaryKey(teaNum);
		return b!=0;
	}
	public Teacher findTeaNum(int teacherNum) {
		
		return teacherMapper.selectByPrimaryKey(teacherNum);
	}
}
