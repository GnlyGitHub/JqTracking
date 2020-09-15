package com.jxd.service.impl;

import com.jxd.dao.IJobDao;
import com.jxd.model.Job;
import com.jxd.service.IJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 12:40
 */
@Service
public class JobServiceImpl implements IJobService {
    @Autowired
    IJobDao jobDao;


    @Override
    public List<Job> getAllJobByDeptNo_admin(Integer deptNo) {
        return jobDao.getAllJobByDeptNo_admin(deptNo);
    }
}
