package com.jxd.dao;

import com.jxd.model.DisAppraise;
import com.jxd.model.Manager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IManagerDao {
    /**
     * 根据项目获取项目经理列表
     *
     * @param mName 项目经理姓名
     * @return 项目经理列表
     */
    List<Manager> getAllManager_admin(@Param("mName") String mName);

    /**
     * 根据分页及姓名获取项目经理列表
     *
     * @param pageSize  每页长度
     * @param pageIndex 页数
     * @param mName     项目经理姓名
     * @return 项目经理列表
     */
    List<Manager> getManager_admin(@Param("pageSize") Integer pageSize, @Param("pageIndex") Integer pageIndex, @Param("mName") String mName);

    /**
     * 添加项目经理
     *
     * @param manager 要添加的项目经理
     * @return 是否添加成功
     */
    boolean addManager_admin(Manager manager);

    /**
     * 根据工号删除项目经理
     *
     * @param mId 工号
     * @return 是否删除成功
     */
    boolean delManager_admin(Integer mId);

    /**
     * 根据工号获取项目经理信息
     *
     * @param mId 工号
     * @return 要获取的项目经理
     */
    Manager getManagerById_admin(Integer mId);

    /**
     * 根据工号修改项目经理信息
     *
     * @param manager 要修改的项目经理
     * @return 是否修改成功
     */
    boolean editManagerById_admin(Manager manager);

    /**
     * 获取新增项目经理的id
     *
     * @return 新增项目经理的id
     */
    Integer getCurManager_admin();

    /**
     * 根据项目经理id获取评价分项分配表
     *
     * @param mId 项目经理id
     * @return 评价分项分配表
     */
    List<DisAppraise> getDisAppraiseBymId(Integer mId);
}
