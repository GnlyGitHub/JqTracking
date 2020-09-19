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

    @RequestMapping("getAllAppraise_Manage")
    @ResponseBody
    public List<Appraise> getAllAppraise_Manage(){
        List<Appraise> list=appraiseService.getAllAppraise_Manage();
        return list ;
    }

    @RequestMapping("/adminAppraiseList")
    public String adminAppraiseList(){
        return "adminAppraiseList";
    }

    @RequestMapping("/adminAddAppraise")
    public String adminAddAppraise(){
        return "adminAddAppraise";
    }

    @RequestMapping("/adminEditAppraise")
    public String adminEditAppraise(){
        return "adminEditAppraise";
    }

    @RequestMapping(value = "/getAllAppraise_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllAppraise_admin(Integer limit, Integer page, String appraise){
        List<Appraise> list = appraiseService.getAllAppraise_admin(appraise);
        List<Appraise> list1 = appraiseService.getAppraise_admin(limit, page, appraise);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    @RequestMapping("/delAppraiseById_admin")
    @ResponseBody
    public String delAppraiseById_admin(Integer appraiseId){
        List<DisAppraise> list = disAppraiseService.getDisAppraiseByAppraiseId(appraiseId);
        if (list.size() > 0){
            return "1";//该评价分项已被使用
        } else {
            boolean isDel = appraiseService.delAppraise_admin(appraiseId);
            return String.valueOf(isDel);
        }
    }

    @RequestMapping("/addAppraise_admin")
    @ResponseBody
    public String addAppraise_admin(Appraise appraise){
        boolean isAdd = appraiseService.addAppraise_admin(appraise);
        return String.valueOf(isAdd);
    }

    @RequestMapping("/editAppraise_admin")
    @ResponseBody
    public String editAppraise_admin(Appraise appraise){
        boolean isEdit = appraiseService.editAppraiseById_admin(appraise);
        return String.valueOf(isEdit);
    }

    @RequestMapping("/checkRepAppraise_admin")
    @ResponseBody
    public String checkRepAppraise_admin(String appraise){
        List<Appraise> list = appraiseService.checkRepAppraise_admin(appraise);
        boolean isExit = false;
        if (list.size() > 0){
            isExit = true;
        }
        return String.valueOf(isExit);
    }
}
