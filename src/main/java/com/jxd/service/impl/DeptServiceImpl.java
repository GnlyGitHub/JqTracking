package com.jxd.service.impl;

import com.jxd.dao.IDeptDao;
import com.jxd.model.Dept;
import com.jxd.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:09
 */
@Service
public class DeptServiceImpl implements IDeptService {
    @Autowired
    IDeptDao deptDao;

    @Override
    public List<Dept> getAllDept_admin() {
        return deptDao.getAllDept_admin();
    }
}
