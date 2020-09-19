package com.jxd.service.impl;

import com.jxd.dao.IClassDao;
import com.jxd.model.Class;
import com.jxd.service.IClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:10
 */
@Service
public class ClassServiceImpl implements IClassService {
    @Autowired
    IClassDao classDao;

    @Override
    public List<Class> getAllSClassBytId_Teacher(Integer tId) {
        return classDao.getAllSClassBytId_Teacher(tId);
    }

    @Override
    public List<Class> getAllClass_admin() {
        return classDao.getAllClass_admin();
    }

    @Override
    public List<Class> getAllClass_Manage() {
        return classDao.getAllClass_Manage();
    }

    @Override
    public List<Class> getAllClasses_admin(String className) {
        return classDao.getAllClasses_admin(className);
    }

    @Override
    public List<Class> getClasses_admin(Integer pageSize, Integer pageIndex, String className) {
        return classDao.getClasses_admin(pageSize, pageIndex, className);
    }

    @Override
    public boolean addClass_admin(Class aClass) {
        return classDao.addClass_admin(aClass);
    }

    @Override
    public boolean delClass_admin(Integer classId) {
        return classDao.delClass_admin(classId);
    }

    @Override
    public Class getClassById_admin(Integer classId) {
        return classDao.getClassById_admin(classId);
    }

    @Override
    public boolean editClassById_admin(Class aClass) {
        return classDao.editClassById_admin(aClass);
    }

    @Override
    public Integer getCurClassId() {
        return classDao.getCurClassId();
    }

    @Override
    public List<Class> checkRepClass_admin(String className) {
        return classDao.checkRepClass_admin(className);
    }

    @Override
    public List<Class> getClassBytId_admin(Integer tId) {
        return classDao.getClassBytId_admin(tId);
    }
}
