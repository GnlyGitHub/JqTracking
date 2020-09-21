package com.jxd.controller;

import com.jxd.model.Grade;
import com.jxd.model.Score;
import com.jxd.model.Student;
import com.jxd.service.IGradeService;
import com.jxd.service.IScoreService;
import com.jxd.service.IStudentService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:52
 */
@Controller
public class GradeController {
    @Autowired
    IGradeService gradeService;
    @Autowired
    IStudentService studentService;
    @Autowired
    IScoreService scoreService;
    @Autowired
    IGradeService getGradeService;

    /**
     * @return java.lang.String
     * @Description 返回员工的信息总表
     * Param []
     */
    @RequestMapping("empAppraise_Manage")
    public String empAppraise_Manage() {
        return "empGrade";
    }

    /**
     * @return java.lang.String
     * @Description 查看员工的学员信息以及入职评价
     * Param [mId, sId, className, model]number是转正等情况id，mid是经理id，，classname是班级名称
     */
    @RequestMapping("detailEmpMsg_Manage")
    public String detailEmpMsg_Manage(Integer mId, Integer sId, String className, Model model) {
        Map<String, String> map = studentService.getStudentById_Manage(sId);
        List<Score> scores = scoreService.getScoreById_Manage(sId);
        List<Grade> grades0 = gradeService.getGradeById_Manage(sId, 0);
        List<Grade> grades1 = gradeService.getGradeById_Manage(sId, 1);
        List<Grade> grades2 = gradeService.getGradeById_Manage(sId, 2);
        List<Grade> grades3 = gradeService.getGradeById_Manage(sId, 3);
        Grade grade = new Grade();
        Score score = new Score();
        if (scores.size() == 0) {
            scores.add(score);
        }
        if (grades0.size() == 0) {
            grades0.add(grade);
        }
        if (grades1.size() == 0) {
            grades1.add(grade);
        }
        if (grades2.size() == 0) {
            grades2.add(grade);
        }
        if (grades3.size() == 0) {
            grades3.add(grade);
        }
        model.addAttribute("stu", map);
        model.addAttribute("className", className);
        model.addAttribute("grade0", grades0);
        model.addAttribute("grade1", grades1);
        model.addAttribute("grade2", grades2);
        model.addAttribute("grade3", grades3);
        model.addAttribute("score", scores);
        return "empDetailMsg";
    }

    /**
     * @return java.lang.String
     * @Description 把相关数据转到评价信息页面
     * Param [sId, classId, model, request]classid是班级id，sid是学生id
     */
    @RequestMapping("addGrade_Manage")
    public String addGrade_Manage(Integer sId, Integer classId, Model model, HttpServletRequest request) {
        Map<String, String> map = studentService.getStudentById_Manage(sId);
        model.addAttribute("stu", map);
        request.setAttribute("sDate", map.get("sHireDate"));
        model.addAttribute("sId", sId);
        model.addAttribute("classId", classId);
        return "empAddGrade";
    }

    /**
     * @return java.lang.Boolean
     * @Description 对于增加评价的数据进行修改
     * Param [dataBak, appraiser, appr, sId, number] 获取数据表格的中的成绩数据，评价者，整体评价，sid学生id,number是转正数据等id
     */
    @ResponseBody
    @RequestMapping("addGradeData_Manage")
    public Boolean addGradeData_Manage(String dataBak, String appraiser, String appr, Integer sId, Integer number) {
        JSONArray jsonArray = JSONArray.fromObject(dataBak);
        List<Grade> list = new ArrayList<>();
        String grade10 = appr;
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            Grade grade = new Grade(sId, jsonObject.getInt("appraiseId"), jsonObject.getString("grade"), number, appraiser);
            list.add(grade);
        }
        Grade grade = new Grade(sId, 10, grade10, number, appraiser);
        list.add(grade);
        boolean chaState = studentService.changeAppraiseState_Manage(number + 1, sId);
        boolean isAdd = gradeService.addGradeData_Manage(list);
        return chaState && isAdd;
    }

    /**
     * @param sId     学生的id
     * @param classId 班级的id
     * @param model   model组件
     * @param request
     * @return {{@link java.lang.String}}
     * description: editGrade_Manage
     * @author zhou yang
     * @date 2020/9/21 16:12
     */
    @RequestMapping("editGrade_Manage")
    public String editGrade_Manage(Integer sId, Integer classId, Model model, HttpServletRequest request) {
        Map<String, String> map = studentService.getStudentById_Manage(sId);
        model.addAttribute("stu", map);
        model.addAttribute("classId", classId);
        request.setAttribute("sDate", map.get("sHireDate"));
        return "empEditGrade";
    }

    /**
     * @param number 转正等id
     * @param sId    学生id
     * @return 返回分数的list集合
     * description: getGradeData_Manage
     * @author zhou yang
     * @date 2020/9/21 16:14
     */
    @RequestMapping("getGradeData_Manage")
    @ResponseBody
    public List<Grade> getGradeData_Manage(Integer number, Integer sId) {
        List<Grade> list = gradeService.getGradeById_Manage(sId, number);
        return list;
    }

    /***
     * @param dataBak 分数项的数据
     * @param appraiser 评价人iid
     * @param appr 评价内容
     * @param sId 学生id
     * @param number 转正等数据
     * @return 返回值为boolean
     * @description: editGradeData_Manage
     * @author zhou yang
     * @date 2020/9/21 16:15
     */
    @RequestMapping("editGradeData_Manage")
    @ResponseBody
    public boolean editGradeData_Manage(String dataBak, String appraiser, String appr, Integer sId, Integer number) {
        JSONArray jsonArray = JSONArray.fromObject(dataBak);
        List<Grade> list = new ArrayList<>();
        String grade10 = appr;
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            Grade grade = new Grade(sId, jsonObject.getInt("appraiseId"), jsonObject.getString("grade"), number, appraiser);
            list.add(grade);
        }
        Grade grade = new Grade(sId, 10, grade10, number, appraiser);
        list.add(grade);
        boolean isEdit = gradeService.editGradeData_Manage(list);
        return isEdit;
    }
}
