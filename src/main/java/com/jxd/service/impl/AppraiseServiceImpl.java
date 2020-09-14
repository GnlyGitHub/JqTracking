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
}
