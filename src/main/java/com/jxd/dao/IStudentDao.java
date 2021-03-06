package com.jxd.dao;

import com.jxd.model.Student;
import com.jxd.model.Subject;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IStudentDao {

    /**
     * @return boolean
     * @Description 老师更新学生评价状态
     * @params [sId]
     **/
    boolean updateScoreState_Teacher(Integer sId);

    /**
     * @return java.util.List<com.jxd.model.Student>
     * @Description 教师通过班级和学生姓名模糊查询
     * @params [sClass, sName]
     **/
    List<Student> getAllStudent_Teacher(@Param("sClass") Integer sClass, @Param("sName") String sName);

    /**
     * @return java.util.List<com.jxd.model.Student>
     * @Description 分页查询
     * @params [pageSize, pageIndex, sClass, sName]
     **/
    List<Student> getAllStudentByPage_Teacher(@Param("pageSize") Integer pageSize, @Param("pageIndex") Integer pageIndex, @Param("sClass") Integer sClass, @Param("sName") String sName);

    /**
     * 根据班期及姓名获取学生列表
     *
     * @param sClass 班期
     * @param sName  姓名
     * @return 要获取的学生列表
     */
    List<Student> getAllStudent_admin(@Param("sClass") Integer sClass, @Param("sName") String sName);

    /**
     * 根据分页、班期及姓名获取项目学生列表
     *
     * @param pageSize  每页长度
     * @param pageIndex 页数
     * @param sClass    班期
     * @param sName     姓名
     * @return 学生列表
     */
    List<Student> getStudent_admin(@Param("pageSize") Integer pageSize, @Param("pageIndex") Integer pageIndex, @Param("sClass") Integer sClass, @Param("sName") String sName);

    /**
     * 添加学生
     *
     * @param student 要添加的学生
     * @return 是否添加成功
     */
    boolean addStudent_admin(Student student);

    /**
     * 根据学号删除学生
     *
     * @param sId 学号
     * @return 是否删除成功
     */
    boolean delStudent_admin(Integer sId);

    /**
     * 根据学号获取学生信息
     *
     * @param sId 学号
     * @return 要获取的学生信息
     */
    Student getStudentById_admin(Integer sId);

    /**
     * 根据学号修改学生信息
     *
     * @param student 要修改的学生
     * @return 是否修改成功
     */
    boolean editStudentById_admin(Student student);

    /**
     * @return java.util.List<com.jxd.model.Student>
     * @Description 根据筛选条件获得员工数量
     * Param [classId, empName, empId, projectId]
     */
    List<Student> GetAllSizeStudent_Manage(@Param("classId") Integer classId, @Param("empName") String empName, @Param("empId") String empId, @Param("projectId") Integer projectId);

    /**
     * @return java.util.List<com.jxd.model.Student>
     * @Description 得到每页的数据
     * Param [classId, empName, empId, projectId, limit, page]
     */
    List<Student> GetAllPageStudent_Manage(@Param("classId") Integer classId, @Param("empName") String empName, @Param("empId") String empId,
                                           @Param("projectId") Integer projectId, @Param("limit") Integer limit, @Param("page") Integer page);

    /**
     * @return com.jxd.model.Student
     * @Description 根据学生id查询学生信息
     * Param [sId]
     */
    Map<String, String> getStudentById_Manage(Integer sId);

    /**
     * @return boolean
     * @Description 根据学生id改变AppraiseState状态
     * Param [sId]
     */
    boolean changeAppraiseState_Manage(@Param("appraiseState") Integer appraiseState, @Param("sId") Integer sId);

    /**
     * 根据班期获取学生列表
     *
     * @param classId 班期号
     * @return 学生列表
     */
    List<Student> getStudentByClassId_admin(Integer classId);
}
