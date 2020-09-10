package com.jxd.service.impl;

import com.jxd.dao.IDeptDao;
import com.jxd.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:09
 */
@Service
public class DeptServiceImpl implements IDeptService {
    @Autowired
    IDeptDao deptDao;
}
