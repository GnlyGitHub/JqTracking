package com.jxd.service.impl;

import com.jxd.dao.ILoginUserDao;
import com.jxd.model.LoginUser;
import com.jxd.service.ILoginUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<LoginUser> loginCheck(LoginUser loginUser) {
        return loginUserDao.loginCheck(loginUser);
    }

    @Override
    public String getPasswordById_Teacher(Integer userId) {
        return loginUserDao.getPasswordById_Teacher(userId);
    }

    @Override
    public boolean editPassword_Teacher(LoginUser loginUser) {
        return loginUserDao.editPassword_Teacher(loginUser);
    }
}
