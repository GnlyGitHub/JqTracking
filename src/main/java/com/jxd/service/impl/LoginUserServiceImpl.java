package com.jxd.service.impl;

import com.jxd.dao.ILoginUserDao;
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
}
