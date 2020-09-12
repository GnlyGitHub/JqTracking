package com.jxd.service.impl;

import com.jxd.dao.ITeacherDao;
import com.jxd.model.Teacher;
import com.jxd.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:12
 */
@Service
public class TeacherServiceImpl implements ITeacherService {
    @Autowired
    ITeacherDao teacherDao;

    @Override
    public List<Teacher> getAllTeacher_admin(String tName) {
        return teacherDao.getAllTeacher_admin(tName);
    }

    @Override
    public List<Teacher> getTeacher_admin(Integer pageSize, Integer pageIndex, String tName) {
        return teacherDao.getTeacher_admin(pageSize,pageIndex,tName);
    }
}
