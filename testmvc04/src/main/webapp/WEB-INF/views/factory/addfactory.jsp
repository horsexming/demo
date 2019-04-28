<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>厂家信息添加</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<link
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
</head>
<body>
<h4 align="center">厂家信息添加</h4>
	<form class="form-horizontal" action="factoryadd" method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">全称</label>
			<div class="col-sm-10">
				<input type="text" name="fullName" class="form-control" placeholder="全称">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">简称</label>
			<div class="col-sm-10">
			<input type="text" name="factoryName" class="form-control" placeholder="简称">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">联系人</label>
			<div class="col-sm-10">
			<input type="text" name="contacts" class="form-control" placeholder="联系人">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">电话</label>
			<div class="col-sm-10">
			<input type="text" name="phone" class="form-control" placeholder="电话">
			</div>
		</div>
		 <div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">手机</label>
			<div class="col-sm-10">
			<input type="text" name="mobile" class="form-control" placeholder="手机">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">传真</label>
			<div class="col-sm-10">
			<input type="text" name="fax" class="form-control" placeholder="传真">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">备注</label>
			<div class="col-sm-10">
			<input type="text" name="cnote" class="form-control" placeholder="备注">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">验货员</label>
			<div class="col-sm-10">
			<input type="text" name="inspector" class="form-control" placeholder="验货员">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">排序号</label>
			<div class="col-sm-10">
			<input type="text" name="orderNo" class="form-control" placeholder="排序号">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">提交</button>
			</div>
		</div>
	</form>   
</body>
</html>