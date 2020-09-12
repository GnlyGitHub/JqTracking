package com.jxd.dao;

import com.jxd.model.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ITeacherDao {
    /**
     * 根据姓名获取教师列表
     * @param tName 教师姓名
     * @return 教师列表
     */
    List<Teacher> getAllTeacher_admin(@Param("tName") String tName);

    /**
     * 根据分页及姓名获取教师列表
     * @param pageSize 每页长度
     * @param pageIndex 页数
     * @param tName 教师姓名
     * @return 教师列表
     */
    List<Teacher> getTeacher_admin(@Param("pageSize") Integer pageSize, @Param("pageIndex") Integer pageIndex, @Param("tName") String tName);
}
