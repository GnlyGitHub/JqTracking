package com.jxd.service;

import com.jxd.model.Appraise;
import com.jxd.model.DisAppraise;

import java.util.List;

public interface IDisAppraiseService {
    /**
     * @Description 获得评价表根据筛选条件数量
     *Param []
     * @return java.util.List<com.jxd.model.Appraise>
     */
    List<DisAppraise> getAllSizeAppaise_Manage(String mname,Integer manageId);
    /**
     * @Description 获得评价表根据筛选条件每页的数据
     *Param []
     * @return java.util.List<com.jxd.model.Appraise>
     */
    List<DisAppraise> getAllAppaise_Manage(String mname, Integer limit, Integer page,Integer manageId);
    /**
     * @Description 插入一个分配表
     *Param [disAppraise]
     * @return java.lang.Boolean
     */
    Boolean insertDisAppraise_Manage(DisAppraise disAppraise);
/**
 * @Description 返回该经历的某期分配表的集合
 *Param [classId, number]
 * @return java.lang.Boolean
 */
    List<DisAppraise> checkDisAppraise_Manage(Integer mId,Integer classId,Integer number);
    /**
     * @Description 批量插入
     *Param [list]
     * @return boolean
     */
    boolean insertBatchDisAppraise_Manage(List<DisAppraise> list);
    /**
     * @Description 编辑批量删除
     *Param [list]
     * @return boolean
     */
    boolean delBatchDisAppraise_Manage(List<DisAppraise> list);
    /**
     * @Description 删除批量删除
     *Param [list]
     * @return boolean
     */
    boolean deleteDisAppraise_Manage(List<DisAppraise> list);
    /**
     * @Description 获得该期的第几次评价所需表
     *Param [mId, classId, number]
     * @return java.util.List<com.jxd.model.DisAppraise>
     */
    List<DisAppraise> getDisAppraiseTable_Manage(Integer mId,Integer classId,Integer number);
}
