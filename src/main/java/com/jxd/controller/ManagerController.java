package com.jxd.controller;

import com.jxd.model.DisAppraise;
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

    /**
     * 获取项目经理列表并进行分页
     * @param limit 每页数量
     * @param page 当前页数
     * @param mName 过滤条件
     * @return 当前页的项目经理列表
     */
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

    /**
     * 添加项目经理
     * @param manager 要添加的项目经理
     * @return 是否添加成功
     */
    @RequestMapping(value = "/addManager_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addManager_admin(Manager manager){
        boolean isAdd = managerService.addManager_admin(manager);
        Integer mId = managerService.getCurManager_admin();
        LoginUser loginUser = new LoginUser(mId, 3);
        boolean isAddLogin = loginUserService.addLoginUser_admin(loginUser);
        return String.valueOf(isAdd && isAddLogin);
    }

    /**
     * 删除项目经理
     * @param mId 要删除的项目经理工号
     * @return 是否删除成功
     */
    @RequestMapping("/delManagerById_admin")
    @ResponseBody
    public String delManagerById_admin(Integer mId){
        List<DisAppraise> list = managerService.getDisAppraiseBymId(mId);//获取该项目经理已经参与的评分项分配列表
        if (list.size() > 0){
            return "1";//该项目经理已参与评分项分配，不能删除
        } else {//该项目经理未参与评分项分配，可以删除

            //执行删除方法并返回结果
            boolean isDel = managerService.delManager_admin(mId);
            boolean isDelLogin = loginUserService.delLoginUser_admin(mId);
            return String.valueOf(isDel && isDelLogin);
        }
    }

    /**
     * 获取项目经理信息
     * @param mId 要获取的项目经理的工号
     * @return 项目经理信息
     */
    @RequestMapping("/getManagerById_admin")
    @ResponseBody
    public Manager getManagerById_admin(Integer mId){
        Manager manager = managerService.getManagerById_admin(mId);
        return manager;
    }

    /**
     * 编辑项目经理信息
     * @param manager 要编辑的项目经理
     * @return 是否编辑成功
     */
    @RequestMapping("/editManager_admin")
    @ResponseBody
    public String editManager_admin(Manager manager){
        boolean isEdit = managerService.editManagerById_admin(manager);
        return String.valueOf(isEdit);
    }

    /**
     * 给经理重置密码
     * @param loginUser 要重置密码的登录对象
     * @return 是否登录成功
     */
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
