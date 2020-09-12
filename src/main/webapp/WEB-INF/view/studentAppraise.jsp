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
</head>
<link href="../../static/layui/css/layui.css" rel="stylesheet">
<script src="../../static/layui/layui.js"></script>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">金桥工程学员跟踪系统(教师)</div>
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
                <li class="layui-nav-item"><a href="adminCourse">学生评价</a></li>
                <li class="layui-nav-item"><a href="">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 0px;">


        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © jxdinfo.com - 底部固定区域
    </div>

</div>
<script>
    layui.use(['element','table','layer'], function(){
        var element = layui.element;
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.$;

        table.render({
            elem: '#demo'
            ,toolbar: '#toolbarDemo' //添加工具栏
            ,height: 450
            ,width: 1080
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
        table.on('toolbar(test)', function(obj){
            switch(obj.event){
                case 'query':
                    var filter = $("#filter").val();//获取过滤条件
                    //重新加载表格
                    table.reload("demo",{
                        where:{name:filter},
                        page:{
                            curr:1
                        }
                    });
                    break;
                case 'add':
                    break;
            }
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;//获取当前行数据
            if(obj.event === 'update'){
                layer.open({

                });
            } else if(obj.event === 'delete'){

            }
        });
    });
</script>

</body>
</html>
