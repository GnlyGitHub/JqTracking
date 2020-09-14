package com.jxd.service;

import com.jxd.model.Teacher;

import java.util.List;

public interface ITeacherService {
    /**
     * 根据姓名获取教师列表
     * @param tName 教师姓名
     * @return 教师列表
     */
    List<Teacher> getAllTeacher_admin(String tName);

    /**
     * 根据分页及姓名获取教师列表
     * @param pageSize 每页长度
     * @param pageIndex 页数
     * @param name 教师姓名
     * @return 教师列表
     */
    List<Teacher> getTeacher_admin(Integer pageSize, Integer pageIndex, String name);

    /**
     * 添加教师
     * @param teacher 要添加的教师
     * @return 是否添加成功
     */
    boolean addTeacher_admin(Teacher teacher);

    /**
     * 根据工号删除教师
     * @param tId 工号
     * @return 是否删除成功
     */
    boolean delTeacherById_admin(Integer tId);

    /**
     * 根据工号获取教师信息
     * @param tId 工号
     * @return 要获取的教师
     */
    Teacher getTeacherById_admin(Integer tId);

    /**
     * 根据工号修改老师信息
     * @param teacher 要修改的老师
     * @return 是否修改成功
     */
    boolean editTeacherById_admin(Teacher teacher);

    /**
     * 获取新增教师的id
     * @return 新增教师的id
     */
    Integer getCurTeacherId_admin();
}
