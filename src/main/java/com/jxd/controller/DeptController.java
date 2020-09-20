package com.jxd.controller;

import com.jxd.model.Dept;
import com.jxd.service.IDeptService;
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
 * @date 2020/9/10 19:52
 */
@Controller
public class DeptController {
    @Autowired
    IDeptService deptService;

    //获取所有部门
    @RequestMapping(value = "/getAllDept_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllDept_admin(){
        List<Dept> list = deptService.getAllDept_admin();
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }
}
