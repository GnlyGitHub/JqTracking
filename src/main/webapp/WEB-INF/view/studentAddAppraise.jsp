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
<div style="display: flex;justify-content: center; margin-top: 50px">
<div class="layui-form" action="">
    <c:forEach var="i" items="${list}">
        <c:choose>
            <c:when test="${i.subject eq '整体评价'}">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">${i.subject}</label>
                    <div class="layui-input-block">
                        <input type="text" name="${i.subjectId}" placeholder="请输入评价内容" lay-verify="required" class="layui-textarea"></input>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="layui-form-item">
                    <label class="layui-form-label">${i.subject}</label>
                    <div class="layui-input-block">
                        <input type="text" name="${i.subjectId}" lay-verify="required|number|score" placeholder="请输入成绩" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <div class="layui-form-item" style="margin-top: 30px">
        <div class="layui-input-block">
            <button class="layui-btn" id="formDemo" lay-submit lay-filter="formDemo">立即提交</button>
        </div>
    </div>
</div>
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

        form.verify({
            score:function (value, item) {
                if(value < 0 || value > 100){
                    return '成绩在0-100之间';
                }
            }
        });

        //监听提交
        $("#formDemo").click(function(){
            //layer.msg(JSON.stringify(data.field));
            var list = $("input");
            var array = [];
            var count = 0;

            for (var i=0; i<list.length -1 && list[i]; i++){
                var v = parseInt(list[i].value);
                if(v < 0 || v > 100 || isNaN(v)){
                    count++;
                }
            }
            for(var i=0; i<list.length && list[i]; i++){
                //判断不是空的 input,进行表单提交
                if(list[i].value != "" && list[i].value != null)
                {
                    var key = list[i].name;
                    var value = list[i].value;
                    var s = new ObjData(key,value); //创建键值对象
                    array.push(s); //把对象放入对象数组中
                }
            }


            if(list.length == array.length && count==0){
                var postData = JSON.stringify(array);

                $.ajax({
                    url:"addAppraise_Teacher",
                    type:"post",
                    datatype : "json",
                    data : {
                        sId:${sId},
                        appraiser:"${sessionScope.teacher.tName}",
                        postData:postData
                    },
                    success:function (data) {
                        if(data){
                            layer.msg("评价成功",{icon:1});
                            setTimeout('closeAdd()',1000);
                        }else {
                            layer.msg("评价失败",{icon:2});
                            setTimeout('closeAdd()',1000);
                        }
                    },
                    error:function (data) {
                        layer.msg("执行失败",{icon:2});
                        setTimeout('closeAdd()',1000);
                    }
                });
            }
        });
    });

    var closeAdd = function () {
        parent.location.reload();//刷新父页面
    }
</script>
</body>
</html>
