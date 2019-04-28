<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>出口报运</title> 
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<link
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

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
            url:"<%=request.getContextPath()%>/contract/del",
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
            url:"<%=request.getContextPath()%>/contract/delByid",
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

function shangbao(){
	    //判断至少写了一项
	    var checkedNum = $("input[name='subcheck']:checked").length;
	    if(checkedNum==0){
	        alert("请至少选择一项!");
	        return false;
	    }
	    if(confirm("确定上报所选项目?")){
	    	var checkedList = new Array();
	        $("input[name='subcheck']:checked").each(function(){
	            checkedList.push($(this).val());
	        });
	        
	        $.ajax({
	            type:"POST",
	            url:"<%=request.getContextPath()%>/contract/updateState",
	            data:{"delitems":checkedList.toString()},
	            success:function(data){
	                $("[name='checkbox2']:checkbox").attr("checked",false);
	                location.reload();//页面刷新
	            },
	            error:function(data){
	                art.dialog.tips('上报失败!');
	            }
	        });
	    	
	    }

}

function quxiaoshangbao(){
    //判断至少写了一项
    var checkedNum = $("input[name='subcheck']:checked").length;
    if(checkedNum==0){
        alert("请至少选择一项!");
        return false;
    }
    if(confirm("确定上报所选项目?")){
    	var checkedList = new Array();
        $("input[name='subcheck']:checked").each(function(){
            checkedList.push($(this).val());
        });
        
        $.ajax({
            type:"POST",
            url:"<%=request.getContextPath()%>/contract/updateState2",
            data:{"delitems":checkedList.toString()},
            success:function(data){
                $("[name='checkbox2']:checkbox").attr("checked",false);
                location.reload();//页面刷新
            },
            error:function(data){
                art.dialog.tips('上报失败!');
            }
        });
    	
    }

}


function chakan(){
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
    
    var ids = $("input[name='subcheck']:checked").val();
    	window.location.href ="<%=request.getContextPath()%>/contract/selectAllById/?id="+ids;
}

function zhuangxiang(){
    //判断至少写了一项
    var checkedNum = $("input[name='subcheck']:checked").length;
    if(checkedNum==0){
        alert("请至少选择一项!");
        return false;
    }
    if(confirm("确定装箱所选项目?")){
    	var checkedList = new Array();
        $("input[name='subcheck']:checked").each(function(){
            checkedList.push($(this).val());
        });
        window.location.href ="<%=request.getContextPath()%>/PackingList/Packing/?packings="+checkedList.toString(); 	
    }

}
</script>
</head>

<body>

<ul class="nav nav-pills">
  <li role="presentation" class="active"><a href="#" onclick="shangbao()">上报</a></li>
  <li role="presentation" class="active"><a href="#" onclick="quxiaoshangbao()">取消上报</a></li>
  <li role="presentation" class="active"><a href="#" onclick="chakan()">查看</a></li>
  <li role="presentation" class="active"><a href="#" onclick="zhuangxiang()">装箱</a></li>
</ul>
<table class="table table-striped">
	<tr>
		<td colspan="16" align="center">购销合同</td>
	</tr>
	<tr>
		<td></td>
		<td>序号</td>
		<td>合同或确认书号</td>
		<td>信用证号</td>
		<td>货物数/附件数</td>
		<td>收货人及地址</td>
		<td>装运港</td>
		<td>目的港</td>
		<td>运输方式</td>
		<td>价格条件</td>
		<td>制单日期</td>
		<td>状态</td>
		<td colspan="2" align="center">操作</td>
	</tr>
	<c:forEach items="${exportlist}" var="export" varStatus="status">
		<tr>
			<td><input type="checkbox" id="subcheck" name="subcheck" value="${export.id}"></td>			
			<td>${status.index+1}</td>
			<td><a href="#">${export.customerContract}</a></td>
			<td>${export.lcno}</td>
			<td align="center">${export.epnum}/${export.extnum}</td>
			<td>${export.consignee}</td>
			<td>${export.shipmentPort}</td>
			<td>${export.destinationPort}</td>
			<td>${export.transportMode}</td>
			<td>${export.priceCondition}</td>
			<td><fmt:formatDate value="${export.inputDate}" pattern="yyyy-MM-dd"/></td>
			<td>
				<c:if test="${export.state==1}"><font color="green">已上报</font></c:if>
				<c:if test="${export.state==0}">草稿</c:if>
			</td>
			<td><a href="<%=request.getContextPath()%>/contract/selectcontractById/${contract.id}">信息修改</a></td>
			<td><a href="<%=request.getContextPath()%>/ContractProduct/contractProductadd/?contractId=${contract.id}">[货物]</a></td>
		</tr>
	</c:forEach>
</table>
</body>		
</html>