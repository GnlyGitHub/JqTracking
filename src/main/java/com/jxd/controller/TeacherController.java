package com.jxd.controller;

import com.jxd.model.Teacher;
import com.jxd.service.ITeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:49
 */
@Controller
public class TeacherController {
    @Autowired
    ITeacherService teacherService;

    @RequestMapping("/teacherAdmin")
    public String teacherAdmin(){
        return "teacherAdmin";
    }

    @RequestMapping(value = "/getAllTeacher", produces = "text/html;charset=utf-8")
    public String getAllTeacher(Integer limit, Integer page, String tName){
        List<Teacher> list = teacherService.getAllTeacher_admin(tName);
        List<Teacher> list1 = teacherService.getTeacher_admin(limit,page,tName);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }
}
