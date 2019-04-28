<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/AddUserRegister" method="post">
		<table>
			<tr>
				<td>用户名:</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<td>年龄:</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>性别:</td>
				<td><input type="text" name="sex"></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="提交"></td>
			</tr>		
		</table>
	</form>
</body>
</html>