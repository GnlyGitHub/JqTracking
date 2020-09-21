package com.jxd.controller;

import com.jxd.model.Class;
import com.jxd.model.Score;
import com.jxd.service.IScoreService;
import com.jxd.service.IStudentService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:51
 */
@Controller
public class ScoreController {
    @Autowired
    IScoreService scoreService;

    @Autowired
    IStudentService studentService;

    /**
     * @Description 老师添加评价
     * @params [postData 评价项及分数, sId 学号, appraiser 评价人]
     * @return boolean
     **/
    @RequestMapping("/addAppraise_Teacher")
    @ResponseBody
    public boolean addAppraise_Teacher(String postData, Integer sId, String appraiser) {
        JSONArray jsonArray = JSONArray.fromObject(postData);
        JSONObject jsonOne;

        List<Score> list = new ArrayList<>();
        for (int i = 0; i < jsonArray.size(); i++) {
            jsonOne = jsonArray.getJSONObject(i);
            //获取一个评分项及分数
            String sub = (String) jsonOne.get("Key");
            Integer subjectId = Integer.parseInt(sub);
            String score1 = (String) jsonOne.get("Value");
            //将分数对象存入集合
            Score score = new Score(sId,subjectId,score1,appraiser);
            list.add(score);
        }
        //添加评价
        boolean isAdd =  scoreService.addScore_Teacher(list);
        //更新评价状态
        boolean isUpdate = studentService.updateScoreState_Teacher(sId);
        return isAdd && isUpdate;
    }

    /**
     * @Description 老师编辑评价
     * @params [postData 评价数据, sId 学号]
     * @return java.lang.Boolean
     **/
    @RequestMapping("/editAppraise_Teacher")
    @ResponseBody
    public Boolean editAppraise_Teacher(String postData, Integer sId){
        JSONArray jsonArray = JSONArray.fromObject(postData);
        JSONObject jsonOne;

        List<Score> list = new ArrayList<>();
        for (int i = 0; i < jsonArray.size(); i++) {
            //获取一个评分项及分数
            jsonOne = jsonArray.getJSONObject(i);
            String sub = (String) jsonOne.get("Key");
            Integer subjectId = Integer.parseInt(sub);
            String score1 = (String) jsonOne.get("Value");
            //将分数对象存入集合
            Score score = new Score(sId,subjectId,score1);
            list.add(score);
        }
        boolean isEdit =  scoreService.editScore_Teacher(list);
        return isEdit;
    }

    /**
     * @Description 将评价转发至编辑评价页面
     * @params [sId, model]
     * @return java.lang.String
     **/
    @RequestMapping("getAllScoreBySId_Teacher")
    public String getAllScoreBySId_Teacher(Integer sId, Model model){
        List<Score> list = scoreService.getScoreBySId_Teacher(sId);
        model.addAttribute("list",list);
        return "studentEditAppraise";
    }
}
