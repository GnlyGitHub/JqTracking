package com.jxd.service.impl;

import com.jxd.dao.IProjectDao;
import com.jxd.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 15:17
 */
@Service
public class ProjectServiceImpl implements IProjectService {
    @Autowired
    IProjectDao projectDao;
}
