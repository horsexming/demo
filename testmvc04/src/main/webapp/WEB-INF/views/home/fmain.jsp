<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>陕西杰信商务综合管理平台</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<link
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
function batchDeletes(){
    //判断至少写了一项
    var checkedNum = $("input[name='subcheck']:checked").length;
    if(checkedNum==0){
        alert("请至少选择一项!");
        return false;
    }
    if(confirm("确定删除所选项目?")){
    	var checkedList = new Array();
        $("input[name='subcheck']:checked").each(function(){
            checkedList.push($(this).val());
        });
        
        $.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/factory/del",
            data:{"delitems":checkedList.toString()},
            success:function(data){
                $("[name='checkbox2']:checkbox").attr("checked",false);
                location.reload();//页面刷新
            },
            error:function(data){
                art.dialog.tips('删除失败!');
            }
        });
    	
    }

}
function DeletesByid(){
    //判断至少写了一项
    var checkedNum = $("input[name='subcheck']:checked").length;
    if(checkedNum==0){
        alert("请选择一项!");
        return false;
    }
    var checkedList = new Array();
    $("input[name='subcheck']:checked").each(function(){
        checkedList.push($(this).val());
    });
    
    if(checkedNum>1){
        alert("请选择一项!");
        return false;
    }
    
    if(confirm("确定删除所选信息?")){
    	var delid = $("input[name='subcheck']:checked").val();
    	alert(delid);
        $.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/factory/delByid",
            data:{"delid":delid},
            
            success:function(data){
                $("[name='checkbox2']:checkbox").attr("checked",false);
                location.reload();//页面刷新
            },
            error:function(data){
                art.dialog.tips('删除失败!');
            }
        });
    	
    }

}
</script>
</head>
<body>
<ul class="nav nav-pills">
  <li role="presentation" class="active"><a href="factory/addfactory">厂家信息新增</a></li>
  <li role="presentation" class="active"><a href="#" onclick="DeletesByid()">删除一项</a></li>
  <li role="presentation" class="active"><a href="#" onclick="batchDeletes()">批量删除</a></li>
</ul>
<table class="table table-striped">
	<tr>
		<td colspan="10" align="center">厂家信息列表</td>
	</tr>
	<tr>
		<td></td>
		<td>全称</td>
		<td>简称</td>
		<td>联系人</td>
		<td>电话</td>
		<td>手机</td>
		<td>传真</td>
		<td>备注</td>
		<td>状态</td>
		<td></td>
	</tr>
	<c:forEach items="${Factorys}" var="Factorys">
		<tr>
			<td><input type="checkbox" id="subcheck" name="subcheck" value="${Factorys.id}"></td>
			<td>${Factorys.fullName}</td>
			<td>${Factorys.factoryName}</td>
			<td>${Factorys.contacts}</td>
			<td>${Factorys.phone}</td>
			<td>${Factorys.mobile}</td>
			<td>${Factorys.fax}</td>
			<td>${Factorys.cnote}</td>
			<td>
				<c:if test="${Factorys.state==1}"><a href="factory/updateState/${Factorys.id}">启用</a></c:if>
				<c:if test="${Factorys.state==0}"><a href="factory/updateState/${Factorys.id}"><font color="red">停用</font></a></c:if>
			</td>
			<td><a href="factory/selectfactorybyid/${Factorys.id}">信息修改</a></td>
		</tr>
	</c:forEach>
</table>
			
</body>		
</html>