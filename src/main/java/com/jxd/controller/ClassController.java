package com.jxd.controller;

import com.jxd.model.Class;
import com.jxd.service.IClassService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:51
 */
@Controller
public class ClassController {
    @Autowired
    IClassService classService;

    //老师获取班级列表并转发到老师评价主页面
    @RequestMapping("/studentAppraise")
    public String studentAppraise_Teacher(Model model){
        List<Class> list = classService.getAllSClassBytId_Teacher(1001);
        model.addAttribute("sClasses",list);
        return "studentAppraise";
    }
    @ResponseBody
    @RequestMapping("getAllClass_Manage")
    public List<Class> getAllClass_Manage(){
return classService.getAllClass_Manage();
    }

    @RequestMapping(value = "/getAllClass_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllClass_admin(){
        List<Class> list = classService.getAllClass_admin();
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }
}
