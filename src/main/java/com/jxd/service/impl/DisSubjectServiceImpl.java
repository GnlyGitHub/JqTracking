package com.jxd.service.impl;

import com.jxd.dao.IDisSubjectDao;
import com.jxd.service.IDisSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:11
 */
@Service
public class DisSubjectServiceImpl implements IDisSubjectService {
    @Autowired
    IDisSubjectDao disSubjectDao;
}
