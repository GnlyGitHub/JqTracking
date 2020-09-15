package com.jxd.controller;

import com.jxd.model.Class;
import com.jxd.model.Score;
import com.jxd.service.IScoreService;
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

    @RequestMapping("/addAppraise_Teacher")
    @ResponseBody
    public boolean addAppraise_Teacher(String postData, Integer sId) {
        JSONArray jsonArray = JSONArray.fromObject(postData);
        JSONObject jsonOne;

        List<Score> list = new ArrayList<>();
        for (int i = 0; i < jsonArray.size(); i++) {
            jsonOne = jsonArray.getJSONObject(i);
            String sub = (String) jsonOne.get("Key");
            Integer subjectId = Integer.parseInt(sub);
            String score1 = (String) jsonOne.get("Value");

            Score score = new Score(sId,subjectId,score1,"张三");
            list.add(score);
        }
        boolean isAdd =  scoreService.addScore_Teacher(list);
        return isAdd;
    }

    @RequestMapping("/editAppraise_Teacher")
    @ResponseBody
    public Boolean editAppraise_Teacher(String postData, Integer sId){
        JSONArray jsonArray = JSONArray.fromObject(postData);
        JSONObject jsonOne;

        List<Score> list = new ArrayList<>();
        for (int i = 0; i < jsonArray.size(); i++) {
            jsonOne = jsonArray.getJSONObject(i);
            String sub = (String) jsonOne.get("Key");
            Integer subjectId = Integer.parseInt(sub);
            String score1 = (String) jsonOne.get("Value");

            Score score = new Score(sId,subjectId,score1);
            list.add(score);
        }
        boolean isEdit =  scoreService.editScore_Teacher(list);
        return isEdit;
    }

    @RequestMapping("getAllScoreBySId_Teacher")
    public String getAllScoreBySId_Teacher(Integer sId, Model model){
        List<Score> list = scoreService.getScoreBySId_Teacher(sId);
        model.addAttribute("list",list);
        return "studentEditAppraise";
    }
}
