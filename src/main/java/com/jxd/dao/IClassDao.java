package com.jxd.dao;

import com.jxd.model.Class;

import java.util.List;

public interface IClassDao {

    /**
     * @Description 通过教师编号获取班级列表
     * @params [tId]
     * @return java.util.List<com.jxd.model.Class>
     **/
    List<Class> getAllSClassBytId_Teacher(Integer tId);
    /**
     * @Description 获得所有的班级数据
     *Param []
     * @return java.util.List<com.jxd.model.Class>
     */
    List<Class> getAllClass_Manage();
}
