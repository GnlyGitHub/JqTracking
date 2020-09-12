package com.jxd.service.impl;

import com.jxd.dao.IAdminDao;
import com.jxd.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 10:18
 */
@Service
public class AdminServiceImpl implements IAdminService {
    @Autowired
    IAdminDao adminDao;
}
