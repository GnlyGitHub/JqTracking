package com.jxd.dao;

import com.jxd.model.Appraise;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAppraiseDao {
    /**
     * @return java.util.List<com.jxd.model.Appraise>
     * @Description 得到所有的评分项
     * Param []
     */
    List<Appraise> getAllAppraise_Manage();

    /**
     * 根据名称获取所有评价分项
     *
     * @param appraise 评价分项名称
     * @return 评价分项列表
     */
    List<Appraise> getAllAppraise_admin(@Param("appraise") String appraise);

    /**
     * 根据分页及名称获取所有评价分项
     *
     * @param pageSize  每页长度
     * @param pageIndex 页数
     * @param appraise  评价分项名称
     * @return 评价分项列表
     */
    List<Appraise> getAppraise_admin(@Param("pageSize") Integer pageSize, @Param("pageIndex") Integer pageIndex, @Param("appraise") String appraise);

    /**
     * 添加评价分项
     *
     * @param appraise 要添加的评价分项
     * @return 是否添加成功
     */
    boolean addAppraise_admin(Appraise appraise);

    /**
     * 根据编号删除评价分项
     *
     * @param appraiseId 评价分项编号
     * @return 是否删除成功
     */
    boolean delAppraise_admin(Integer appraiseId);

    /**
     * 根据编号获取评价分项信息
     *
     * @param appraiseId 评价分项编号
     * @return 要获取的评价分项
     */
    Appraise getAppraiseById_admin(Integer appraiseId);

    /**
     * 根据编号修改评价分项
     *
     * @param appraise 要修改的评价分项
     * @return 是否修改成功
     */
    boolean editAppraiseById_admin(Appraise appraise);

    /**
     * 查重评价分项
     *
     * @return 评价分项列表
     */
    List<Appraise> checkRepAppraise_admin(String appraise);
}
