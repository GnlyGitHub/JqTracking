package com.jxd.service.impl;

import com.jxd.dao.IStudentDao;
import com.jxd.model.Student;
import com.jxd.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

}
