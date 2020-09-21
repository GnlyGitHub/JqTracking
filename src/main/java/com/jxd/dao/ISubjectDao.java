package com.jxd.dao;

import com.jxd.model.Subject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:02
 */
public interface ISubjectDao {

    /**
     * @return java.util.List<com.jxd.model.Subject>
     * @Description 老师获取科目评价项
     * @params [classId]
     **/
    List<Subject> getSubjectByClassId_Teacher(Integer classId);

    /**
     * 根据课程名获取课程列表
     *
     * @param subject 课程名
     * @return 课程列表
     */
    List<Subject> getAllSubject_admin(@Param("subject") String subject);

    /**
     * 根据分页及课程名获取课程列表
     *
     * @param pageSize  每页长度
     * @param pageIndex 页数
     * @param subject   课程名
     * @return 课程列表
     */
    List<Subject> getSubject_admin(@Param("pageSize") Integer pageSize, @Param("pageIndex") Integer pageIndex, @Param("subject") String subject);

    /**
     * 添加课程
     *
     * @param subject 要要添加的课程
     * @return 是否添加成功
     */
    boolean addSubject_admin(Subject subject);

    /**
     * 根据编号删除课程
     *
     * @param subjectId 要删除的课程
     * @return 是否删除成功
     */
    boolean delSubject_admin(Integer subjectId);

    /**
     * 根据编号获取课程信息
     *
     * @param subjectId 课程编号
     * @return 要获取的课程
     */
    Subject getSubjectById_admin(Integer subjectId);

    /**
     * 根据编号修改课程
     *
     * @param subject 要修改的课程
     * @return 是否修改成功
     */
    boolean editSubjectById_admin(Subject subject);

    /**
     * 查重课程
     *
     * @param subject 待查询课程
     * @return 课程列表
     */
    List<Subject> checkRepSubject_admin(String subject);
}
