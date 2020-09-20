<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/14
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .red {
            border-color: red;
        }
    </style>
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
                            <input id="sName" type="text" name="sName" required lay-verify="required"
                                   placeholder="请输入姓名" autocomplete="off" class="layui-input">
                            <p id="sNameP" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入姓名</p>
                        </div>
                    </div>
                </td>
                <td rowspan="4">
                    <input type="hidden" name="sPhoto" id="sPhoto" class="image">
                    <div class="layui-form-item">
                        <div style="border: 1px solid rgba(0,0,0,0.4);width: 110px;  height: 140px; margin-left: 80px; text-align: center">
                            <img class="layui-upload-img" id="demo1" width="108" height="138"
                                 src="../../static/img/admin.jpg">
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
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sSex" value="1" title="男" checked>
                            <input type="radio" name="sSex" value="2" title="女">
                        </div>
                    </div>
                </td>
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
                            <input id="sBirthday" type="date" name="sBirthday" required lay-verify="date"
                                   placeholder="请输入出生年月" autocomplete="off" class="layui-input">
                            <p id="sBirthdayP"
                               style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入出生年月</p>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="layui-form-item" id="area-picker">
                        <div class="layui-form-label">籍贯</div>
                        <div class="layui-input-inline" style="width: 160px;">
                            <select name="province" id="province" class="province-selector" data-value="山东省"
                                    lay-filter="province-1">
                                <option value="">请选择省</option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="width: 160px;">
                            <select name="city" id="city" class="city-selector" data-value="济南市" lay-filter="city-1">
                                <option value="">请选择市</option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="width: 160px;">
                            <select name="county" id="county" class="county-selector" data-value="历下区"
                                    lay-filter="county-1">
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
                            <input id="sPhone" type="text" name="sPhone" required lay-verify="phone" placeholder="请输入电话"
                                   autocomplete="off" class="layui-input">
                            <p id="sPhoneP1" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入电话</p>
                            <p id="sPhoneP2" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入正确电话</p>
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
                            <input id="sIdCard" type="text" name="sIdCard" required lay-verify="required"
                                   placeholder="请输入身份证号" autocomplete="off" class="layui-input">
                            <p id="sIdCardP1" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入身份证号码</p>
                            <p id="sIdCardP2" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入正确身份证号码</p>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">学校</label>
                        <div class="layui-input-inline">
                            <input id="sSchool" type="text" name="sSchool" required lay-verify="required"
                                   placeholder="请输入学校" autocomplete="off" class="layui-input">
                            <p id="sSchoolP"
                               style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入学校</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="layui-form-item">
                        <label class="layui-form-label">专业</label>
                        <div class="layui-input-inline">
                            <input id="sMajor" type="text" name="sMajor" required lay-verify="required"
                                   placeholder="请输入专业" autocomplete="off" class="layui-input">
                            <p id="sMajorP"
                               style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入专业</p>
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
                            <input id="sHireDate" type="date" name="sHireDate" required lay-verify="date"
                                   placeholder="请输入入职日期" autocomplete="off" class="layui-input">
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
                            <input id="sRemarks" type="text" name="sRemarks" required lay-verify="required"
                                   placeholder="请输入备注" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </td>
            </tr>
        </table>

        <div class="layui-form-item" style="display: flex; justify-content: center">
            <div class="layui-input-inline">
                <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
                <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
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
    layui.use(['form', 'layer', 'upload', 'layarea'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        var upload = layui.upload;
        var layarea = layui.layarea;
        var regPhone = /^(([0-9]{7,8})|(1[0-9]{10}))$/;
        var regIdCard = /^\d{14}(\d|X|x)$|^\d{17}(\d|X|x)$/;

        //表单验证
        $("#sName").blur(function () {
            if ($("#sName").val() == "") {
                $("#sName").addClass("red");
                $("#sNameP").css("display", "inline");
            }
        }).focus(function () {
            $("#sName").removeClass("red");
            $("#sNameP").css("display", "none");
        });
        $("#sBirthday").blur(function () {
            if ($("#sBirthday").val() == "") {
                $("#sBirthday").addClass("red");
                $("#sBirthdayP").css("display", "inline");
            }
        }).focus(function () {
            $("#sBirthday").removeClass("red");
            $("#sBirthdayP").css("display", "none");
        });
        $("#sPhone").blur(function () {
            if ($("#sPhone").val() == "") {
                $("#sPhone").addClass("red");
                $("#sPhoneP1").css("display", "inline");
                $("#sPhoneP2").css("display", "none");
            } else if (!regPhone.test($("#sPhone").val())) {
                $("#sPhone").addClass("red");
                $("#sPhoneP1").css("display", "none");
                $("#sPhoneP2").css("display", "inline");
            }
        }).focus(function () {
            $("#sPhone").removeClass("red");
            $("#sPhoneP1").css("display", "none");
            $("#sPhoneP2").css("display", "none");
        });
        $("#sIdCard").blur(function () {
            if ($("#sIdCard").val() == "") {
                $("#sIdCard").addClass("red");
                $("#sIdCardP1").css("display", "inline");
                $("#sIdCardP2").css("display", "none");
            } else if (!regIdCard.test($("#sIdCard").val())) {
                $("#sIdCard").addClass("red");
                $("#sIdCardP1").css("display", "none");
                $("#sIdCardP2").css("display", "inline");
            }
        }).focus(function () {
            $("#sIdCard").removeClass("red");
            $("#sIdCardP1").css("display", "none");
            $("#sIdCardP2").css("display", "none");
        });
        $("#sSchool").blur(function () {
            if ($("#sSchool").val() == "") {
                $("#sSchool").addClass("red");
                $("#sSchoolP").css("display", "inline");
            }
        }).focus(function () {
            $("#sSchool").removeClass("red");
            $("#sSchoolP").css("display", "none");
        });
        $("#sMajor").blur(function () {
            if ($("#sMajor").val() == "") {
                $("#sMajor").addClass("red");
                $("#sMajorP").css("display", "inline");
            }
        }).focus(function () {
            $("#sMajor").removeClass("red");
            $("#sMajorP").css("display", "none");
        });

        //向部门下拉框添加选项
        $.ajax({
            url: '/getAllDept_admin',
            dataType: 'json',
            data: {'state': 0},
            type: 'post',
            success: function (data) {
                $.each(data.data, function (index, item) {
                    $('#deptNo').append(new Option(item.deptName, item.deptNo));//下拉菜单里添加元素
                });
                layui.form.render("select");
            }
        });

        //向职务及项目下拉框添加选项
        form.on('select(test)', function (data) {
            $.ajax({
                url: '/getAllJobByDeptNo_admin',
                dataType: 'json',
                data: {'state': 0, 'deptNo': data.value},
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
                data: {'state': 0, 'deptNo': data.value},
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
            , url: '/upload'
            , accept: 'images'
            , size: 50000
            , before: function (obj) {
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result);
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //删除原图片
                $.ajax({
                    url: "delFile",
                    type: "post",
                    data: {
                        path: $("#sPhoto").val()
                    },
                    success: function (data) {
                        //alert(data);
                    },
                    error: function (data) {
                        alert("执行失败");
                    }
                });
                //上传成功
                var demoText = $('#demoText');
                var fileupload = $(".image");
                fileupload.attr("value", res.data.src);
                //console.log(fileupload.attr("value"));
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
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
        for (var i = 0; i < nations.length; i++) {
            option += '<option value="' + nations[i] + '">' + nations[i] + '</option>';
        }
        $(option).appendTo("#sNation");

        //向班期下拉框添加选项
        $.ajax({
            url: '/getAllClass_admin',
            dataType: 'json',
            data: {'state': 0},
            type: 'post',
            success: function (data) {
                $.each(data.data, function (index, item) {
                    $('#sClass').append(new Option(item.className, item.classId));//下拉菜单里添加元素
                });
                layui.form.render("select");
            }
        });

        //重置
        $("#reset").click(function () {
            $.ajax({
                url: "delFile",
                type: "post",
                data: {
                    path: $("#sPhoto").val()
                },
                success: function (data) {
                    //alert(data);
                },
                error: function (data) {
                    alert("执行失败");
                }
            });
            $("#sName").val("");
            $("#sBirthday").val("");
            $("#sPhone").val("");
            $("#sPhoto").val("");
            $("#demo1").attr("src", "../../static/img/admin.jpg");
            $("#sIdCard").val("");
            $("#sSchool").val("");
            $("#sMajor").val("");
            $("#sHireDate").val("");
            $("#sRemarks").val("");
        });

        //提交
        $("#sub").click(function () {
            if ($("#sName").val() == "") {
                $("#sName").addClass("red");
                $("#sNameP").css("display", "inline");
            } else if ($("#sBirthday").val() == "") {
                $("#sBirthday").addClass("red");
                $("#sBirthdayP").css("display", "inline");
            } else if ($("#sPhone").val() == "") {
                $("#sPhone").addClass("red");
                $("#sPhoneP1").css("display", "inline");
            } else if (!regPhone.test($("#sPhone").val())) {
                $("#sPhone").addClass("red");
                $("#sPhoneP2").css("display", "inline");
            } else if ($("#sIdCard").val() == "") {
                $("#sIdCard").addClass("red");
                $("#sIdCardP1").css("display", "inline");
            } else if (!regIdCard.test($("#sIdCard").val())) {
                $("#sIdCard").addClass("red");
                $("#sIdCardP2").css("display", "inline");
            } else if ($("#sSchool").val() == "") {
                $("#sSchool").addClass("red");
                $("#sSchoolP").css("display", "inline");
            } else if ($("#sMajor").val() == "") {
                $("#sMajor").addClass("red");
                $("#sMajorP").css("display", "inline");
            } else {
                var sPlace = $("#province").val() + $("#city").val() + $("#county").val();
                $.ajax({
                    url: 'addStudent_admin',
                    type: 'post',
                    data: {
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
                    dataType: 'text',
                    success: function (data) {
                        if (data == "true") {
                            layer.msg("添加成功");
                            setTimeout('closeAdd()', 1000)
                        } else {
                            layer.msg("添加失败");
                            setTimeout('closeAdd()', 1000)
                        }
                    },
                    error: function () {
                        layer.msg("执行失败");
                    }
                })
            }
        })
    });
    var closeAdd = function () {
        parent.location.reload();
    }
</script>
</body>
</html>
