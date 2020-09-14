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
}
