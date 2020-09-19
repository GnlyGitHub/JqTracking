package com.jxd.service.impl;

import com.jxd.dao.ISubjectDao;
import com.jxd.model.Subject;
import com.jxd.service.ISubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:11
 */
@Service
public class SubjectServiceImpl implements ISubjectService {
    @Autowired
    ISubjectDao subjectDao;

    @Override
    public List<Subject> getSubjectByClassId_Teacher(Integer classId) {
        return subjectDao.getSubjectByClassId_Teacher(classId);
    }

    @Override
    public List<Subject> getAllSubject_admin(String subject) {
        return subjectDao.getAllSubject_admin(subject);
    }

    @Override
    public List<Subject> getSubject_admin(Integer pageSize, Integer pageIndex, String subject) {
        return subjectDao.getSubject_admin(pageSize, pageIndex, subject);
    }

    @Override
    public boolean addSubject_admin(Subject subject) {
        return subjectDao.addSubject_admin(subject);
    }

    @Override
    public boolean delSubject_admin(Integer subjectId) {
        return subjectDao.delSubject_admin(subjectId);
    }

    @Override
    public Subject getSubjectById_admin(Integer subjectId) {
        return subjectDao.getSubjectById_admin(subjectId);
    }

    @Override
    public boolean editSubjectById_admin(Subject subject) {
        return subjectDao.editSubjectById_admin(subject);
    }

    @Override
    public List<Subject> checkRepSubject_admin(String subject) {
        return subjectDao.checkRepSubject_admin(subject);
    }
}
