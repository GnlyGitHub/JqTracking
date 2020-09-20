<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/13
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改教师信息</title>
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
    <div class="layui-form" style="width: 500px;">
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-inline">
                <%--<input id="tId" type="text" name="tId" readonly class="layui-input">--%>
                <label class="layui-form-label" id="tId" style="position: relative; right: 60px"></label>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input id="tName" type="text" name="tName" required lay-verify="required" placeholder="请输入姓名"
                       autocomplete="off" class="layui-input">
            </div>
            <p id="tNameP" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入姓名</p>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="tSex" value="1" title="男">
                <input type="radio" name="tSex" value="2" title="女">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">出生年月</label>
            <div class="layui-input-inline">
                <input id="tBirthday" type="date" name="tBirthday" required lay-verify="date" placeholder="请输入出生年月"
                       autocomplete="off" class="layui-input">
            </div>
            <p id="tBirthdayP" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">
                请输入出生年月</p>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-inline">
                <input id="tPhone" type="text" name="tPhone" required lay-verify="phone" placeholder="请输入电话"
                       autocomplete="off" class="layui-input">
            </div>
            <p id="tPhoneP1" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入电话</p>
            <p id="tPhoneP2" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入正确电话</p>
        </div>

        <div class="layui-form-item" style="display: flex; justify-content: center">
            <div class="layui-input-inline">
                <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</div>

<script>
    layui.use(['form', 'layer', 'upload'], function () {
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        var upload = layui.upload;
        var tId = ${param.tId};
        var reg = /^(([0-9]{7,8})|(1[0-9]{10}))$/;

        //表单验证
        $("#tName").blur(function () {
            if ($("#tName").val() == "") {
                $("#tName").addClass("red");
                $("#tNameP").css("display", "inline");
            }
        }).focus(function () {
            $("#tName").removeClass("red");
            $("#tNameP").css("display", "none");
        });
        $("#tBirthday").blur(function () {
            if ($("#tBirthday").val() == "") {
                $("#tBirthday").addClass("red");
                $("#tBirthdayP").css("display", "inline");
            }
        }).focus(function () {
            $("#tBirthday").removeClass("red");
            $("#tBirthdayP").css("display", "none");
        });
        $("#tPhone").blur(function () {
            if ($("#tPhone").val() == "") {
                $("#tPhone").addClass("red");
                $("#tPhoneP1").css("display", "inline");
                $("#tPhoneP2").css("display", "none");
            } else if (!reg.test($("#tPhone").val())) {
                $("#tPhone").addClass("red");
                $("#tPhoneP1").css("display", "none");
                $("#tPhoneP2").css("display", "inline");
            }
        }).focus(function () {
            $("#tPhone").removeClass("red");
            $("#tPhoneP1").css("display", "none");
            $("#tPhoneP2").css("display", "none");
        });

        //获取待编辑的老师的信息
        $.ajax({
            url: "getTeacherById_admin",
            type: "get",
            dataType: "json",
            data: {
                tId: tId
            },
            success: function (data) {
                $("#tId").html(tId);
                $("#tName").val(data.tName);
                $("#tBirthday").val(data.tBirthday);
                $("#tPhone").val(data.tPhone);
                $("input[name=tSex][value='1']").attr("checked", data.tSex == 1 ? true : false);
                $("input[name=tSex][value='2']").attr("checked", data.tSex == 2 ? true : false);
                form.render();
            },
            error: function (data) {
                layer.msg("执行失败");
            }
        });

        //提交
        $("#sub").click(function () {
            if ($("#tName").val() == "") {
                $("#tName").addClass("red");
                $("#tNameP").css("display", "inline");
            } else if ($("#tBirthday").val() == "") {
                $("#tBirthday").addClass("red");
                $("#tBirthdayP").css("display", "inline");
            } else if ($("#tPhone").val() == "") {
                $("#tPhone").addClass("red");
                $("#tPhoneP1").css("display", "inline");
            } else if (!reg.test($("#tPhone").val())) {
                $("#tPhone").addClass("red");
                $("#tPhoneP2").css("display", "inline");
            } else {
                $.ajax({
                    url: 'editTeacher_admin',
                    type: 'post',
                    data: {
                        "tId": tId,
                        "tName": $("#tName").val(),
                        "tSex": $('input[name="tSex"]:checked').val(),
                        "tBirthday": $("#tBirthday").val(),
                        "tPhone": $("#tPhone").val(),
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "true") {
                            layer.msg("修改成功");
                            setTimeout('close()', 1000)
                        } else {
                            layer.msg("修改失败");
                            setTimeout('close()', 1000)
                        }
                    },
                    error: function () {
                        layer.msg("执行失败");
                    }
                })
            }
        });
    });

    //关闭当前弹框
    var close = function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
</script>
</body>
</html>
