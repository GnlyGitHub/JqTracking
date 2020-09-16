<%--
  Created by IntelliJ IDEA.
  User: 43151
  Date: 2020/9/15
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工信息展示</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
    <style>
        .t1{
            width: 80px;
            height: 40px;
        }
        .t2{
            height: 30px;
            text-align: center;
        }
        .t3{
            height: 150px;
        }

    </style>
</head>
<body>
<div align="center">
<table border="1" style="text-align: center">
    <caption><h2>金桥学员成长跟踪表</h2></caption>
    <tr>
        <td class="t1">姓名</td>
        <td colspan="2">${param.}</td>
        <td>性别</td>
        <td></td>
        <td>民族</td>
        <td>han</td>
        <td rowspan="4">照片</td>
    </tr>
    <tr>
        <td class="t1">出生年月</td>
        <td colspan="2"></td>
        <td>籍贯</td>
        <td></td>
        <td>婚否</td>
        <td>han</td>

    </tr>
    <tr>
        <td class="t1">联系电话</td>
        <td colspan="3"></td>
        <td>身份证号码</td>
        <td colspan="2"></td>
    </tr>
    <tr>
        <td class="t1">毕业学校</td>
        <td colspan="3"></td>
        <td>专业</td>
        <td colspan="2"></td>
    </tr>
    <tr>
        <td class="t1">备注</td>
        <td colspan="7"></td>
    </tr>
    <tr>
        <td colspan="8" class="t2">培训学校评价</td>
    </tr>
    <tr>
        <td rowspan="2" class="t1">培训学校</td>
        <td rowspan="2">班期</td>
        <td rowspan="2">评价人</td>
        <td colspan="4">培训期间测试成绩</td>
        <td rowspan="2">整体评价分数</td>
    </tr>
    <tr>
        <td colspan="4" rowspan="2"></td>
    </tr>
    <tr>
        <td class="t1">学习评价</td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr class="t3">
        <td class="t1 " >评价（包括主要优点及其缺陷）</td>
        <td colspan="7"></td>
    </tr>
    <div>
        <tr>
            <td colspan="8" class="t2">转正工作评价</td>
        </tr>
        <tr>
            <td rowspan="2" class="t1">项目</td>
            <td rowspan="2">员工部门</td>
            <td rowspan="2">员工职务</td>
            <td rowspan="2">评价人</td>
            <td colspan="3">评价分项</td>
            <td rowspan="2">整体评价分数</td>
        </tr>
        <tr>
            <td colspan="3" rowspan="2"></td>
        </tr>
        <tr>
            <td class="t1">工作评价</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="t3">
            <td class="t1 ">评价（包括主要优点及其缺陷）</td>
            <td colspan="7"></td>
        </tr>
    </div>
    <div>
        <tr>
            <td colspan="8"class="t2">工作1年工作评价</td>
        </tr>
        <tr>
            <td rowspan="2"class="t1">项目</td>
            <td rowspan="2">员工部门</td>
            <td rowspan="2">员工职务</td>
            <td rowspan="2">评价人</td>
            <td colspan="3">评价分项</td>
            <td rowspan="2">整体评价分数</td>
        </tr>
        <tr>
            <td colspan="3" rowspan="2"></td>
        </tr>
        <tr>
            <td class="t1">工作评价</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="t3">
            <td class="t1 ">评价（包括主要优点及其缺陷）</td>
            <td colspan="7"></td>
        </tr>
    </div>
    <div>
        <tr>
            <td colspan="8"class="t2">工作2年工作评价</td>
        </tr>
        <tr>
            <td rowspan="2" class="t1">项目</td>
            <td rowspan="2">员工部门</td>
            <td rowspan="2">员工职务</td>
            <td rowspan="2">评价人</td>
            <td colspan="3">评价分项</td>
            <td rowspan="2">整体评价分数</td>
        </tr>
        <tr>
            <td colspan="3" rowspan="2"></td>
        </tr>
        <tr>
            <td class="t1">工作评价</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="t3">
            <td class="t1 ">评价（包括主要优点及其缺陷）</td>
            <td colspan="7"></td>
        </tr>
    </div>
    <div>
        <tr>
            <td colspan="8"class="t2">工作3年工作评价</td>
        </tr>
        <tr>
            <td rowspan="2"class="t1">项目</td>
            <td rowspan="2">员工部门</td>
            <td rowspan="2">员工职务</td>
            <td rowspan="2">评价人</td>
            <td colspan="3">评价分项</td>
            <td rowspan="2">整体评价分数</td>
        </tr>
        <tr>
            <td colspan="3" rowspan="2"></td>
        </tr>
        <tr>
            <td class="t1">工作评价</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td class="t1 t3">评价（包括主要优点及其缺陷）</td>
            <td colspan="7"></td>
        </tr>
    </div>
</table>
</div>
</body>
</html>
