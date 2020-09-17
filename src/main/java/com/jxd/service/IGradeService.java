package com.jxd.service;

import com.jxd.model.Grade;

import java.util.GregorianCalendar;
import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 22:08
 */
public interface IGradeService {
    /**
     * @Description 根据员工id和序数得到评价评价
     *Param [sId]
     * @return java.util.List<com.jxd.model.Grade>
     */
    List<Grade> getGradeById_Manage(Integer sId,Integer number);
   /**
    * @Description 批量插入评价
    *Param [list]
    * @return java.lang.Boolean
    */
    Boolean addGradeData_Manage(List<Grade> list);
    /**
     * @Description 批量更新
     *Param [list]
     * @return java.lang.Boolean
     */
    Boolean editGradeData_Manage(List<Grade> list);
}
