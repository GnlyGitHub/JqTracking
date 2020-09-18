package com.jxd.controller;

import com.jxd.model.LoginUser;
import com.jxd.model.Manager;
import com.jxd.service.ILoginUserService;
import com.jxd.service.IManagerService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:50
 */
@Controller
@SessionAttributes("manage")
public class ManagerController {
    @Autowired
    IManagerService managerService;
    @Autowired
    ILoginUserService loginUserService;

    @RequestMapping("/adminManagerList")
    public String adminTeacherList(){
        return "adminManagerList";
    }

    @RequestMapping("/adminAddManager")
    public String adminAddManager(){
        return "adminAddManager";
    }

    @RequestMapping("/adminEditManager")
    public String adminEditManager(){
        return "adminEditManager";
    }

    @RequestMapping("/adminRePwdManager")
    public String adminRePwdTeacher(){
        return "adminRePwdManager";
    }

    @RequestMapping("/login_Manage")
    public String login_Manage(Model model) {
        Manager manager = new Manager(5001, "小红", 2, "15613132", "2020-1-2", 3, 2);
        model.addAttribute("manage", manager);
        return "empManage";
    }

    @RequestMapping(value = "/getAllManager_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllManager_admin(Integer limit, Integer page, String mName){
        List<Manager> list = managerService.getAllManager_admin(mName);
        List<Manager> list1 = managerService.getManager_admin(limit,page,mName);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }

    @RequestMapping(value = "/addManager_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addManager_admin(Manager manager){
        boolean isAdd = managerService.addManager_admin(manager);
        Integer mId = managerService.getCurManager_admin();
        LoginUser loginUser = new LoginUser(mId, 3);
        boolean isAddLogin = loginUserService.addLoginUser_admin(loginUser);
        return String.valueOf(isAdd && isAddLogin);
    }

    @RequestMapping("/delManagerById_admin")
    @ResponseBody
    public String delManagerById_admin(Integer mId){
        boolean isDel = managerService.delManager_admin(mId);
        boolean isDelLogin = loginUserService.delLoginUser_admin(mId);
        return String.valueOf(isDel && isDelLogin);
    }

    @RequestMapping("/getManagerById_admin")
    @ResponseBody
    public Manager getManagerById_admin(Integer mId){
        Manager manager = managerService.getManagerById_admin(mId);
        return manager;
    }

    @RequestMapping("/editManager_admin")
    @ResponseBody
    public String editManager_admin(Manager manager){
        boolean isEdit = managerService.editManagerById_admin(manager);
        return String.valueOf(isEdit);
    }

    @RequestMapping(value = "/rePwdManager_admin")
    @ResponseBody
    public String rePwdManager_admin(LoginUser loginUser){
        boolean isRe = loginUserService.editLoginUser_admin(loginUser);
        return String.valueOf(isRe);
    }

    @RequestMapping("empManage")
    public String empManage(){
        return "empManage";
    }
}
