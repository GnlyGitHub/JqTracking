package com.jxd.service;

import com.jxd.model.Class;

import java.util.List;

public interface IClassService {

    /**
     * @return java.util.List<com.jxd.model.Class>
     * @Description 通过教师编号获取班级列表
     * @params [tId]
     **/
    List<Class> getAllSClassBytId_Teacher(Integer tId);

    /**
     * 获取所有班期
     *
     * @return 班期列表
     */
    List<Class> getAllClass_admin();

    /**
     * @return java.util.List<com.jxd.model.Class>
     * @Description 获得所有的班级数据
     * Param []
     */
    List<Class> getAllClass_Manage();

    /**
     * 根据班期名获取所有班期
     *
     * @param className 班期名
     * @return 班期列表
     */
    List<Class> getAllClasses_admin(String className);

    /**
     * 根据班期名及分页获取所有班期
     *
     * @param pageSize  每页长度
     * @param pageIndex 页数
     * @param className 班期名
     * @return 班期列表
     */
    List<Class> getClasses_admin(Integer pageSize, Integer pageIndex, String className);

    /**
     * 添加班期
     *
     * @param aClass 要添加的班期
     * @return 是否添加成功
     */
    boolean addClass_admin(Class aClass);

    /**
     * 根据期数
     *
     * @param classId 期数
     * @return 是否删除成功
     */
    boolean delClass_admin(Integer classId);

    /**
     * 根据期数获取班期信息
     *
     * @param classId 期数
     * @return 要获取的班期信息
     */
    Class getClassById_admin(Integer classId);

    /**
     * 根据期数修改班期信息
     *
     * @param aClass 要修改的班期
     * @return 是否修改成功
     */
    boolean editClassById_admin(Class aClass);

    /**
     * 获取当前插入的班期编号
     *
     * @return 当前插入的班期编号
     */
    Integer getCurClassId();

    /**
     * 班期查重
     *
     * @param className 带查重班期
     * @return 查询结果列表
     */
    List<Class> checkRepClass_admin(String className);

    /**
     * 获取某个教师带过的班期
     *
     * @param tId 教师工号
     * @return 班期列表
     */
    List<Class> getClassBytId_admin(Integer tId);
}
