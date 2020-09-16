<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/15
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改学生信息</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="padding: 30px 0 0 20px;display: flex; justify-content: center">
    <div class="layui-form">
        <table>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-inline">
                            <input id="sName" type="text" name="sName" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </td>
                <td rowspan="4">
                    <input type="hidden" name="sPhoto" id="sPhoto" class="image">
                    <div class="layui-form-item">
                        <div style="border: 1px solid rgba(0,0,0,0.4);width: 110px;  height: 140px; margin-left: 80px; text-align: center">
                            <img class="layui-upload-img" id="demo1" width="100">
                        </div>
                        <%--<label class="layui-form-label ">照片:</label>--%>
                        <div class="layui-upload" style="margin: 10px 0 0 90px">
                            <button type="button" class="layui-btn" id="test1">上传照片</button>
                            <div class="layui-upload-list">
                                <%--<p id="demoText"></p>--%>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td><div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sSex" value="1" title="男" checked>
                        <input type="radio" name="sSex" value="2" title="女">
                    </div>
                </div></td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">民族</label>
                        <div class="layui-input-inline">
                            <select id="sNation" name="sNation" lay-verify="required">
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">出生年月</label>
                        <div class="layui-input-inline">
                            <input id="sBirthday" type="date" name="sBirthday" required  lay-verify="date" placeholder="请输入出生年月" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </td>
            </tr>
            <%
                String sPlace = request.getParameter("sPlace");
                //String sPlace = "山东省青岛市崂山区";
                int proIndex = sPlace.indexOf("省");
                int cityIndex = sPlace.indexOf("市");
                String province = sPlace.substring(0, proIndex+1);
                String city = sPlace.substring(proIndex+1, cityIndex+1);
                String county = sPlace.substring(cityIndex+1);
            %>
            <tr>
                <td colspan="2">
                    <div class="layui-form-item" id="area-picker">
                        <div class="layui-form-label">籍贯</div>
                        <div class="layui-input-inline" style="width: 160px;">
                            <select name="province" id="province" class="province-selector" data-value="<%=province%>" lay-filter="province-1">
                                <option value="">请选择省</option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="width: 160px;">
                            <select name="city" id="city" class="city-selector" data-value="<%=city%>" lay-filter="city-1">
                                <option value="">请选择市</option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="width: 160px;">
                            <select name="county" id="county" class="county-selector" data-value="<%=county%>" lay-filter="county-1">
                                <option value="">请选择区</option>
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">电话</label>
                        <div class="layui-input-inline">
                            <input id="sPhone" type="text" name="sPhone" required  lay-verify="phone" placeholder="请输入电话" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">婚否</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sMarry" value="1" title="未婚" checked>
                            <input type="radio" name="sMarry" value="2" title="已婚">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="layui-form-item">
                        <label class="layui-form-label">身份证</label>
                        <div class="layui-input-block" style="width: 500px;">
                            <input id="sIdCard" type="text" name="sIdCard" required  lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">学校</label>
                        <div class="layui-input-inline">
                            <input id="sSchool" type="text" name="sSchool" required  lay-verify="required" placeholder="请输入学校" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">专业</label>
                        <div class="layui-input-inline">
                            <input id="sMajor" type="text" name="sMajor" required  lay-verify="required" placeholder="请输入专业" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">班期</label>
                        <div class="layui-input-inline">
                            <select id="sClass" name="sClass" lay-verify="required">
                            </select>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">部门</label>
                        <div class="layui-input-inline">
                            <select id="deptNo" name="deptNo" lay-filter="test" lay-verify="required">
                            </select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">职务</label>
                        <div class="layui-input-inline">
                            <select id="jobId" name="jobId" lay-verify="required">
                                <option value="1">学员</option>
                            </select>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">入职日期</label>
                        <div class="layui-input-inline">
                            <input id="sHireDate" type="date" name="sHireDate" required  lay-verify="date" placeholder="请输入入职日期" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">项目</label>
                        <div class="layui-input-inline">
                            <select id="projectId" name="projectId" lay-verify="required">
                            </select>
                        </div>
                    </div>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="layui-form-item">
                        <label class="layui-form-label">备注</label>
                        <div class="layui-input-block" style="width: 500px;">
                            <input id="sRemarks" type="text" name="sRemarks" required  lay-verify="required" placeholder="请输入备注" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </td>
            </tr>
        </table>

        <div class="layui-form-item" style="display: flex; justify-content: center">
            <div class="layui-input-inline">
                <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</div>
<script>
    //配置省事联动插件目录
    layui.config({
        base: '../../static/mods/'
        , version: '1.0'
    });

    //引入layui
    layui.use(['form','layer','upload','layarea'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        var upload = layui.upload;
        var layarea = layui.layarea;
        var sId = ${param.sId};

        //向部门下拉框添加选项
        $.ajax({
            url: '/getAllDept_admin',
            dataType: 'json',
            data:{'state': 0},
            type: 'post',
            success: function (data) {
                $.each(data.data, function (index, item) {
                    $('#deptNo').append(new Option(item.deptName, item.deptNo));//下拉菜单里添加元素
                });
                layui.form.render("select");
            }
        });

        //向职务及项目下拉框添加选项
        form.on('select(test)', function(data){
            $.ajax({
                url: '/getAllJobByDeptNo_admin',
                dataType: 'json',
                data:{'state': 0, 'deptNo': data.value},
                type: 'post',
                success: function (data) {
                    jobId.options.length = 0;
                    $.each(data.data, function (index, item) {
                        $('#jobId').append(new Option(item.jobName, item.jobId));//下拉菜单里添加元素
                    });
                    layui.form.render("select");
                }
            });
            $.ajax({
                url: '/getProject_admin',
                dataType: 'json',
                data:{'state': 0, 'deptNo': data.value},
                type: 'post',
                success: function (data) {
                    projectId.options.length = 0;
                    $('#projectId').append(new Option('请选择', ''));
                    $.each(data.data, function (index, item) {
                        $('#projectId').append(new Option(item.projectName, item.projectId));//下拉菜单里添加元素
                    });
                    layui.form.render("select");
                }
            });
        });

        //省市区联动
        layarea.render({
            elem: '#area-picker',
            change: function (res) {
                //选择结果
                //console.log(res);
            }
        });

        //图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '/upload'
            ,accept:'images'
            ,size:50000
            ,before: function(obj){
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result);
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
                //var demoText = $('#demoText');
                //demoText.html('<span style="color: #4cae4c;">上传成功</span>');
                var fileupload = $(".image");
                fileupload.attr("value",res.data.src);
                //console.log(fileupload.attr("value"));
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });

        //向民族下拉框添加选项
        var nations = ["汉族", "蒙古族", "回族", "藏族", "维吾尔族", "苗族", "彝族", "壮族", "布依族", "朝鲜族", "满族", "侗族", "瑶族", "白族",
            "土家族", "哈尼族", "哈萨克族", "傣族", "黎族", "傈僳族", "佤族", "畲族", "高山族", "拉祜族", "水族", "东乡族", "纳西族", "景颇族", "柯尔克孜族", "土族",
            "达斡尔族", "仫佬族", "羌族", "布朗族", "撒拉族", "毛南族", "仡佬族", "锡伯族", "阿昌族", "普米族", "塔吉克族", "怒族", "乌孜别克族", "俄罗斯族", "鄂温克族",
            "德昂族", "保安族", "裕固族", "京族", "塔塔尔族", "独龙族", "鄂伦春族", "赫哲族", "门巴族", "珞巴族", "基诺族"];
        var option = "";
        for(var i = 0; i < nations.length; i++) {
            option += '<option value="' + nations[i] + '">' + nations[i] + '</option>';
        }
        $(option).appendTo("#sNation");

        //向班期下拉框添加选项
        $.ajax({
            url: '/getAllClass_admin',
            dataType: 'json',
            data:{'state': 0},
            type: 'post',
            success: function (data) {
                $.each(data.data, function (index, item) {
                    $('#sClass').append(new Option(item.className, item.classId));//下拉菜单里添加元素
                });
                layui.form.render("select");
            }
        });

        //获取学生信息
        $.ajax({
            url:"getStudentById_admin",
            type:"get",
            dataType:"json",
            data:{
                sId: sId
            },
            success:function(data){
                var sPhoto = "../../static" + data.sPhoto;//获取照片路径

                $("#sName").val(data.sName);
                $("#sBirthday").val(data.sBirthday);
                $("#sPhone").val(data.sPhone);
                $("input[name=sSex][value='1']").attr("checked", data.sSex == 1 ? true : false);
                $("input[name=sSex][value='2']").attr("checked", data.sSex == 2 ? true : false);
                $("#sNation option[value=" + data.sNation + "]").attr("selected","selected");
                $("#sPhoto").val(data.sPhoto);
                $("#demo1").attr("src",sPhoto);
                $("input[name=sMarry][value='1']").attr("checked", data.sMarry == 1 ? true : false);
                $("input[name=sMarry][value='2']").attr("checked", data.sMarry == 2 ? true : false);
                $("#sIdCard").val(data.sIdCard);
                $("#sSchool").val(data.sSchool);
                $("#sMajor").val(data.sMajor);
                $("#sClass option[value=" + data.sClass + "]").attr("selected","selected");
                $("#sHireDate").val(data.sHireDate);
                $("#sRemarks").val(data.sRemarks);
                $("#deptNo option[value=" + data.deptNo + "]").attr("selected","selected");

                var jobId1 = data.jobId;
                var projectId1 = data.projectId;
                $.ajax({
                    url: '/getProject_admin',
                    dataType: 'json',
                    data:{'state': 0, 'deptNo': data.deptNo},
                    type: 'post',
                    success: function (data) {
                        projectId.options.length = 0;
                        $.each(data.data, function (index, item) {
                            $('#projectId').append(new Option(item.projectName, item.projectId));//下拉菜单里添加元素
                        });
                        $("#projectId option[value=" + projectId1 + "]").attr("selected","selected");
                        layui.form.render("select");
                    }
                });
                $.ajax({
                    url: '/getAllJobByDeptNo_admin',
                    dataType: 'json',
                    data:{'state': 0, 'deptNo': data.deptNo},
                    type: 'post',
                    success: function (data) {
                        jobId.options.length = 0;
                        $.each(data.data, function (index, item) {
                            $('#jobId').append(new Option(item.jobName, item.jobId));//下拉菜单里添加元素
                        });
                        $("#jobId option[value=" + jobId1 + "]").attr("selected","selected");
                        layui.form.render("select");
                    }
                });
                form.render();
            },
            error:function (data) {
                layer.msg("执行失败");
            }
        });


        $("#sub").click(function () {
            var sPlace = $("#province").val() + $("#city").val() + $("#county").val();
            $.ajax({
                url:'editStudentById_admin',
                type:'post',
                data:{
                    "sId": sId,
                    "sName": $("#sName").val(),
                    "sSex": $('input[name="sSex"]:checked').val(),
                    "sBirthday": $("#sBirthday").val(),
                    "sPhone": $("#sPhone").val(),
                    "sNation": $("#sNation").val(),
                    "sPlace": sPlace,
                    "sPhoto": $("#sPhoto").val(),
                    "sMarry": $('input[name="sMarry"]:checked').val(),
                    "sIdCard": $("#sIdCard").val(),
                    "sSchool": $("#sSchool").val(),
                    "sMajor": $("#sMajor").val(),
                    "sClass": $("#sClass").val(),
                    "sHireDate": $("#sHireDate").val(),
                    "deptNo": $("#deptNo").val(),
                    "jobId": $("#jobId").val(),
                    "sRemarks": $("#sRemarks").val(),
                    "projectId": $("#projectId").val()
                },
                dataType:'text',
                success:function (data) {
                    if (data == "true"){
                        layer.msg("修改成功");
                        setTimeout('close()',1000)
                    } else {
                        layer.msg("修改失败");
                        setTimeout('close()',1000)
                    }
                },
                error:function () {
                    layer.msg("执行失败");
                }
            })
        })
    });
    //关闭当前弹框
    var close = function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>
</body>
</html>
