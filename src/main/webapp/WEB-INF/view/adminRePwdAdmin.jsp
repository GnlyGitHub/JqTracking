<%--
  Created by IntelliJ IDEA.
  User: liangyurj
  Date: 2020/9/17
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员修改登录密码</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .red{
            border-color: red;
        }
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">金桥学员跟踪系统</div>
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="#">
                    ${sessionScope.loginUser.userId}
                </a>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域 -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="adminTeacherList">教师管理</a></li>
                <li class="layui-nav-item"><a href="adminManagerList">项目经理管理</a></li>
                <li class="layui-nav-item"><a href="adminStudentList">学生管理</a></li>
                <li class="layui-nav-item"><a href="adminSubjectList">课程管理</a></li>
                <li class="layui-nav-item"><a href="adminClassList">班期管理</a></li>
                <li class="layui-nav-item"><a href="adminAppraiseList">评分项管理</a></li>
                <li class="layui-nav-item layui-this"><a href="adminRePwdAdmin">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 150px 0 0 250px">
            <div class="layui-form" style="width: 550px;">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 150px">请输入原密码：</label>
                    <div class="layui-input-inline">
                        <input id="oldPwd" type="password" name="oldPwd" required  lay-verify="required" placeholder="请输入原密码" autocomplete="off" class="layui-input">
                    </div>
                    <p id="oldPwdP" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入原密码</p>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 150px">请输入新密码：</label>
                    <div class="layui-input-inline">
                        <input id="newPwd" type="password" name="newPwd" required  lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                    </div>
                    <p id="newPwdP1" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入新密码</p>
                    <p id="newPwdP2" style="color: red; display: none; font-size: 14px">密码由字母、数字组成，长度为6~18位</p>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 150px">请再次输入新密码：</label>
                    <div class="layui-input-inline">
                        <input id="repPwd" type="password" name="repPwd" required  lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                    </div>
                    <p id="repPwdP1" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">请输入新密码</p>
                    <p id="repPwdP2" style="color: red; display: none; font-size: 14px">密码由字母、数字组成，长度为6~18位</p>
                    <p id="repPwdP3" style="color: red; display: none; position: relative;top: 9px;font-size: 14px">两次密码不一致</p>
                </div>

                <div class="layui-form-item" style="display: flex; justify-content: center">
                    <div class="layui-input-inline">
                        <button id="sub" class="layui-btn" lay-filter="formDemo">提交</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © jxdinfo.com - 底部固定区域
    </div>
</div>
<script>
    layui.use(['element','layer'], function(){
        var element = layui.element;
        var layer = layui.layer;
        var $ = layui.$;

        $("#oldPwd").blur(function () {
            if ($("#oldPwd").val() == ""){
                $("#oldPwd").addClass("red");
                $("#oldPwdP").css("display","inline");
            }
        }).focus(function () {
            $("#oldPwd").removeClass("red");
            $("#oldPwdP").css("display","none");
        });

        var reg = /^[a-zA-Z0-9]{6,18}$/;
        $("#newPwd").blur(function () {
            if ($("#newPwd").val() == ""){
                $("#newPwd").addClass("red");
                $("#newPwdP1").css("display","inline");
            } else if (!reg.test($("#newPwd").val())){
                $("#newPwd").addClass("red");
                $("#newPwdP2").css("display","inline");
            } else if (($("#repPwd").val() != "") && ($("#newPwd").val() != $("#repPwd").val())) {
                $("#newPwd").addClass("red");
                $("#repPwdP2").css("display","none");
                $("#repPwdP3").css("display","inline");
            } else {
                $("#repPwd").removeClass("red");
                $("#repPwdP3").css("display","none");
            }
        }).focus(function () {
            $("#newPwd").removeClass("red");
            $("#newPwdP1").css("display","none");
            $("#newPwdP2").css("display","none");
        });

        $("#repPwd").blur(function () {
           if ($("#repPwd").val() == ""){
               $("#repPwd").addClass("red");
               $("#repPwdP1").css("display","inline");
           } else if (!reg.test($("#repPwd").val())){
               $("#repPwd").addClass("red");
               $("#repPwdP2").css("display","inline");
           } else if (($("#newPwd").val() != "") &&  ($("#newPwd").val() != $("#repPwd").val())) {
               $("#repPwd").addClass("red");
               $("#repPwdP3").css("display","inline");
           } else {
               $("#newPwd").removeClass("red");
           }
        }).focus(function () {
            $("#repPwd").removeClass("red");
            $("#repPwdP1").css("display","none");
            $("#repPwdP2").css("display","none");
            $("#repPwdP3").css("display","none");
        });

        $("#sub").click(function () {
            $.ajax({
                url:'rePwdAdmin_admin',
                type:'post',
                data:{
                    oldPwd: $("#oldPwd").val(),
                    newPwd: $("#newPwd").val(),
                    repPwd: $("#repPwd").val(),
                },
                dataType:'text',
                success:function (data) {
                    if (data == "1"){
                        layer.msg("修改成功，请重新登录", {icon:1});
                        setTimeout('toLogin()',1000);
                    } else if (data == "2"){
                        layer.msg("原密码输入错误，请重试", {icon:5});
                    } else {
                        layer.msg("修改失败，请重试", {icon:5});
                    }
                },
                error:function () {
                    layer.msg("执行失败");
                }
            })
        })
    });
    var toLogin = function () {
        location.href = "quit";
    }
</script>
</body>
</html>
