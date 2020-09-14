package com.jxd.service.impl;

import com.jxd.dao.ILoginUserDao;
import com.jxd.model.LoginUser;
import com.jxd.service.ILoginUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:12
 */
@Service
public class LoginUserServiceImpl implements ILoginUserService {
    @Autowired
    ILoginUserDao loginUserDao;

    @Override
    public boolean addLoginUser_admin(LoginUser loginUser) {
        return loginUserDao.addLoginUser_admin(loginUser);
    }

    @Override
    public boolean delLoginUser_admin(Integer userId) {
        return loginUserDao.delLoginUser_admin(userId);
    }

    @Override
    public boolean editLoginUser_admin(LoginUser loginUser) {
        return loginUserDao.editLoginUser_admin(loginUser);
    }
}
