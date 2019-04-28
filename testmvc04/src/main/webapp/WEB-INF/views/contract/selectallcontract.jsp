<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>购销合同</title> 
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<link
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>
<table class="table table-striped">
	<tr>
		<td colspan="4" align="center">购销合同</td>
	</tr>
	<tr>
		<td>序号</td><td>${AllContract.id}</td>
		<td>客户名称</td><td>${AllContract.customName}</td>
	</tr>
	<tr>
		<td>合同号</td><td>${AllContract.contractNo}</td>
		<td>制单人</td><td>${AllContract.inputBy}</td>
	</tr>
	<tr>
		<td>审单人</td><td>${AllContract.checkBy}</td>
		<td>验货员</td><td>${AllContract.inspector}</td>
	</tr>
	<tr>
		<td>签单日期</td><td><fmt:formatDate value="${AllContract.signingTimeDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td>交货日期</td><td><fmt:formatDate value="${AllContract.deliveryPeriod}" pattern="yyyy-MM-dd HH:mm:ss"/></td>		
	</tr>
	<tr>
		<td>船期</td><td><fmt:formatDate value="${AllContract.shipTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td>总金额</td><td>${AllContract.totalAmount}</td>
	</tr>
	<tr>
		<td>状态</td>
		<td>
			<c:if test="${AllContract.state==1}">已上报</c:if>
			<c:if test="${AllContract.state==0}">草稿</c:if>
		</td>
		<td>重要程度</td>
		<td>
			<c:if test="${AllContract.importNum==3}">★★★</c:if>
	    	<c:if test="${AllContract.importNum==2}">★★</c:if>
	    	<c:if test="${AllContract.importNum==1}">★</c:if>
		</td>
	</tr>	
	<tr>	
		<td>附件数</td><td>${AllContract.extnum}</td>
		<td>货物数</td><td>${AllContract.pnum}</td>
	</tr>
</table>

<table class="table table-striped">
	<c:if test="${AllContract.contractProducts.size()!=0}">
		<c:forEach items="${AllContract.contractProducts}" var="Product" varStatus="status">
			<tr><td><font color="blue">合同下货物</font><font color="red">${status.index+1}</font></td></tr>
			<tr>
				<td>序号</td>
				<td>厂家名称</td>
				<td>货号</td>
				<td>数量</td>
				<td>包装单位</td>
				<td>箱数</td>
				<td>单价</td>
				<td>总金额</td>
				<td colspan="2" align="center">操作</td>
				<td>附件</td>
			</tr>		
			<tr>
				<td>${status.index+1}</td>
				<td>${Product.factory.factoryName}</td>
				<td>${Product.productNo}</td>
				<td>${Product.cnumber}</td>
				<td>${Product.packingUnit}</td>
				<td>${Product.boxNum}</td>
				<td>${Product.price}</td>
				<td>${Product.amount}</td>
				<td><a href="<%=request.getContextPath()%>/ContractProduct/updateProduct/?id=${Product.id}">[修改]</a></td>
				<td><a href="<%=request.getContextPath()%>/ContractProduct/deleteProduct/?id=${Product.id}&contractId=${Product.contract.id}">[删除]</a></td>
				<td><a href="<%=request.getContextPath()%>/ExtCproduct/ToExtCproduct/?contractProductId=${Product.id}">[附件]</a></td>
			</tr>
	
	<c:if test="${Product.extCproducts.size()!=0}">
		<tr><td><font color="blue">货物下的附件</font></td></tr>
		<tr>
			<td>序号</td>
			<td>厂家名称</td>
			<td>货号</td>
			<td>数量</td>
			<td>包装单位</td>
			<td>类型</td>
			<td>单价</td>
			<td>总金额</td>
			<td colspan="2" align="center">操作</td>
		</tr>
		<c:forEach items="${Product.extCproducts}" var="ExtCproduct" varStatus="status">	
			<tr>
				<td>${status.index+1}</td>
				<td>${ExtCproduct.factory.factoryName}</td>
				<td>${ExtCproduct.productNo}</td>
				<td>${ExtCproduct.cnumber}</td>
				<td>${ExtCproduct.packingUnit}</td>
				<td>${ExtCproduct.ctype}</td>
				<td>${ExtCproduct.price}</td>
				<td>${ExtCproduct.amount}</td>
				<td><a href="<%=request.getContextPath()%>/ExtCproduct/ToUpdateEXTCProduct/?id=${ExtCproduct.id}">[修改]</a></td>
				<td><a href="<%=request.getContextPath()%>/ExtCproduct/deleteEXTCProduct/?id=${ExtCproduct.id}&contractProductId=${ExtCproduct.contractProduct.id}">[删除]</a></td>
			</tr>
		</c:forEach>
	</c:if>	
		</c:forEach>
	</c:if>
</table>
</body>		
</html>