<%--
  Created by IntelliJ IDEA.
  User: ANA
  Date: 2020/9/12
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师评价页面</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .layui-table-tool-self {
            display: none;
        }

        .layui-icon-ok {
            margin-top: 6px;
        }
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">金桥学员跟踪系统(教师)</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="#">
                    ${sessionScope.userame}
                </a>
            </li>
            <li class="layui-nav-item"><a href="ALogoutServlet">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="studentAppraise">学生评价</a></li>
                <li class="layui-nav-item"><a href="">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div align="center">
                <h1 style="margin: 30px 0px 20px 0px">学生列表</h1>
                <table id="demo" lay-filter="test"></table>
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
<script type="text/html" id="toolbarDemo">
    <div align="right">
        <div class="layui-input-inline">
            <label class="layui-form-label">班期</label>
            <div class="layui-input-block">
                <select name="sClass" id="sClass">

                </select>
            </div>
        </div>
        <div class="layui-input-inline">
            <input type="text" id="filter1" placeholder="请输入姓名" class="layui-input">
        </div>

        <div class="layui-input-inline">
            <button class="layui-btn layui-btn-sm" lay-event="query">查询</button>
        </div>
    </div>
</script>
<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn-sm" lay-event="appraise">评论</button>
    <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="edit">编辑</button>
    <button class="layui-btn layui-btn-sm" lay-event="see">查看</button>
</script>
<script>
    layui.use(['element','table','layer'], function(){
        var element = layui.element;
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.$;
        var tId = 1001;

        table.render({
            elem: '#demo'
            ,toolbar: '#toolbarDemo' //添加工具栏
            ,height: 550
            ,width: 1400
            ,url: '/getAllTeacher1' //数据接口
            ,page: true
            ,limit: 8
            ,limits:[8,15,20]
            ,cols: [[
                {type: 'checkbox'}
                ,{field: 'id', title: '工号', width:90, sort: true}
                ,{field: 'name', title: '姓名', width:90}
                ,{field: 'sex', title: '性别', width:70}
                ,{field: 'birthday', title: '出生年月', width:110}
                ,{field: 'degree', title: '学历', width:90}
                ,{field: 'title', title: '职称', width:90}
                ,{fixed: 'right', title:'操作', width:180, align:'center', toolbar: '#barDemo'}
            ]]
        });
        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            if(obj.event === 'query'){
            }
        });
        //操作栏
        table.on('tool(test)', function(obj){
            var data = obj.data;//获取当前行数据
            if(obj.event === 'appraise'){
                layer.open({

                });
            } else if(obj.event === 'edit'){

            }else if(obj.event === 'see'){

            }
        });
        //获取期数下拉列表
        $.ajax({
            type:'GET',
            url:'getAllSClassBytId_Teacher?tId='+ tId,
            dataType:'json',
            success:function(data){
                // 返回成功的数据
                for(var i=0; i<data.length; i++){
                    $('#sClass').append("<option value='"+data[i].classId+"'>"+data[i].className+"</option>");
                }
            }
        });
    });
</script>

</body>
</html>
