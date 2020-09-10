package com.jxd.service.impl;

import com.jxd.dao.IClassDao;
import com.jxd.service.IClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:10
 */
@Service
public class ClassServiceImpl implements IClassService {
    @Autowired
    IClassDao classDao;
}
