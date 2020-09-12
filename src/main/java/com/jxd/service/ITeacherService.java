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
}
