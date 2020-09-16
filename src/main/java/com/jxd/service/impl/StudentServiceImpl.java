package com.jxd.service.impl;

import com.jxd.dao.IStudentDao;
import com.jxd.model.Student;
import com.jxd.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:11
 */
@Service
public class StudentServiceImpl implements IStudentService {
    @Autowired
    IStudentDao studentDao;

    @Override
    public List<Student> getAllStudent_Teacher(Integer sClass, String sName) {
        return studentDao.getAllStudent_Teacher(sClass,sName);
    }

    @Override
    public List<Student> getAllStudentByPage_Teacher(Integer pageSize, Integer pageIndex, Integer sClass, String sName) {
        return studentDao.getAllStudentByPage_Teacher(pageSize,pageIndex,sClass,sName);
    }

    @Override
    public List<Student> getAllStudent_admin(Integer sClass, String sName) {
        return studentDao.getAllStudent_admin(sClass,sName);
    }

    @Override
    public List<Student> getStudent_admin(Integer pageSize, Integer pageIndex, Integer sClass, String sName) {
        return studentDao.getStudent_admin(pageSize,pageIndex,sClass,sName);
    }

    @Override
    public boolean addStudent_admin(Student student) {
        return studentDao.addStudent_admin(student);
    }

    @Override
    public boolean delStudent_admin(Integer sId) {
        return studentDao.delStudent_admin(sId);
    }

    @Override
    public Student getStudentById_admin(Integer sId) {
        return studentDao.getStudentById_admin(sId);
    }

    @Override
    public boolean editStudentById_admin(Student student) {
        return studentDao.editStudentById_admin(student);
    }

    @Override
    public List<Student> GetAllSizeStudent_Manage(Integer classId, String empName, String empId, Integer projectId) {
        return studentDao.GetAllSizeStudent_Manage(classId,empName,empId,projectId);
    }

    @Override
    public List<Student> GetAllPageStudent_Manage(Integer classId, String empName, String empId, Integer projectId, Integer limit, Integer page) {
        return studentDao.GetAllPageStudent_Manage(classId,empName,empId,projectId,limit,page);
    }

    @Override
    public Map<String,String> getStudentById_Manage(Integer sId) {
        return studentDao.getStudentById_Manage(sId);
    }

}
