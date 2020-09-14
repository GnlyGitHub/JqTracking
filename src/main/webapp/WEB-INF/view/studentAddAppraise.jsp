<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ANA
  Date: 2020/9/14
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评论</title>
    <link href="../../static/layui/css/layui.css" rel="stylesheet">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div style="display: flex;justify-content: center">
<div class="layui-form" action="">
    <c:forEach var="i" items="${list}">
        <c:choose>
            <c:when test="${i.subject eq '评价'}">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">${i.subject}</label>
                    <div class="layui-input-block">
                        <textarea name="${i.subjectId}" placeholder="请输入评价内容" class="layui-textarea"></textarea>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="layui-form-item">
                    <label class="layui-form-label">${i.subject}</label>
                    <div class="layui-input-block">
                        <input type="text" name="${i.subjectId}" required lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</div>>
</div>

<script>
    function ObjData(key,value){
        this.Key=key;
        this.Value=value;
    }
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        var $ = layui.jquery;


        //监听提交
        $("#formDemo").click(function(){
            //layer.msg(JSON.stringify(data.field));
            var list = $("input");
            var array = [];

            for(var i=0; i<list.length && list[i]; i++){
                //判断不是空的 input,进行表单提交
                if(list[i].value != "" || list[i].value != null)
                {
                    var key = list[i].name;
                    var value = list[i].value;
                    var s = new ObjData(key,value); //创建键值对象
                    array.push(s); //把对象放入对象数组中
                }
            }

            var postData = JSON.stringify(array);
            $.ajax({
                url:"addAppraise_Teacher",
                type:"post",
                datatype : "json",
                data : {
                    postData:postData
                },
                success:function (data) {
                    alert(data)
                },
                error:function (data) {
                    alert("执行失败")
                }
            });
        });
    });
</script>
</body>
</html>
