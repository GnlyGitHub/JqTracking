package com.jxd.service.impl;

import com.jxd.dao.IJobDao;
import com.jxd.service.IJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 12:40
 */
@Service
public class JobServiceImpl implements IJobService {
    @Autowired
    IJobDao jobDao;
}
