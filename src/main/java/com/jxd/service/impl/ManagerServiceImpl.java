package com.jxd.service.impl;

import com.jxd.dao.IManagerDao;
import com.jxd.model.DisAppraise;
import com.jxd.model.Manager;
import com.jxd.service.IManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:11
 */
@Service
public class ManagerServiceImpl implements IManagerService {
    @Autowired
    IManagerDao managerDao;

    @Override
    public List<Manager> getAllManager_admin(String mName) {
        return managerDao.getAllManager_admin(mName);
    }

    @Override
    public List<Manager> getManager_admin(Integer pageSize, Integer pageIndex, String mName) {
        return managerDao.getManager_admin(pageSize, pageIndex, mName);
    }

    @Override
    public boolean addManager_admin(Manager manager) {
        return managerDao.addManager_admin(manager);
    }

    @Override
    public boolean delManager_admin(Integer mId) {
        return managerDao.delManager_admin(mId);
    }

    @Override
    public Manager getManagerById_admin(Integer mId) {
        return managerDao.getManagerById_admin(mId);
    }

    @Override
    public boolean editManagerById_admin(Manager manager) {
        return managerDao.editManagerById_admin(manager);
    }

    @Override
    public Integer getCurManager_admin() {
        return managerDao.getCurManager_admin();
    }

    @Override
    public List<DisAppraise> getDisAppraiseBymId(Integer mId) {
        return managerDao.getDisAppraiseBymId(mId);
    }
}
