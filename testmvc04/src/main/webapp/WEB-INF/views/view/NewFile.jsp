<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<link
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" /> 
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增装箱单信息</title>
</head>
<body>
<h4 align="center">新增装箱单信息</h4>
	<form class="form-horizontal" action="<%=request.getContextPath()%>/PackingList/insertPacking" method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">卖方：</label>
			<div class="col-sm-10">
				<input type="text" name="seller" class="form-control" placeholder="卖方">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">买方：</label>
			<div class="col-sm-10">
			<input type="text" name="buyer" class="form-control" placeholder="买方">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">发票号：</label>
			<div class="col-sm-10">
			<input type="text" name="invoiceNo" class="form-control" placeholder="发票号">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">发票日期：</label>
			<div class="input-group date" id='date1'>  
                <input type="text" class="form-control"name="invoiceDate" />  
                <span class="input-group-addon">  
                    <i class="glyphicon glyphicon-calendar"></i>  
                </span>  
            </div>  
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">唛头：</label>
			<div class="col-sm-10">
				<textarea rows="5" cols="180" name="marks"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">描述：</label>
			<div class="col-sm-10">
				<textarea rows="5" cols="180" name="descriptions"></textarea>
			</div>
		</div>			
			${divData}
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">提交</button>
			</div>
		</div>
		
	</form>   
</body>
<script>
	$('#date1').datetimepicker({  
   		format: 'YYYY-MM-DD hh:mm:ss',  
    	locale: moment.locale('zh-cn')  
	});
</script>
</html>