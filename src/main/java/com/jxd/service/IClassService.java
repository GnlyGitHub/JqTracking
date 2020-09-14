package com.jxd.service;

import com.jxd.model.Class;

import java.util.List;

public interface IClassService {

    /**
     * @Description 通过教师编号获取班级列表
     * @params [tId]
     * @return java.util.List<com.jxd.model.Class>
     **/
    List<Class> getAllSClassBytId_Teacher(Integer tId);

    /**
     * 获取所有班期
     * @return 班期列表
     */
    List<Class> getAllClass_admin();
}
