<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购销合同下的货物</title>
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
	<script type="text/javascript">
    	//设置冗余的生产厂家名称
    	function setFactoryName(val){
    		var ele = document.getElementById("factoryName");
    		ele.value = val;
    	}
    </script>
</head>
<body>

<h4 align="center">附件修改</h4>
<form class="form-horizontal" action="<%=request.getContextPath()%>/ExtCproduct/UpdateEXTCProduct" method="post">
	<input type="text" name="factoryName" id="factoryName" value="${EXTProduct.factoryName}">
	<input type="text" name="contractProductId" value="${EXTProduct.contractProductId}">
	<input type="text" name="id" value="${EXTProduct.id}">
	
	<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">提交</button>
      <a href="<%=request.getContextPath()%>/contract/contractList" class="btn btn-default">返回</a>
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">厂家名称</label>
    <div class="col-sm-4">
    	<select name="factoryId" class="form-control" id="inputPassword3" onchange="setFactoryName(this.options[this.selectedIndex].text);">
    		<option value="">--请选择--</option>
    		<c:forEach items="${factorys}" var="f">
    			<option value="${f.id}" <c:if test="${EXTProduct.factoryId==f.id}">selected</c:if>>${f.factoryName}</option>
    		</c:forEach>   		
    	</select>
    </div>
    <label for="inputEmail3" class="col-sm-1 control-label">类型</label>
    <div class="col-sm-4">
    	<select name="ctype" class="form-control" id="inputPassword3">
    		<option value="">--请选择--</option>
    			<option value="彩盒" <c:if test="${EXTProduct.ctype=='彩盒'}">selected</c:if>>彩盒</option>
    			<option value="花纸" <c:if test="${EXTProduct.ctype=='花纸'}">selected</c:if>>花纸</option>
    			<option value="保丽龙" <c:if test="${EXTProduct.ctype=='保丽龙'}">selected</c:if>>保丽龙</option>
    			<option value="电镀" <c:if test="${EXTProduct.ctype=='电镀'}">selected</c:if>>电镀</option>
    			<option value="PVC" <c:if test="${EXTProduct.ctype=='PVC'}">selected</c:if>>PVC</option>
    			<option value="喷头" <c:if test="${EXTProduct.ctype=='喷头'}">selected</c:if>>喷头</option>
    			<option value="不锈钢勺子" <c:if test="${EXTProduct.ctype=='不锈钢勺子'}">selected</c:if>>不锈钢勺子</option>  		
    	</select>
    </div>
   </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">货物图片</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="productImage" value="${EXTProduct.productImage}">
    </div>
    <label for="inputPassword3" class="col-sm-1 control-label">货号</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="productNo" value="${EXTProduct.productNo}">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">数量</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="cnumber" value="${EXTProduct.cnumber}">
    </div>
    <label for="inputPassword3" class="col-sm-1 control-label">包装单位</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="packingUnit" value="${EXTProduct.packingUnit}">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">单价</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="price" value="${EXTProduct.price}">
    </div>
    <label for="inputPassword3" class="col-sm-1 control-label">排序号</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="orderNo" value="${EXTProduct.orderNo}">
    </div>
  </div>
  <div class="form-group">
	<label for="inputPassword3" class="col-sm-2 control-label">货物描述</label>
		<div class="col-sm-4">
			<textarea rows="5" cols="70" name="productDesc" >${EXTProduct.productDesc}</textarea>
		</div>
	<label for="inputPassword3" class="col-sm-1 control-label">要求</label>
		<div class="col-sm-4">
			<textarea rows="5" cols="70" name="productRequest" >${EXTProduct.productRequest}</textarea>
		</div>
  </div>
</form>
</body>
</html>