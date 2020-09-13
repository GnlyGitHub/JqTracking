package com.jxd.controller;

import com.jxd.model.Appraise;
import com.jxd.model.DisAppraise;
import com.jxd.model.Student;
import com.jxd.service.IDisAppraiseService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @RequestMapping("/makeAppraise_Manage")
    public String makeAppraise_Manage(){
        return "empMakeAppraise";
    }
    @RequestMapping("GetAllAppraise_Manage/{manageId}")
    @ResponseBody
    public JSONObject GetAllAppraise_Manage(String mname, Integer limit, Integer page,@PathVariable("manageId") Integer manageId){
        List<DisAppraise> list=disAppraiseService.getAllSizeAppaise_Manage(mname,manageId);
        List<DisAppraise> list1 = disAppraiseService.getAllAppaise_Manage(mname,limit,page,manageId);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject;
    }
@RequestMapping("AddDisAppraise_Manage")
    public String AddDisAppraise_Manage(){
        return "empAddDisAppraise";
    }
}
