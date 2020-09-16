<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    1001
                    <%--${sessionScope.userame}--%>
                </a>
            </li>
            <li class="layui-nav-item"><a href="ALogoutServlet">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-this"><a href="studentAppraise">学生评价</a></li>
                <li class="layui-nav-item"><a href="">修改密码</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div align="center">
                <h1 style="margin: 30px 0px 20px 0px">学生列表</h1>
                <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">班期:</label>
                    <div class="layui-input-inline">
                        <select name="sClass" id="sClass">
                            <c:forEach var="c" items="${sClasses}">
                                <option value="${c.classId}"><c:out value="${c.className}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                </form>
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
            <input type="text" id="sName" placeholder="请输入姓名" class="layui-input">
        </div>

        <div class="layui-input-inline">
            <button class="layui-btn layui-btn-sm" lay-event="query">查询</button>
        </div>
    </div>
</script>
<script type="text/html" id="barDemo">
    {{# if (d.sHireDate !=="" && d.sHireDate !== null ){}}
    <button name="app" class="layui-btn layui-btn-xs layui-btn-disabled" lay-event="dis">评价</button>
    <button class="layui-btn layui-btn-xs layui-btn-disabled" lay-event="dis">编辑</button>
    {{#  } else { }}
    <button name="app" class="layui-btn layui-btn-xs" lay-event="appraise">评价</button>
    <button class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit">编辑</button>
    {{#}}}
    <button class="layui-btn layui-btn-xs layui-btn-warm" lay-event="see">查看</button>
</script>
<script>
    layui.use(['element', 'table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var $ = layui.$;
        var form = layui.form;
        var sClass = $("#sClass").val();

        table.render({
            elem: '#demo'
            , toolbar: '#toolbarDemo' //添加工具栏
            , height: 500
            , width: 1400
            , url: '/getAllStudent_Teacher' //数据接口
            , page: false
            , limit: 5
            , limits: [5, 15, 20]
            , cols: [[
                 {type: 'numbers', title: '序号', width: 150}
                , {field: 'sId', title: '学号', width: 200, sort: true}
                , {field: 'sName', title: '姓名', width: 150}
                , {field: 'sSex', title: '性别', width: 100, templet: function(d){if(d.sSex == 1){return '男'}else{return '女'}}}
                , {field: 'sSchool', title: '学校', width: 200}
                , {field: 'sMajor', title: '专业', width: 250}
                , {field: 'sClass', title: '班期id', width: 250, hide:true}
                , {field: 'sHireDate', title: '入职日期', width: 250, hide:true}
                , {fixed: 'right', title: '操作', width: 250, align: 'center', toolbar: '#barDemo'}
            ]]
        });
        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            if (obj.event === 'query') {
                var sName = $("#sName").val();
                table.reload("demo", {//demo对应的是table的id
                    where: {
                         sName: sName
                    },//where对应的是过滤条件
                    page: {
                        curr: 1
                    }
                });
            }
        });
        //操作栏
        table.on('tool(test)', function (obj) {
            var data = obj.data;//获取当前行数据
            var classId = data.sClass;
            var sId = data.sId;
            //评论
            if (obj.event === 'appraise') {
                layer.open({
                    type: 2,//弹出完整jsp，type=1：弹出隐藏div
                    title: '添加评价',
                    content: 'studentAddAppraise?classId=' + classId + '&sId=' + sId,
                    shadeClose: true, //点击遮罩，关闭弹窗
                    area: ['500px', '700px']
                });
                //location.href='studentAddAppraise?classId=' + classId + '&sId=' + sId
            } else if (obj.event === 'edit') {
                layer.open({
                    type: 2,//弹出完整jsp，type=1：弹出隐藏div
                    title: '编辑评价',
                    content: 'getAllScoreBySId_Teacher?sId=' + sId,
                    shadeClose: true, //点击遮罩，关闭弹窗
                    area: ['500px', '700px']
                });
            } else if (obj.event === 'see') {

            }else {
                layer.msg("该员工已入职")
            }
        });

        //下拉框改变事件
        form.on("select", function(){
            table.reload("demo", {//demo对应的是table的id
                where: {
                    sClass: $("#sClass").val()
                },//where对应的是过滤条件
                page: {
                    curr: 1
                }
            });
        });

        table.reload("demo", {//demo对应的是table的id
            where: {
                sClass: $("#sClass").val()
            },//where对应的是过滤条件
            page: {
                curr: 1
            }
        });
    });
</script>
</body>
</html>
