<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .t1 {
            width: 80px;
            height: 40px;
        }

        .t2 {
            height: 30px;
            text-align: center;
        }

        .t3 {
            height: 150px;
        }

        .tr1 {

        }

        .tr2 {

        }

        .tr3 {

        }

        .tr4 {

        }

        .tr5 {

        }
    </style>
</head>
<body>
<div align="center">
    <table class="layui-table" border="1" style="text-align: center;width: 810px">
        <caption><h2>金桥学员成长跟踪表</h2></caption>
        <tr>
            <td class="t1">姓名</td>
            <td colspan="2">${stu.get("sName")}</td>
            <td>性别</td>
            <td>
                <c:if test="${stu.get('sSex')==1}">
                    男
                </c:if>
                <c:if test="${stu.get('sSex')==2}">
                    女
                </c:if>
            </td>
            <td>民族</td>
            <td>${stu.get("sNation")}</td>
            <td rowspan="4" style="padding: 5px 5px 5px 5px"><img src="${stu.get("sPhoto")}"
                                                                  style="width: 130px ;height: 155px"></td>
        </tr>
        <tr>
            <td class="t1">出生年月</td>
            <td colspan="2">${stu.sBirthday}</td>
            <td>籍贯</td>
            <td>${stu.sPlace}</td>
            <td>婚否</td>
            <td>
                <c:if test="${stu.sMarry==0}">
                    未婚
                </c:if>
                <c:if test="${stu.sMarry==1}">
                    已婚
                </c:if>
            </td>
        </tr>
        <tr>
            <td class="t1">联系电话</td>
            <td colspan="3">${stu.sPhone}</td>
            <td>身份证号码</td>
            <td colspan="2">${stu.sIdCard}</td>
        </tr>
        <tr>
            <td class="t1">毕业学校</td>
            <td colspan="3">${stu.sSchool}</td>
            <td>专业</td>
            <td colspan="2">${stu.sMajor}</td>
        </tr>
        <tr>
            <td class="t1">备注</td>
            <td colspan="7">${stu.sRemarks}</td>
        </tr>
        <div id="d1">
            <tr class="tr1">
                <td colspan="8" class="t2">培训学校评价</td>
            </tr>
            <tr class="tr1">
                <td rowspan="2" class="t1">培训学校</td>
                <td rowspan="2">班期</td>
                <td rowspan="2">评价人</td>
                <td colspan="4" style="height: 20px">培训期间测试成绩</td>
                <td rowspan="2">整体评价分数</td>
            </tr>
            <tr class="tr1">
                <td colspan="4" rowspan="2" style="padding: 0">
                    <table class="layui-table" frame="void" id="scro11" style="text-align: center;margin: 0">
                        <tr></tr>
                        <tr></tr>
                    </table>
                </td>
            </tr>
            <tr class="tr1">
                <td class="t1">学习评价</td>
                <td>${className}</td>
                <td>${score[0].appraiser}</td>
                <td id="scro12"></td>
            </tr>
            <tr class="t3 tr1">
                <td class="t1">评价（包括主要优点及其缺陷）</td>
                <td colspan="7" id="scro13"></td>
            </tr>
        </div>
        <div>
            <tr class="tr2">
                <td colspan="8" class="t2">转正工作评价</td>
            </tr>
            <tr class="tr2">
                <td rowspan="2" class="t1">项目</td>
                <td rowspan="2">员工部门</td>
                <td rowspan="2">员工职务</td>
                <td rowspan="2">评价人</td>
                <td colspan="3">评价分项</td>
                <td rowspan="2">整体评价分数</td>
            </tr>
            <tr class="tr2">
                <td colspan="3" rowspan="2" style="padding: 0;">
                    <table class="layui-table" frame="void" id="scro21" style="text-align: center;margin: 0">
                        <tr></tr>
                        <tr></tr>
                    </table>
                </td>
            </tr>
            <tr class="tr2">
                <td class="t1">工作评价</td>
                <td>${stu.get("deptName")}</td>
                <td>${stu.get("jobName")}</td>
                <td>${grade0.get(0).appraiser}</td>
                <td id="scro22"></td>
            </tr>
            <tr class="t3 tr2">
                <td class="t1 ">评价（包括主要优点及其缺陷）</td>
                <td colspan="7" id="scro23"></td>
            </tr>
        </div>
        <div>
            <tr class="tr3">
                <td colspan="8" class="t2">工作1年工作评价</td>
            </tr>
            <tr class="tr3">
                <td rowspan="2" class="t1">项目</td>
                <td rowspan="2">员工部门</td>
                <td rowspan="2">员工职务</td>
                <td rowspan="2">评价人</td>
                <td colspan="3">评价分项</td>
                <td rowspan="2">整体评价分数</td>
            </tr>
            <tr class="tr3">
                <td colspan="3" rowspan="2" style="padding: 0;">
                    <table class="layui-table" frame="void" id="scro31" style="text-align: center;margin: 0">
                        <tr></tr>
                        <tr></tr>
                    </table>
                </td>
            </tr>
            <tr class="tr3">
                <td class="t1">工作评价</td>
                <td>${stu.get("deptName")}</td>
                <td>${stu.get("jobName")}</td>
                <td>${grade1.get(0).appraiser}</td>
                <td id="scro32"></td>
            </tr>
            <tr class="t3 tr3">
                <td class="t1 ">评价（包括主要优点及其缺陷）</td>
                <td colspan="7" id="scro33"></td>
            </tr>
        </div>
        <div>
            <tr class="tr4">
                <td colspan="8" class="t2">工作2年工作评价</td>
            </tr>
            <tr class="tr4">
                <td rowspan="2" class="t1">项目</td>
                <td rowspan="2">员工部门</td>
                <td rowspan="2">员工职务</td>
                <td rowspan="2">评价人</td>
                <td colspan="3">评价分项</td>
                <td rowspan="2">整体评价分数</td>
            </tr>
            <tr class="tr4">
                <td colspan="3" rowspan="2" style="padding: 0;">
                    <table class="layui-table" frame="void" id="scro41" style="text-align: center;margin: 0">
                        <tr></tr>
                        <tr></tr>
                    </table>
                </td>
            </tr>
            <tr class="tr4">
                <td class="t1">工作评价</td>
                <td>${stu.get("deptName")}</td>
                <td>${stu.get("jobName")}</td>
                <td>${grade2.get(0).appraiser}</td>
                <td id="scro42"></td>
            </tr>
            <tr class="t3 tr4">
                <td class="t1 ">评价（包括主要优点及其缺陷）</td>
                <td colspan="7" id="scro43"></td>
            </tr>
        </div>
        <div>
            <tr class="tr5">
                <td colspan="8" class="t2">工作3年工作评价</td>
            </tr>
            <tr class="tr5">
                <td rowspan="2" class="t1">项目</td>
                <td rowspan="2">员工部门</td>
                <td rowspan="2">员工职务</td>
                <td rowspan="2">评价人</td>
                <td colspan="3">评价分项</td>
                <td rowspan="2">整体评价分数</td>
            </tr>
            <tr class="tr5">
                <td colspan="3" rowspan="2" style="padding: 0;">
                    <table class="layui-table" frame="void" id="scro51" style="text-align: center;margin: 0">
                        <tr></tr>
                        <tr></tr>
                    </table>
                </td>
            </tr>
            <tr class="tr5">
                <td class="t1">工作评价</td>
                <td>${stu.get("deptName")}</td>
                <td>${stu.get("jobName")}</td>
                <td>${grade3.get(0).appraiser}</td>
                <td id="scro52"></td>
            </tr>
            <tr class="t3 tr5">
                <td class="t1 ">评价（包括主要优点及其缺陷）</td>
                <td colspan="7" id="scro53"></td>
            </tr>
        </div>
    </table>
</div>
<script>
    layui.use(['form', 'layer'], function () {
        var element = layui.element;
        var layer = layui.layer;
        var table = layui.table;
        var $ = layui.$
        <c:forEach var="sco" items="${score}" >
        <c:if test="${sco.subjectId !=11 and sco.subjectId!=12}">
        var i = "${sco.subject}"
        $("#scro11 tr:eq(0)").append("<td>" + i + "</td>")
        var j = ${sco.score}
            $("#scro11 tr:eq(1)").append("<td>" + j + "</td>")
        </c:if>
        <c:if test="${sco.subjectId==11}">
        $("#scro12").text(${sco.score})
        </c:if>
        <c:if test="${sco.subjectId==12}">
        $("#scro13").html("${sco.score}")
        </c:if>
        </c:forEach>
        <c:forEach var="sco" items="${grade0}" >
        <c:if test="${sco.appraise.appraiseId !=9 and sco.appraise.appraiseId!=10}">
        var i = "${sco.appraise.appraise}"
        $("#scro21 tr:eq(0)").append("<td>" + i + "</td>")
        var j = "${sco.grade}"
        $("#scro21 tr:eq(1)").append("<td>" + j + "</td>")
        </c:if>
        <c:if test="${sco.appraise.appraiseId==9}">
        $("#scro22").text(${sco.grade})
        </c:if>
        <c:if test="${sco.appraise.appraiseId==10}">
        $("#scro23").html("${sco.grade}")
        </c:if>
        </c:forEach>
        <c:forEach var="sco" items="${grade1}" >
        <c:if test="${sco.appraise.appraiseId !=9 and sco.appraise.appraiseId!=10}">
        var i = "${sco.appraise.appraise}"
        $("#scro31 tr:eq(0)").append("<td>" + i + "</td>")
        var j = "${sco.grade}"
        $("#scro31 tr:eq(1)").append("<td>" + j + "</td>")
        </c:if>
        <c:if test="${sco.appraise.appraiseId==9}">
        $("#scro32").text(${sco.grade})
        </c:if>
        <c:if test="${sco.appraise.appraiseId==10}">
        $("#scro33").html("${sco.grade}")
        </c:if>
        </c:forEach>
        <c:forEach var="sco" items="${grade2}" >
        <c:if test="${sco.appraise.appraiseId !=9 and sco.appraise.appraiseId!=10}">
        var i = "${sco.appraise.appraise}"
        $("#scro41 tr:eq(0)").append("<td>" + i + "</td>")
        var j = "${sco.grade}"
        $("#scro41 tr:eq(1)").append("<td>" + j + "</td>")
        </c:if>
        <c:if test="${sco.appraise.appraiseId==9}">
        $("#scro42").text(${sco.grade})
        </c:if>
        <c:if test="${sco.appraise.appraiseId==10}">
        $("#scro43").html(${sco.grade})
        </c:if>
        </c:forEach>
        <c:forEach var="sco" items="${grade3}" >
        <c:if test="${sco.appraise.appraiseId !=9 and sco.appraise.appraiseId!=10}">
        var i = "${sco.appraise.appraise}"
        $("#scro51 tr:eq(0)").append("<td>" + i + "</td>")
        var j = "${sco.grade}"
        $("#scro51 tr:eq(1)").append("<td>" + j + "</td>")
        </c:if>
        <c:if test="${sco.appraise.appraiseId==9}">
        $("#scro52").text(${sco.grade})
        </c:if>
        <c:if test="${sco.appraise.appraiseId==10}">
        $("#scro53").html("${sco.grade}")
        </c:if>
        </c:forEach>
        <c:if test="${empty score.get(0).sId}">
        $(".tr1").css("display", "none")
        </c:if>
        <c:if test="${empty grade0.get(0).number}">
        $(".tr2").css("display", "none")
        </c:if>
        <c:if test="${empty grade1.get(0).number}">
        $(".tr3").css("display", "none")
        </c:if>
        <c:if test="${empty grade2.get(0).number}">
        $(".tr4").css("display", "none")
        </c:if>
        <c:if test="${empty grade3.get(0).number}">
        $(".tr5").css("display", "none")
        </c:if>
    })
</script>
</body>
</html>
