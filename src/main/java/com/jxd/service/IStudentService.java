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

    /**
     * 根据班期及姓名获取学生列表
     * @param sClass 班期
     * @param sName 姓名
     * @return 要获取的学生列表
     */
    List<Student> getAllStudent_admin(Integer sClass, String sName);

    /**
     * 根据分页、班期及姓名获取项目学生列表
     * @param pageSize 每页长度
     * @param pageIndex 页数
     * @param sClass 班期
     * @param sName 姓名
     * @return 学生列表
     */
    List<Student> getStudent_admin(Integer pageSize, Integer pageIndex, Integer sClass, String sName);

    /**
     * 添加学生
     * @param student 要添加的学生
     * @return 是否添加成功
     */
    boolean addStudent_admin(Student student);

    /**
     * 根据学号删除学生
     * @param sId 学号
     * @return 是否删除成功
     */
    boolean delStudent_admin(Integer sId);

    /**
     * 根据学号获取学生信息
     * @param sId 学号
     * @return 要获取的学生信息
     */
    Student getStudentById_admin(Integer sId);

    /**
     * 根据学号修改学生信息
     * @param student 要修改的学生
     * @return 是否修改成功
     */
    boolean editStudentById_admin(Student student);
    /**
     * @Description 根据筛选条件获得员工数量
     *Param [classId, empName, empId, projectId]
     * @return java.util.List<com.jxd.model.Student>
     */
    List<Student> GetAllSizeStudent_Manage(Integer classId, String empName, String empId, Integer projectId);
    /**
     * @Description 得到每页的数据
     *Param [classId, empName, empId, projectId, limit, page]
     * @return java.util.List<com.jxd.model.Student>
     */
    List<Student> GetAllPageStudent_Manage(Integer classId, String empName, String empId, Integer projectId,Integer limit, Integer page);
}
