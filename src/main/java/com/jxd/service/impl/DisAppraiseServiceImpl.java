package com.jxd.service.impl;

import com.jxd.dao.IDisAppraiseDao;
import com.jxd.service.IDisAppraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 16:05
 */
@Service
public class DisAppraiseServiceImpl implements IDisAppraiseService {
    @Autowired
    IDisAppraiseDao disAppraiseDao;
}
