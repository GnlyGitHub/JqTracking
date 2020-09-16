package com.jxd.controller;

import com.jxd.model.Appraise;
import com.jxd.model.DisAppraise;
import com.jxd.model.Manager;
import com.jxd.model.Student;
import com.jxd.service.IDisAppraiseService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
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
    public String makeAppraise_Manage() {
        return "empMakeAppraise";
    }

    @RequestMapping("GetAllAppraise_Manage/{manageId}")
    @ResponseBody
    public JSONObject GetAllAppraise_Manage(String mname, Integer limit, Integer page, @PathVariable("manageId") Integer manageId) {
        List<DisAppraise> list = disAppraiseService.getAllSizeAppaise_Manage(mname, manageId);
        List<DisAppraise> list1 = disAppraiseService.getAllAppaise_Manage(mname, limit, page, manageId);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject;
    }

    @RequestMapping("AddDisAppraise_Manage")
    public String AddDisAppraise_Manage() {
        return "empAddDisAppraise";
    }

    @RequestMapping("AddDisAppraiseData_Manage")
    @ResponseBody
    public Boolean AddDisAppraiseData_Manage(String appraiseIds, Integer mId, Integer classId, Integer number) {
        JSONArray appraises = JSONArray.fromObject(appraiseIds);
        Integer md = mId;
        Integer classD = classId;
        Integer m = number;
        Boolean isInser = false;
        List<DisAppraise> list=new ArrayList<>();
        for (int i = 0; i < appraises.size(); i++) {
            DisAppraise disAppraise = new DisAppraise(appraises.getInt(i), classD, md, m);
            list.add(disAppraise);
        }
        list.add(new DisAppraise(9,classD,md,m));
        list.add(new DisAppraise(10,classD,md,m));
        isInser=disAppraiseService.insertBatchDisAppraise_Manage(list);
        return isInser;
    }

    @ResponseBody
    @RequestMapping(value = "checkDisAppraise_Manage")
    public List<DisAppraise> checkDisAppraise_Manage(Integer classId, Integer number, Integer mId) {
        List<DisAppraise> list = disAppraiseService.checkDisAppraise_Manage(mId, classId, number);
        return list;
    }

    @RequestMapping(value = "detailDisAppraise_Manage")
    public String detailDisAppraise_Manage(Integer classId, String className, Integer number, Integer mId, Model model) {
        List<DisAppraise> list = disAppraiseService.checkDisAppraise_Manage(mId, classId, number);
        model.addAttribute("className", className);
        JSONArray jsonArray = JSONArray.fromObject(list);
        model.addAttribute("list", jsonArray);
        return "empDetailDisAppraise";
    }

    @RequestMapping(value = "editDisAppraise_Manage")
    public String editDisAppraise_Manage(Integer classId, String className, Integer number, Integer mId, Model model) {
        List<DisAppraise> list = disAppraiseService.checkDisAppraise_Manage(mId, classId, number);
        model.addAttribute("classId", classId);
        model.addAttribute("className", className);
        JSONArray jsonArray = JSONArray.fromObject(list);
        model.addAttribute("list", jsonArray);
        return "empEditDisAppraise";
    }

    @RequestMapping("editDisAppraiseData_Manage")
    @ResponseBody
    public Boolean editDisAppraiseData_Manage(String appraiseIds, Integer mId, Integer classId, Integer number) {
        JSONArray appraises = JSONArray.fromObject(appraiseIds);
        boolean isInsert = false;
        boolean isDel = false;
        List<DisAppraise> list = disAppraiseService.checkDisAppraise_Manage(mId, classId, number);
        List<DisAppraise> list1 = new ArrayList<>();
        List<DisAppraise> list2 = new ArrayList<>();
        for (int i = 0; i < appraises.size(); i++) {
            for (int j = 0; j < list.size(); j++) {
                if (appraises.getInt(i) != list.get(j).getAppraiseId()) {
                    if (j + 1 == list.size()) {
                        DisAppraise disAppraise = new DisAppraise(appraises.getInt(i), classId, mId, number);
                        list1.add(disAppraise);
                    }
                } else {
                    break;
                }
            }
        }
        for (int i = 0; i < list.size(); i++) {
            for (int j = 0; j < appraises.size(); j++) {
                if (appraises.getInt(j) != list.get(i).getAppraiseId()) {
                    if (j + 1 == appraises.size()) {
                        DisAppraise disAppraise = new DisAppraise(list.get(i).getAppraiseId(), classId, mId, number);
                        list2.add(disAppraise);
                    }
                } else {
                    break;
                }
            }
        }
        if (list1.size()>0){
            isInsert = disAppraiseService.insertBatchDisAppraise_Manage(list1);
        }else {
            isInsert=true;
        }
        if (list2.size()>0){
            isDel = disAppraiseService.delBatchDisAppraise_Manage(list2);
        }else {
            isDel=true;
        }
        return isDel && isInsert;
    }
    @ResponseBody
    @RequestMapping("delDisAppraiseData_Manage")
    public Boolean delDisAppraiseData_Manage(String delApp){
        JSONArray jsonArray=JSONArray.fromObject(delApp);
        List<DisAppraise> list=new ArrayList<>();
        for (int i=0;i<jsonArray.size();i++){
            JSONObject jsonObject=jsonArray.getJSONObject(i);
            DisAppraise disAppraise=new DisAppraise(jsonObject.getInt("number"),jsonObject.getInt("classId"),jsonObject.getInt("mId"));
            list.add(disAppraise);
        }
        boolean isDel=disAppraiseService.deleteDisAppraise_Manage(list);
        return isDel;
    }
}
