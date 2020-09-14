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
    public List<Class> getAllClass_Manage() {
        return classDao.getAllClass_Manage();
    }
}
