package com.jxd.service.impl;

import com.jxd.dao.IDisAppraiseDao;
import com.jxd.model.Appraise;
import com.jxd.model.DisAppraise;
import com.jxd.service.IDisAppraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 16:05
 */
@Service
public class DisAppraiseServiceImpl implements IDisAppraiseService {
    @Autowired
    IDisAppraiseDao disAppraiseDao;
    @Override
    public List<DisAppraise> getAllSizeAppaise_Manage(String mname, Integer manageId) {
        return disAppraiseDao.getAllSizeAppaise_Manage(mname,manageId);
    }

    @Override
    public List<DisAppraise> getAllAppaise_Manage(String mname, Integer limit, Integer page, Integer manageId) {
        return disAppraiseDao.getAllAppaise_Manage(mname,limit,page,manageId);
    }
}
