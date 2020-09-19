package com.jxd.service.impl;

import com.jxd.dao.IDisSubjectDao;
import com.jxd.model.DisSubject;
import com.jxd.model.Subject;
import com.jxd.service.IDisSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:11
 */
@Service
public class DisSubjectServiceImpl implements IDisSubjectService {
    @Autowired
    IDisSubjectDao disSubjectDao;

    @Override
    public boolean addBatchDisSubject(List<DisSubject> list) {
        return disSubjectDao.addBatchDisSubject(list);
    }

    @Override
    public List<DisSubject> checkDisSubject_admin(Integer classId) {
        return disSubjectDao.checkDisSubject_admin(classId);
    }

    @Override
    public boolean delBatchDisSubject(List<DisSubject> list) {
        return disSubjectDao.delBatchDisSubject(list);
    }

    @Override
    public boolean delDisSubjectByClassId(Integer classId) {
        return disSubjectDao.delDisSubjectByClassId(classId);
    }

    @Override
    public List<DisSubject> getDisSubjectBySubjectId(Integer subjectId) {
        return disSubjectDao.getDisSubjectBySubjectId(subjectId);
    }
}
