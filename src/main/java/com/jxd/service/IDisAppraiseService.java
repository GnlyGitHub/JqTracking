package com.jxd.service;

import com.jxd.model.Appraise;
import com.jxd.model.DisAppraise;

import java.util.List;

public interface IDisAppraiseService {
    /**
     * @return java.util.List<com.jxd.model.Appraise>
     * @Description 获得评价表根据筛选条件数量
     * Param []
     */
    List<DisAppraise> getAllSizeAppaise_Manage(String mname, Integer manageId);

    /**
     * @return java.util.List<com.jxd.model.Appraise>
     * @Description 获得评价表根据筛选条件每页的数据
     * Param []
     */
    List<DisAppraise> getAllAppaise_Manage(String mname, Integer limit, Integer page, Integer manageId);

    /**
     * @return java.lang.Boolean
     * @Description 插入一个分配表
     * Param [disAppraise]
     */
    Boolean insertDisAppraise_Manage(DisAppraise disAppraise);

    /**
     * @return java.lang.Boolean
     * @Description 返回该经历的某期分配表的集合
     * Param [classId, number]
     */
    List<DisAppraise> checkDisAppraise_Manage(Integer mId, Integer classId, Integer number);

    /**
     * @return boolean
     * @Description 批量插入
     * Param [list]
     */
    boolean insertBatchDisAppraise_Manage(List<DisAppraise> list);

    /**
     * @return boolean
     * @Description 编辑批量删除
     * Param [list]
     */
    boolean delBatchDisAppraise_Manage(List<DisAppraise> list);

    /**
     * @return boolean
     * @Description 删除批量删除
     * Param [list]
     */
    boolean deleteDisAppraise_Manage(List<DisAppraise> list);

    /**
     * @return java.util.List<com.jxd.model.DisAppraise>
     * @Description 获得该期的第几次评价所需表
     * Param [mId, classId, number]
     */
    List<DisAppraise> getDisAppraiseTable_Manage(Integer mId, Integer classId, Integer number);

    /**
     * 根据评价分项获取评价分项分配列表
     *
     * @param appraiseId 评价分项
     * @return 评价分项分配列表
     */
    List<DisAppraise> getDisAppraiseByAppraiseId(Integer appraiseId);
}
