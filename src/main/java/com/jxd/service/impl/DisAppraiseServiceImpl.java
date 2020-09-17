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

    @Override
    public Boolean insertDisAppraise_Manage(DisAppraise disAppraise) {
        return disAppraiseDao.insertDisAppraise_Manage(disAppraise);
    }

    @Override
    public List<DisAppraise> checkDisAppraise_Manage(Integer mId, Integer classId, Integer number) {
        return disAppraiseDao.checkDisAppraise_Manage(mId,classId,number);
    }

    @Override
    public boolean insertBatchDisAppraise_Manage(List<DisAppraise> list) {
        return disAppraiseDao.insertBatchDisAppraise_Manage(list);
    }

    @Override
    public boolean delBatchDisAppraise_Manage(List<DisAppraise> list) {
        return disAppraiseDao.delBatchDisAppraise_Manage(list);
    }

    @Override
    public boolean deleteDisAppraise_Manage(List<DisAppraise> list) {
        return disAppraiseDao.deleteDisAppraise_Manage(list);
    }

    @Override
    public List<DisAppraise> getDisAppraiseTable_Manage(Integer mId, Integer classId, Integer number) {
        return disAppraiseDao.getDisAppraiseTable_Manage(mId,classId,number);
    }
}
