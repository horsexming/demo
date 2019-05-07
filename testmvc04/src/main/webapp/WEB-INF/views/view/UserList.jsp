<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<title>CRUD</title>
<script type="text/javascript">
	function deletes(node,id){
		var flag = confirm("确定删除吗？");
		if(flag){
			$.ajax({
				type : "POST",
				url : "delete",
				data : {id:id},
				dataType:"json",
				success : function(data) {
					if(data==1){
						alert("删除成功");
						var tr=node.parentNode.parentNode;
						var tbody=tr.parentNode;
						tbody.removeChild(tr);
					}else{
						alert("删除失败");
					}
									
					var html = '<tr><td>用户名</td><td>年龄</td><td>性别</td><td align="center">手机</td><td colspan="3" align="center">编辑</td></tr>';
					  
					html +='<td>'+data[i].alreadyPaidAmount+'</td>';
					  
					  $('#datatable').html(html);
				}
			});	
		}		
	}

</script>
</head>
<body>
	<form action="findByname">
		<table>
			<tr>
				<td><input type="text" name="username"></td>
				<td><input type="submit" value="搜索"></td>
			</tr>
		</table>
	</form>
	<table border="1" id="datatable">
		<tr>
			<td>用户名</td><td>年龄</td><td>性别</td><td align="center">手机</td><td colspan="3" align="center">编辑</td>
		</tr>
		
		<c:forEach items="${user}" var="user">
			<tr>
				<td>${user.username}</td><td>${user.age}</td>
				<c:if test="${user.sex =='m'}" >
					<td>男</td>
				</c:if>
				<c:if test="${user.sex != 'm' }">
					<td>女</td>
				</c:if>
				<td>${user.phone}</td>
				<td><a href="#" id="dels" onclick="deletes(this,${user.id})">删除</a></td>
				<td><a href="Update/${user.id}">修改</a></td>
			</tr>
		</c:forEach>
		
	</table>
</body>

</html>