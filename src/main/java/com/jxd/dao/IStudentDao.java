package com.jxd.dao;

import com.jxd.model.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IStudentDao {

    /**
     * @Description 教师通过班级和学生姓名模糊查询
     * @params [sClass, sName]
     * @return java.util.List<com.jxd.model.Student>
     **/
    List<Student> getAllStudent_Teacher(@Param("sClass") Integer sClass, @Param("sName") String sName);

    /**
     * @Description 分页查询
     * @params [pageSize, pageIndex, sClass, sName]
     * @return java.util.List<com.jxd.model.Student>
     **/
    List<Student> getAllStudentByPage_Teacher(@Param("pageSize") Integer pageSize, @Param("pageIndex") Integer pageIndex,@Param("sClass") Integer sClass,@Param("sName") String sName);
}
