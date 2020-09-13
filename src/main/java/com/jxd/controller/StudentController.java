package com.jxd.controller;

import com.jxd.model.Student;
import com.jxd.service.IStudentService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.PrintWriter;
import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:50
 */
@Controller
public class StudentController {
    @Autowired
    IStudentService studentService;
    public String adminAdd_adminasa(){
        return "adminStudent";
    }

    @RequestMapping("/getAllStudent_Teacher")
    @ResponseBody
    public JSONObject getAllStudent_Teacher(Integer limit, Integer page,Integer sClass, String sName){
        List<Student> list = studentService.getAllStudent_Teacher(sClass,sName);
        //获取分页数据

        List<Student> list1 = studentService.getAllStudentByPage_Teacher(limit,page,sClass,sName);

        //将list转换为json数组
        JSONArray jsonArray = JSONArray.fromObject(list1);
        //创建json对象，用于返回layui表格需要的数据
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());//一共有多少条数据
        jsonObject.put("data",jsonArray);

        //将json对象响应至前台
        return jsonObject;
    }

    @RequestMapping("getAllStudent_Manage")
    public List<Student> getAllStudent_Manage(){
        return null;
    }
}
