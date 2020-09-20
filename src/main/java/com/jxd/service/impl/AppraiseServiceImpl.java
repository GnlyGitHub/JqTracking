package com.jxd.service.impl;

import com.jxd.dao.IAppraiseDao;
import com.jxd.model.Appraise;
import com.jxd.service.IAppraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:09
 */
@Service
public class AppraiseServiceImpl implements IAppraiseService {
    @Autowired
    IAppraiseDao appraiseDao;

    @Override
    public List<Appraise> getAllAppraise_Manage() {
        return appraiseDao.getAllAppraise_Manage();
    }

    @Override
    public List<Appraise> getAllAppraise_admin(String appraise) {
        return appraiseDao.getAllAppraise_admin(appraise);
    }

    @Override
    public List<Appraise> getAppraise_admin(Integer pageSize, Integer pageIndex, String appraise) {
        return appraiseDao.getAppraise_admin(pageSize,pageIndex,appraise);
    }

    @Override
    public boolean addAppraise_admin(Appraise appraise) {
        return appraiseDao.addAppraise_admin(appraise);
    }

    @Override
    public boolean delAppraise_admin(Integer appraiseId) {
        return appraiseDao.delAppraise_admin(appraiseId);
    }

    @Override
    public Appraise getAppraiseById_admin(Integer appraiseId) {
        return appraiseDao.getAppraiseById_admin(appraiseId);
    }

    @Override
    public boolean editAppraiseById_admin(Appraise appraise) {
        return appraiseDao.editAppraiseById_admin(appraise);
    }

    @Override
    public List<Appraise> checkRepAppraise_admin(String appraise) {
        return appraiseDao.checkRepAppraise_admin(appraise);
    }
}
