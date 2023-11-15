<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
   <%@include file="/manage/jsp/script.jsp"%>
</head>
<body>
<div id="wrapper">
     <!-- Navigation -->
    <%@include file="/manage/jsp/top.jsp"%>

    <div id="page-wrapper">

        <div class="col-md-12 graphs">
	   <div class="xs">
           <ol class="breadcrumb" style="font-size: 1.3em;line-height: 1.5px;padding: 8px 5px;">
               <li><a >
                       订单管理
                   </a></li>
<!--               <li class="active">Data</li>-->
<%--                <c:if test="${userSession.role==1}">--%>
<%--               <button  style="padding: 3px 6px;height: 30px;margin-left: 2px;float: right;" type="button"  class="btn btn-default"><a style="text-decoration: none;"  href="${pageContext.request.contextPath}/manage/add.jsp"><i class="fa fa-plus" aria-hidden="true"></i>增加</a></button>--%>
<%--                </c:if>--%>
           </ol>
           <div class="search-wrap" style="margin-left: 5px">
               <div class="search-content">
                   <form action="${pageContext.request.contextPath }/orders/list" method="post" name="queryForm">
                       <input type="hidden" name="pageIndex" value="1"/>
                       <div class="input-group">
                           <table class="search-tab">
                               <tbody><tr>

                                   <th width="75" >订单号:</th>
                                   <td ><input style="margin-right: 100px;" type="text" name="no" value="${no}" class="form-control1 input-search" placeholder="请输入查找内容"></td>
                                   <td ><span class="input-group-btn">
                                    <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                                        </span></td>
                               </tr>
                               </tbody>

                           </table>

                       </div><!-- Input Group -->
                   </form>
               </div>
           </div>


<div class="panel panel-warning" style="margin-top: 0em;" data-widget="{&quot;draggable&quot;: &quot;false&quot;}" data-widget-static="">
<div class="panel-body no-padding" style="padding: 0px;">
<table class="table table-striped">
<thead>
<tr class="warning">
    <th>用户名</th>
    <th>用户电话</th>
    <th>总计</th>
    <th>订单编号</th>
    <th>数量</th>
    <th>类型</th>
    <th>状态</th>
    <th>操作</th>
</tr>
</thead>
<tbody>

<c:forEach var="orders" items="${list}" varStatus="status">

    <tr>
    <td>${orders.users.username}</td>
    <td>${orders.users.phone}</td>
    <td>${orders.price}</td>
    <td>${orders.no}</td>
    <td>${orders.quantity}</td>
    <td>${orders.type}</td>
    <td>${orders.status}</td>
    <td >
        <a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/odetail/list?oid=${orders.id}" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-primary">详情</button></a>
        <c:if test="${orders.status=='未发货'}">
        <a style="text-decoration: none;color: white;" class="updateNo" href="javascript:update('${orders.id}','已发货')" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info">发货</button></a>
        </c:if>
        <c:if test="${orders.status=='申请退货'}">
            <a style="text-decoration: none;color: white;" class="updateNo" href="javascript:update('${orders.id}','已退货')" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-success">同意退货</button></a>
        </c:if>
        <c:if test="${orders.status=='已签收'}">
            <a style="text-decoration: none;color: white;" class="updateNo" href="javascript:dodelete('${orders.id}')" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-danger">删除</button></a>
        </c:if>
    </td>
    </tr>
</c:forEach>

    </tbody>
    </table>
    </div>
    </div>
           <c:import url="rollpage.jsp"></c:import>
       </div>
   </div>

      </div>
      <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->
<!-- Nav CSS -->

<!--外层的div-->
<%@include file="/manage/jsp/bottom.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/manage/js/nolist.js"></script>
<script>
    function update(id,status){
        if(confirm("是否执行该操作?")){
            location.href="${pageContext.request.contextPath}/orders/update?id="+id+"&status="+status;
        }
    }
    function dodelete(id){
        if(confirm("是否删除该订单?")){
            location.href="${pageContext.request.contextPath}/orders/update?id="+id+"&isdel=1";
        }
    }
</script>
</body>
</html>
