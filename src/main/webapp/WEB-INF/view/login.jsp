<%--
  Created by IntelliJ IDEA.
  User: ANA
  Date: 2020/9/16
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <head>
        <meta charset="UTF-8">
        <title>登录页面</title>
        <link href="../../static/layui/css/layui.css" rel="stylesheet">
        <script src="../../static/layui/layui.js"></script>
        <style>
            .layui-icon-ok{
            }
            /*body的相关设置*/
            .myBody{
                /*背景图片*/
                background-image: url("../../static/img/body.png");
            }
            /*登录div的设置*/
            .myLogin{
                width: 400px;
                /*绝对定位的方式*/
                position: absolute;
                /*定位登录div的位置*/
                left: 82%;
                top: 40%;
                transform: translate(-50%, -50%);
                /*内边距*/
                padding-top: 20px;
                padding-left: 10px;
                padding-right: 10px;
            }
            .rotation1{
                width: 550px;
                /*绝对定位的方式*/
                position: absolute;
                /*定位登录div的位置*/
                left: 20%;
                top: 50%;
                transform: translate(-50%, -50%);
            }
            /*输入框设置*/
            .myInput{
                width: 400px;
                padding-left: 32px;
            }
            /*图标设置*/
            .myIcon{
                font-size: 26px;
                color: #666666;
                position: absolute;
                left: 14px;
            }
            .forgetPwd :hover{
                color: black;
            }
            /*登录按钮*/
            .myButton{
                width: 400px;
            }
        </style>
    </head>
<body class="myBody">
<%
    String userId = "";
    String password = "";
    //获取当前web应用的所有cookie
    Cookie[] cookies = request.getCookies();
    if (cookies != null){
        //遍历cookies，取出用户名密码
        for (int i = 0;i < cookies.length;i++){
            //判断当前cookie是否为用户名和密码cookie
            if ("nameCookie".equals(cookies[i].getName())){
                userId = cookies[i].getValue();
            }else if("pwdCookie".equals(cookies[i].getName())){
                password = cookies[i].getValue();
            }
        }
    }
%>
<div class="layui-row">
    <div class="grid-demo grid-demo-bg1 rotation1" style="background-color:#fff;">
        <div class="layui-carousel" id="test10">
            <div carousel-item="">
                <div><img src="../../static/img/banner-qiao.jpg" height="550px" width="950px"></div>
                <div><img src="../../static/img/bannertext.jpg" height="550px" width="950px"></div>
                <div><img src="../../static/img/bannertxt.jpg" height="550px" width="950px"></div>
            </div>
        </div>

    </div>
    <div class="grid-demo grid-demo-bg1 myLogin" style="background-color:#fff;">
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="color: #717171">欢迎登录 - 金桥学员跟踪系统</legend>
        </fieldset>
        <div class="layui-form" id="formId" action="checkLogin" method="post">
            <!--            账号-->
            <div class="layui-form-item">
                <i class="layui-icon layui-icon-username myIcon" style="top: 80px;"></i>
                <input class="layui-input myInput"  type="text" id="userId" name="userId" value="<%=userId%>" required  lay-verify="required" placeholder="账号" autocomplete="off">
            </div>
            <!--            密码-->
            <div class="layui-form-item">
                <i class="layui-icon layui-icon-password myIcon" style="top: 133px;"></i>
                <input class="layui-input myInput" type="password" id="password" name="password" value="<%=password%>" required lay-verify="required" placeholder="密码" autocomplete="off">
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 0;">
                    <input type="checkbox" class="fl" id="rememberPwd" name="rememberPwd" checked value="y" title="记住密码">
                </div>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn myButton"  id="sub" lay-filter="formDemo">立即登录</button>
            </div>
        </div>

    </div>

</div>

<script>
    layui.use('form', function () {
        var form = layui.form;
        var $ = layui.jquery;

        $("#sub").click(function () {
            $.ajax({
                url:"checkLogin",
                type:"post",
                data : {
                    userId:$("#userId").val(),
                    password:$("#password").val(),
                    rememberPwd:$("#rememberPwd").val()
                },
                success:function (data) {
                    if(data == "studentAppraise"){
                        location.href = "studentAppraise"
                    }else if(data == "adminTeacherList"){
                        location.href = "adminTeacherList"
                    }else if(data == "empManage"){
                        location.href = "empManage";
                    }else {
                        layer.msg(data)
                    }
                },
                error:function (data) {
                    layer.msg("执行失败");
                }
            });
        })
    });

</script>
<script>
    layui.use(['carousel', 'form'], function(){
        var carousel = layui.carousel
            ,form = layui.form;
        //图片轮播
        carousel.render({
            elem: '#test10'
            ,width: '950px'
            ,height: '550px'
            ,interval: 3000
        });
    });
</script>
</body>
</html>
