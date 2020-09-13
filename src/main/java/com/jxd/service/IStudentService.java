package com.jxd.service;

import com.jxd.model.Student;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:06
 */
public interface IStudentService {

    /**
     * @Description 教师通过班级和学生姓名模糊查询
     * @params [sClass, sName]
     * @return java.util.List<com.jxd.model.Student>
     **/
    List<Student> getAllStudent_Teacher(Integer sClass,String sName);

    /**
     * @Description 分页查询
     * @params [count, pageIndex, sClass, sName]
     * @return java.util.List<com.jxd.model.Student>
     **/
    List<Student> getAllStudentByPage_Teacher(Integer pageSize, Integer pageIndex,Integer sClass,String sName);
}
