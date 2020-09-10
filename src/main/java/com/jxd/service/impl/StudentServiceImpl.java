package com.jxd.service.impl;

import com.jxd.dao.IStudentDao;
import com.jxd.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:11
 */
@Service
public class StudentServiceImpl implements IStudentService {
    @Autowired
    IStudentDao studentDao;
}
