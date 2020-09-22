package com.jxd.controller;

import com.jxd.model.Job;
import com.jxd.model.Student;
import com.jxd.service.IJobService;
import com.jxd.service.IStudentService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.UUID.randomUUID;

/**
 * @author Liang Yue
 * @description TODO
 * @date 2020/9/10 19:50
 */
@Controller
public class StudentController {
    @Autowired
    IStudentService studentService;
    @Autowired
    IJobService jobService;

    @RequestMapping("/adminStudentList")
    public String adminStudentList() {
        return "adminStudentList";
    }

    @RequestMapping("/adminAddStudent")
    public String adminAddStudent(){
        return "adminAddStudent";
    }

    @RequestMapping("/adminEditStudent")
    public String adminEditStudent(){
        return "adminEditStudent";
    }

    //获取学生
    @RequestMapping("/getAllStudent_Teacher")
    @ResponseBody
    public JSONObject getAllStudent_Teacher(Integer limit, Integer page, Integer sClass, String sName) {
        List<Student> list = studentService.getAllStudent_Teacher(sClass, sName);
        //获取分页数据

        List<Student> list1 = studentService.getAllStudentByPage_Teacher(limit, page, sClass, sName);

        //将list转换为json数组
        JSONArray jsonArray = JSONArray.fromObject(list1);
        //创建json对象，用于返回layui表格需要的数据
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());//一共有多少条数据
        jsonObject.put("data", jsonArray);

        //将json对象响应至前台
        return jsonObject;
    }

    /**
     * @param
     * @return 获得所有的员工数据
     * @description: getAllStudent_Manage
     * @author zhou yang
     * @date 2020/9/21 16:21
     */
    @RequestMapping("getAllStudent_Manage")
    public List<Student> getAllStudent_Manage() {
        return null;
    }

    /**
     * 获取学生列表并将其分页
     * @param limit 每页数量
     * @param page 当前页数
     * @param sName 过滤条件
     * @param sClass 过滤条件
     * @return 当前页的学生列表
     */
    @RequestMapping(value = "/getAllStudent_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllStudent_admin(Integer limit, Integer page, String sName, Integer sClass) {
        List<Student> list = studentService.getAllStudent_admin(sClass, sName);
        List<Student> list1 = studentService.getStudent_admin(limit, page, sClass, sName);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    /**
     * 图片上传
     * @param file 要上传的图片
     * @param request HttpServletRequest对象
     * @return 返回上传结果
     */
    @ResponseBody
    @RequestMapping("/upload")
    public Map upload(MultipartFile file, HttpServletRequest request) {
        String prefix = "";
        String dateStr = "";

        //保存上传
        OutputStream out = null;
        InputStream fileInput = null;
        try {
            if (file != null) {
                String originalName = file.getOriginalFilename();
                prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
                Date date = new Date();
                String uuid = randomUUID() + "";//生成随机字符串
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//获取系统时间作为存储路径
                dateStr = simpleDateFormat.format(date);
                String filepath = "D:\\IdeaProjects\\frame\\JqTracking\\src\\main\\webapp\\static\\img\\" + dateStr + "\\" + uuid + "." + prefix;
                File files = new File(filepath);

                //打印查看上传路径
                System.out.println(filepath);
                if (!files.getParentFile().exists()) {
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
                Map<String, Object> map2 = new HashMap<>();
                Map<String, Object> map = new HashMap<>();
                map.put("code", 0);
                map.put("msg", "");
                map.put("data", map2);
                map2.put("src", "/static/img/" + dateStr + "/" + uuid + "." + prefix);
                return map;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {//关闭资源
            try {
                if (out != null) {
                    out.close();
                }
                if (fileInput != null) {
                    fileInput.close();
                }
            } catch (IOException e) {
            }
        }
        Map<String, Object> map = new HashMap<>();
        map.put("code", 1);
        map.put("msg", "");
        return map;
    }

    /**
     * 删除已上传的图片
     * @param path 要删除的图片路径
     * @param request HttpServletRequest对象
     * @return 是否删除成功
     */
    @RequestMapping(value = "/delFile", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String delFile(String path, HttpServletRequest request) {
        String filepath = "D:\\IdeaProjects\\frame\\JqTracking\\src\\main\\webapp\\" + path;
        File file = new File(filepath);
        if (file.exists() && file.isFile()){//如果存在
            if (file.delete()){
                return "删除成功";
            } else {
                return "删除失败";
            }
        } else {
            return "不存在该文件";
        }
    }

    /**
     * 根据部门编号获取所有职务
     * @param deptNo 部门编号
     * @return 该部门的职务集合
     */
    @RequestMapping(value = "/getAllJobByDeptNo_admin", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllJobByDeptNo_admin(Integer deptNo) {
        List<Job> list = jobService.getAllJobByDeptNo_admin(deptNo);
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    /**
     * 添加学生
     * @param student 要添加的学生
     * @return 是否添加成功
     */
    @RequestMapping("/addStudent_admin")
    @ResponseBody
    public String addStudent_admin(Student student) {
        boolean isAdd = studentService.addStudent_admin(student);
        return String.valueOf(isAdd);
    }

    /**
     * 编辑学生
     * @param student 要编辑的学生
     * @return 是否编辑成功
     */
    @RequestMapping("/editStudentById_admin")
    @ResponseBody
    public String editStudentById_admin(Student student) {
        boolean isEdit = studentService.editStudentById_admin(student);
        return String.valueOf(isEdit);
    }

    /**
     * 获取学生信息
     * @param sId 要获取的学生的编号
     * @return 该学生的信息
     */
    @RequestMapping("/getStudentById_admin")
    @ResponseBody
    public Student getStudentById_admin(Integer sId) {
        Student student = studentService.getStudentById_admin(sId);
        return student;
    }

    /**
     * 删除学生
     * @param sId 要删除的学生的编号
     * @return 是否删除成功
     */
    @RequestMapping("/delStudentById_admin")
    @ResponseBody
    public String delStudentById_admin(Integer sId) {
        Student student = studentService.getStudentById_admin(sId);
        String sHireDate = student.getsHireDate();//获取学生的入职日期
        if (sHireDate == null) {//未入职
            boolean isDel = studentService.delStudent_admin(sId);
            return String.valueOf(isDel);
        } else {
            return "1";//该学生已入职
        }
    }

    /**
     * @param classId 班级id
     * @param empName 员工姓名
     * @param empId 员工id
     * @param projectId 项目id
     * @param limit 每页数据限制
     * @param page 第几页
     * @return 返回一个员工的jsonobject对象
     * @description: GetAllStudent_Manage 用来获得自己项目组下的员工集合
     * @author zhou yang
     * @date 2020/9/21 16:22
     */
    @RequestMapping("GetAllStudent_Manage/{projectId}")
    @ResponseBody
    public JSONObject GetAllStudent_Manage(Integer classId, String empName, String empId, @PathVariable("projectId") Integer projectId, Integer limit, Integer page) {
        List<Student> list = studentService.GetAllSizeStudent_Manage(classId, empName, empId, projectId);
        List<Student> list1 = studentService.GetAllPageStudent_Manage(classId, empName, empId, projectId, limit, page);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject;
    }

}
