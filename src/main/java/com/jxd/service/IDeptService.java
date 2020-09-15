package com.jxd.service;

import com.jxd.model.Dept;

import java.util.List;

public interface IDeptService {
    /**
     * 获取所有部门
     * @return 部门集合
     */
    List<Dept> getAllDept_admin();
}
