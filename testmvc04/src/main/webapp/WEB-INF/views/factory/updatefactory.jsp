<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>厂家信息修改</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<link
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
</head>
<body>
<h4 align="center">厂家信息修改</h4>
	<form class="form-horizontal" action="../updatefactory" method="post">
	<input type="hidden" name="id" value="${factory.id}">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">全称</label>
			<div class="col-sm-10">
				<input type="text" name="fullName" class="form-control" placeholder="全称" value="${factory.fullName}">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">简称</label>
			<div class="col-sm-10">
			<input type="text" name="factoryName" class="form-control" placeholder="简称" value="${factory.factoryName}">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">联系人</label>
			<div class="col-sm-10">
			<input type="text" name="contacts" class="form-control" placeholder="联系人" value="${factory.contacts}">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">电话</label>
			<div class="col-sm-10">
			<input type="text" name="phone" class="form-control" placeholder="电话" value="${factory.phone}">
			</div>
		</div>
		 <div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">手机</label>
			<div class="col-sm-10">
			<input type="text" name="mobile" class="form-control" placeholder="手机" value="${factory.mobile}">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">传真</label>
			<div class="col-sm-10">
			<input type="text" name="fax" class="form-control" placeholder="传真" value="${factory.fax}">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">备注</label>
			<div class="col-sm-10">
			<input type="text" name="cnote" class="form-control" placeholder="备注" value="${factory.cnote}">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">修改</button>
			</div>
		</div>
	</form>   
</body>
</html>