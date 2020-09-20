package com.jxd.dao;

import com.jxd.model.Dept;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:04
 */
public interface IDeptDao {
    /**
     * 获取所有部门
     *
     * @return 部门集合
     */
    List<Dept> getAllDept_admin();
}
