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

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" /> 
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>  
</head>

</head>
<body>
<h4 align="center">购销合同添加</h4>
	<form class="form-horizontal" action="<%=request.getContextPath()%>/contract/contractcommit" method="post">
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">客户名称</label>
			<div class="col-sm-10">
				<input type="text" name="customName" class="form-control" placeholder="客户名称">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">收购方</label>
			<div class="col-sm-10">
			<input type="text" name="offeror" class="form-control" placeholder="收购方">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">合同号人</label>
			<div class="col-sm-10">
			<input type="text" name="contractNo" class="form-control" placeholder="合同号">
			</div>
		</div>
		 <div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">打印版式</label>
			<div class="col-sm-10">
			<input type="radio" name="printStyle" value="2" class="input" checked>两款
	        <input type="radio" name="printStyle" value="1" class="input">一款
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">签单日期</label>
			<div class="input-group date" id='date1'>  
                <input type="text" class="form-control"name="signingTimeDate" />  
                <span class="input-group-addon">  
                    <i class="glyphicon glyphicon-calendar"></i>  
                </span>  
            </div>  
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">重要程度</label>
			<div class="col-sm-10">
				<input type="radio" name="importNum" value="3" class="input" checked>★★★
	            <input type="radio" name="importNum" value="2" class="input">★★
	            <input type="radio" name="importNum" value="1" class="input">★
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">交货日期</label>
			<div class="input-group date" id='date2'>  
                <input type="text" class="form-control"name="deliveryPeriod" />  
                <span class="input-group-addon">  
                    <i class="glyphicon glyphicon-calendar"></i>  
                </span>  
            </div>  
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">船期</label>
			<div class="input-group date" id='date3'>  
                <input type="text" class="form-control"name="shipTime" />  
                <span class="input-group-addon">  
                    <i class="glyphicon glyphicon-calendar"></i>  
                </span>  
            </div>  
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">贸易条款</label>
			<div class="col-sm-10">
			<input type="text" name="tradeTerms" class="form-control" placeholder="贸易条款">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">验货员</label>
			<div class="col-sm-10">
			<input type="text" name="inspector" class="form-control" placeholder="验货员">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">制单人</label>
			<div class="col-sm-10">
			<input type="text" name="inputBy" class="form-control" placeholder="制单人">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">审单人</label>
			<div class="col-sm-10">
			<input type="text" name="checkBy" class="form-control" placeholder="审单人">
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">要求</label>
			<div class="col-sm-10">
				<textarea rows="5" cols="180" name="crequest"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">说明</label>
			<div class="col-sm-10">
				<textarea rows="5" cols="180" name="remark"></textarea>
			</div>
		</div>
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
	$('#date2').datetimepicker({  
   		format: 'YYYY-MM-DD hh:mm:ss',  
    	locale: moment.locale('zh-cn')  
	});
	$('#date3').datetimepicker({  
   		format: 'YYYY-MM-DD hh:mm:ss',  
    	locale: moment.locale('zh-cn')  
	});
</script>
</html>