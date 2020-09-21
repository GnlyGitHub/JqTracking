package com.jxd.controller;

import com.jxd.model.Appraise;
import com.jxd.model.DisAppraise;
import com.jxd.service.IAppraiseService;
import com.jxd.service.IDisAppraiseService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:51
 */
@Controller
public class AppraiseController {
    @Autowired
    IAppraiseService appraiseService;

    @Autowired
    IDisAppraiseService disAppraiseService;

    /**
     * @return java.util.List<com.jxd.model.Appraise>
     * @Description 获取所有的评价项
     * Param []
     */
    @RequestMapping("getAllAppraise_Manage")
    @ResponseBody
    public List<Appraise> getAllAppraise_Manage() {
        List<Appraise> list = appraiseService.getAllAppraise_Manage();
        return list;
    }
    @RequestMapping("/adminAppraiseList")
    public String adminAppraiseList() {
        return "adminAppraiseList";
    }

    @RequestMapping("/adminAddAppraise")
    public String adminAddAppraise() {
        return "adminAddAppraise";
    }

    @RequestMapping("/adminEditAppraise")
    public String adminEditAppraise() {
        return "adminEditAppraise";
    }

    //获取所有评价分项并将其分页
    @RequestMapping(value = "/getAllAppraise_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllAppraise_admin(Integer limit, Integer page, String appraise) {
        List<Appraise> list = appraiseService.getAllAppraise_admin(appraise);
        List<Appraise> list1 = appraiseService.getAppraise_admin(limit, page, appraise);

        //将查询结果返回前端页面
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    //删除评价分项
    @RequestMapping("/delAppraiseById_admin")
    @ResponseBody
    public String delAppraiseById_admin(Integer appraiseId) {
        //获取已使用的评价分项列表
        List<DisAppraise> list = disAppraiseService.getDisAppraiseByAppraiseId(appraiseId);
        if (list.size() > 0) {
            return "1";//该评价分项已被使用
        } else {
            //删除评价分项
            boolean isDel = appraiseService.delAppraise_admin(appraiseId);
            return String.valueOf(isDel);
        }
    }

    //添加评价分项
    @RequestMapping("/addAppraise_admin")
    @ResponseBody
    public String addAppraise_admin(Appraise appraise) {
        boolean isAdd = appraiseService.addAppraise_admin(appraise);
        return String.valueOf(isAdd);
    }

    //编辑评价分项
    @RequestMapping("/editAppraise_admin")
    @ResponseBody
    public String editAppraise_admin(Appraise appraise) {
        boolean isEdit = appraiseService.editAppraiseById_admin(appraise);
        return String.valueOf(isEdit);
    }

    //评价分项查重
    @RequestMapping("/checkRepAppraise_admin")
    @ResponseBody
    public String checkRepAppraise_admin(String appraise) {
        //获取已存在的评价分项列表
        List<Appraise> list = appraiseService.checkRepAppraise_admin(appraise);
        boolean isExit = false;
        if (list.size() > 0) {
            isExit = true;
        }
        return String.valueOf(isExit);
    }
}
