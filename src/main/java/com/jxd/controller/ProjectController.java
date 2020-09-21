package com.jxd.controller;

import com.jxd.model.Project;
import com.jxd.service.IProjectService;
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
 * @date 2020/9/12 15:18
 */
@Controller
public class ProjectController {
    @Autowired
    IProjectService projectService;

    /**
     * 获取所有项目
     * @return 所有项目列表
     */
    @RequestMapping(value = "/getAllProject_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllProject_admin(){
        List<Project> list = projectService.getAllProject_admin();
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }

    /**
     * 根据部门编号获取所有项目
     * @param deptNo 部门编号
     * @return 该部门的项目集合
     */
    @RequestMapping(value = "/getProject_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getProject_admin(Integer deptNo){
        List<Project> list = projectService.getProjectByDeptNo_admin(deptNo);
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }
}
