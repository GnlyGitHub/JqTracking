package com.jxd.controller;

import com.jxd.model.Appraise;
import com.jxd.model.DisAppraise;
import com.jxd.model.Manager;
import com.jxd.model.Student;
import com.jxd.service.IDisAppraiseService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/12 16:09
 */
@Controller
public class DisAppraiseController {
    @Autowired
    IDisAppraiseService disAppraiseService;

    /**
     * @return java.lang.String
     * @Description 从前台获得url返回到制作评价表页面
     * Param []
     */
    @RequestMapping("/makeAppraise_Manage")
    public String makeAppraise_Manage() {
        return "empMakeAppraise";
    }

    /**
     * @return net.sf.json.JSONObject
     * @Description 获得所有的评价项
     * Param [mname, limit, page, manageId]mname选择条件，limit每页的数据量，page第几页，manageid经理编号
     */
    @RequestMapping("GetAllAppraise_Manage/{manageId}")
    @ResponseBody
    public JSONObject GetAllAppraise_Manage(String mname, Integer limit, Integer page, @PathVariable("manageId") Integer manageId) {
        List<DisAppraise> list = disAppraiseService.getAllSizeAppaise_Manage(mname, manageId);
        List<DisAppraise> list1 = disAppraiseService.getAllAppaise_Manage(mname, limit, page, manageId);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject;
    }

    /**
     * @return java.lang.String
     * @Description 根据url返回到增加评价项页面
     * Param []
     */
    @RequestMapping("AddDisAppraise_Manage")
    public String AddDisAppraise_Manage() {
        return "empAddDisAppraise";
    }

    /**
     * @return java.lang.Boolean，增添是否成功
     * @Description 对于前台的评价表的所含数据进行增添
     * Param [appraiseIds, mId, classId, number]appraiseid评价项id，mid是经理id，classid是班级id，number是转正等四种的id
     */
    @RequestMapping("AddDisAppraiseData_Manage")
    @ResponseBody
    public Boolean AddDisAppraiseData_Manage(String appraiseIds, Integer mId, Integer classId, Integer number) {
        JSONArray appraises = JSONArray.fromObject(appraiseIds);
        Integer md = mId;
        Integer classD = classId;
        Integer m = number;
        Boolean isInser = false;
        List<DisAppraise> list = new ArrayList<>();
        for (int i = 0; i < appraises.size(); i++) {
            DisAppraise disAppraise = new DisAppraise(appraises.getInt(i), classD, md, m);
            list.add(disAppraise);
        }
        list.add(new DisAppraise(9, classD, md, m));
        list.add(new DisAppraise(10, classD, md, m));
        isInser = disAppraiseService.insertBatchDisAppraise_Manage(list);
        return isInser;
    }

    /**
     * @return java.util.List<com.jxd.model.DisAppraise>
     * @Description 检查要创建的评价表是否存在
     * Param [classId, number, mId]classid是班级id，number是转正四种情况的id，mid是经理id
     */
    @ResponseBody
    @RequestMapping(value = "checkDisAppraise_Manage")
    public List<DisAppraise> checkDisAppraise_Manage(Integer classId, Integer number, Integer mId) {
        List<DisAppraise> list = disAppraiseService.checkDisAppraise_Manage(mId, classId, number);
        return list;
    }

    /**
     * @return java.lang.String
     * @Description 查看每期评价项表的具体信息
     * Param [classId, className, number, mId, model]，classid是班级id，classname是班级名，number是转正等情况id，mid是经理id
     */
    @RequestMapping(value = "detailDisAppraise_Manage")
    public String detailDisAppraise_Manage(Integer classId, String className, Integer number, Integer mId, Model model) {
        List<DisAppraise> list = disAppraiseService.checkDisAppraise_Manage(mId, classId, number);
        model.addAttribute("className", className);
        JSONArray jsonArray = JSONArray.fromObject(list);
        model.addAttribute("list", jsonArray);
        return "empDetailDisAppraise";
    }

    /**
     * @return java.lang.String
     * @Description 编辑时获得评价表的数据
     * Param [classId, className, number, mId, model]classid是班级id，number是转正等情况id，mid是经理id
     */
    @RequestMapping(value = "editDisAppraise_Manage")
    public String editDisAppraise_Manage(Integer classId, String className, Integer number, Integer mId, Model model) {
        List<DisAppraise> list = disAppraiseService.checkDisAppraise_Manage(mId, classId, number);
        model.addAttribute("classId", classId);
        model.addAttribute("className", className);
        JSONArray jsonArray = JSONArray.fromObject(list);
        model.addAttribute("list", jsonArray);
        return "empEditDisAppraise";
    }

    /**
     * @return java.lang.Boolean
     * @Description 对于要编辑的数据进行处理
     * Param [appraiseIds, mId, classId, number]classid是班级id，number是转正等情况id，mid是经理id，appraiseids是评价项json数组串
     */
    @RequestMapping("editDisAppraiseData_Manage")
    @ResponseBody
    public Boolean editDisAppraiseData_Manage(String appraiseIds, Integer mId, Integer classId, Integer number) {
        JSONArray appraises = JSONArray.fromObject(appraiseIds);
        boolean isInsert = false;
        boolean isDel = false;
        List<DisAppraise> list = disAppraiseService.checkDisAppraise_Manage(mId, classId, number);
        List<DisAppraise> list1 = new ArrayList<>();
        List<DisAppraise> list2 = new ArrayList<>();
        for (int i = 0; i < appraises.size(); i++) {
            for (int j = 0; j < list.size(); j++) {
                if (appraises.getInt(i) != list.get(j).getAppraiseId()) {
                    if (j + 1 == list.size()) {
                        DisAppraise disAppraise = new DisAppraise(appraises.getInt(i), classId, mId, number);
                        list1.add(disAppraise);
                    }
                } else {
                    break;
                }
            }
        }
        for (int i = 0; i < list.size(); i++) {
            for (int j = 0; j < appraises.size(); j++) {
                if (appraises.getInt(j) != list.get(i).getAppraiseId()) {
                    if (j + 1 == appraises.size()) {
                        DisAppraise disAppraise = new DisAppraise(list.get(i).getAppraiseId(), classId, mId, number);
                        list2.add(disAppraise);
                    }
                } else {
                    break;
                }
            }
        }
        if (list1.size() > 0) {
            isInsert = disAppraiseService.insertBatchDisAppraise_Manage(list1);
        } else {
            isInsert = true;
        }
        if (list2.size() > 0) {
            isDel = disAppraiseService.delBatchDisAppraise_Manage(list2);
        } else {
            isDel = true;
        }
        return isDel && isInsert;
    }

    /**
     * @return java.lang.Boolean
     * @Description 删除评价表
     * Param [delApp] 要删除的评级表的信息
     */
    @ResponseBody
    @RequestMapping("delDisAppraiseData_Manage")
    public Boolean delDisAppraiseData_Manage(String delApp) {
        JSONArray jsonArray = JSONArray.fromObject(delApp);
        List<DisAppraise> list = new ArrayList<>();
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            DisAppraise disAppraise = new DisAppraise(jsonObject.getInt("number"), jsonObject.getInt("classId"), jsonObject.getInt("mId"));
            list.add(disAppraise);
        }
        boolean isDel = disAppraiseService.deleteDisAppraise_Manage(list);
        return isDel;
    }

    /**
     * @return java.util.List<com.jxd.model.DisAppraise>
     * @Description 评分时要得到评价表
     * Param [mId, classId, number]classid是班级id，number是转正等情况id，mid是经理id，
     */
    @RequestMapping("getDisAppraiseTable_Manage")
    @ResponseBody
    public List<DisAppraise> getDisAppraiseTable_Manage(Integer mId, Integer classId, Integer number) {
        List<DisAppraise> list = disAppraiseService.getDisAppraiseTable_Manage(mId, classId, number);
        return list;
    }
}
