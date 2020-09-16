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
                left: 50%;
                top: 40%;
                transform: translate(-50%, -50%);
                /*内边距*/
                padding-top: 20px;
                padding-left: 10px;
                padding-right: 10px;
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

            /*登录按钮*/
            .myButton{
                width: 400px;
            }
            #loginMsg{
                height: 10px;
                color: red;
            }
        </style>
    </head>
<body class="myBody">
<div class="layui-row">
    <div class="grid-demo grid-demo-bg1 myLogin" style="background-color:#fff;">
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="color: #717171">欢迎登录 - 金桥学员跟踪系统</legend>
        </fieldset>
        <form class="layui-form" action="checkLogin" method="post">
            <!--            账号-->
            <div class="layui-form-item">
                <i class="layui-icon layui-icon-username myIcon" style="top: 80px;"></i>
                <input class="layui-input myInput"  type="text" name="userId" required  lay-verify="required" placeholder="账号" autocomplete="off">
            </div>
            <!--            密码-->
            <div class="layui-form-item">
                <i class="layui-icon layui-icon-password myIcon" style="top: 133px;"></i>
                <input class="layui-input myInput" type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off">
            </div>
            <div class="layui-form-item" id="loginMsg">
                ${loginMsg}
            </div>
            <div class="layui-form-item">
                <button class="layui-btn myButton" lay-submit lay-filter="formDemo">立即登录</button>
            </div>
        </form>
    </div>
</div>
</body>

<%--<body>
&lt;%&ndash;<div class="myLogin" &lt;%&ndash;style="display: flex;justify-content: center"&ndash;%&gt;>
    <form class="layui-form" action="checkLogin" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名：</label>
            <div class="layui-input-inline">
                <input type="text" name="userId" required  lay-verify="required" placeholder="请输入用户名" autocomplete="on" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password"  required  lay-verify="required" placeholder="请输入密码" autocomplete="on" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
            </div>
        </div>
    </form>
    <div>${loginMsg}</div>
</div>&ndash;%&gt;
</body>--%>
</html>
