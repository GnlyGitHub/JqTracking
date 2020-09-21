<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/12
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>经理修改密码</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-input {
            width: 200px;
        }

        img {
            height: 15px;
        }

        .red {
            border: 1px solid #FF8765;
            background-color: #FFF2E5;
            outline: none;
        }

        .green {
            border: 1px solid #66ffb7;
            background-color: #E6FEE4;
            outline: none;
        }

        .yellow {
            border: 1px solid #FFD62E;
            background-color: #FFFFDA;
            outline: none;
        }
    </style>
</head>
<body>
<div style="padding: 150px 0 0 350px">
    <table border="1" align="center">
        <div class="layui-form-item">
            <label class="layui-form-label">原密码：</label>
            <div class="layui-input-inline">
                <input type="password" id="oldPwd" class="layui-input">
            </div>
            <div id="oldDiv" class="layui-input-inline" style="width: 350px"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码：</label>
            <div class="layui-input-inline">
                <input type="password" id="pwd" class="layui-input">
            </div>
            <div id="pwdDiv" class="layui-input-inline" style="width: 350px"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认新密码：</label>
            <div class="layui-input-inline">
                <input type="password" id="rePwd" class="layui-input">
            </div>
            <div id="rePwdDiv" class="layui-input-inline" style="width: 350px"></div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="editPwd" lay-filter="formDemo">提交</button>
            </div>
        </div>
    </table>
</div>
<script>
    layui.use(['table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.jquery;//内置jQuery
        // 定义开关变量
        var flagOld = false;
        var flagPwd = false;
        var flagRepwd = false;
        var nowPws = ${sessionScope.loginUser.password}
            $("#editPwd").click(function () {
                var pwd = $("#pwd").val()
                var rePwd = $("#rePwd").val()
                var oldPwd = $("#oldPwd").val()
                if (oldPwd == null || oldPwd == "") {
                    $("#oldDiv").html("<p><img src='../../static/img/warning.PNG' >原密码为空</p>");
                    $("#oldDiv p").addClass("red");
                    flagOld = false
                } else {
                    flagOld = true
                }
                if (pwd == null || pwd == "") {
                    $("#pwdDiv").html("<p><img src='../../static/img/warning.PNG' >新密码为空</p>");
                    $("#pwdDiv p").addClass("red");
                }
                if (rePwd == null || rePwd == "") {
                    $("#rePwdDiv").html("<p><img src='../../static/img/warning.PNG' >没有确定密码</p>");
                    $("#rePwdDiv p").addClass("red");
                }
                if (oldPwd == nowPws) {
                    if (flagOld && flagPwd && flagRepwd) {
                        if (rePwd == pwd) {
                            $("#oldDiv").html("<p><img src='../../static/img/right.PNG' >两次输入密码一致</p>");
                            $("#oldDiv p").addClass("green");
                            $.ajax({
                                url: 'editPasswordData_Manage',
                                type: 'post',
                                data: {
                                    userId:${sessionScope.loginUser.userId},
                                    password: pwd
                                },
                                success: function (data) {
                                    if (data == true) {
                                        layer.msg("修改成功",{icon:6,time:1500},function () {
                                            location.href="quit"
                                            parent.location.reload();
                                        })
                                    } else {
                                        layer.msg("修改失败")
                                    }
                                },
                                error: function () {
                                    layer.msg("修改操作失败")
                                }
                            })
                        } else {
                            layer.msg("两次密码输入不一致")
                        }
                    }
                }else {
                    $("#oldDiv").html("<p><img src='../../static/img/warning.PNG' >输入与原密码不一致</p>");
                    $("#oldDiv p").addClass("red");
                    flagOld = false
                }
            })
        $("#oldPwd").blur(function () {
            $("#oldDiv").html("")
            var oldPwd = $("#oldPwd").val()
            if (oldPwd == "" || oldPwd == null) {
                $("#oldDiv").html("<p><img src='../../static/img/warning.PNG' >请输入原密码</p>");
                $("#oldDiv p").addClass("red");
                flagOld = false
            }
        })
        $("#oldPwd").focus(function () {
            $("#oldDiv").html("");
            if ($(this).val().length == 0) {
                $("#oldDiv").html("<span>请输入原密码</span>");
                $("#oldDiv span").addClass("yellow");
            }
        });
        $("#pwd").blur(function () {
            var reg = /^[a-zA-Z0-9_][a-zA-Z0-9.-_]{5,17}$/;
            $("#pwdDiv").html("");
            if (reg.test($(this).val())) {
                $("#pwdDiv").html("<span><img src='../../static/img/right.PNG' >新密码格式正确</span>");
                $("#pwdDiv span").addClass("green");
                flagPwd = true;
            } else {
                $("#pwdDiv").html("<p><img src='../../static/img/warning.PNG' >1、由字母、数字、下划线、点、减号组成<br>" +
                    "&nbsp;&nbsp;&nbsp;2、只能以数字、字母或下划线开头，且长度为6-18</p>");
                $("#pwdDiv p").addClass("red");
                flagPwd = false;
            }
        })
        $("#pwd").focus(function () {
            $("#pwdDiv").html("");
            if ($(this).val().length == 0) {
                $("#pwdDiv").html("<span>请输入新密码</span>");
                $("#pwdDiv span").addClass("yellow");
            }
        });

        $("#rePwd").focus(function () {
            $("#rePwdDiv").html("");
            if ($(this).val().length == 0) {
                $("#rePwdDiv").html("<span>请确认新密码</span>");
                $("#rePwdDiv span").addClass("yellow");

            }
        });
        $("#rePwd").blur(function () {
            $("#rePwdDiv").html("");
            if ($("#pwd").val().length == 0) {
                $("#rePwdDiv").html("<span>新密码为空，请先输入新密码</span>");
                $("#rePwdDiv span").addClass("yellow");
                flagRepwd = false;
            } else if ($("#pwd").val() == $(this).val()) {
                $("#rePwdDiv").html("<span><img src='../../static/img/right.PNG' >两次密码输入一致</span>");
                $("#rePwdDiv span").addClass("green");
                flagRepwd = true;
            } else {
                $("#rePwdDiv").html("<span><img src='../../static/img/warning.PNG' >两次密码输入不一致</span>");
                $("#rePwdDiv span").addClass("red");
                flagRepwd = false;
            }
        });
    })
</script>
</body>
</html>
