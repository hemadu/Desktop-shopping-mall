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
               <button  style="padding: 3px 6px;height: 30px;margin-left: 2px;float: right;" type="button" onclick="history.go(-1)" class="btn btn-default">返回</button>

           </ol>
           <div class="search-wrap" style="margin-left: 5px">
               <div class="search-content">
                   <form action="${pageContext.request.contextPath }/odetail/list" method="post" name="queryForm">
                       <input type="hidden" name="pageIndex" value="1"/>
                       <input type="hidden" name="oid" value="${oid}"/>
                       <div class="input-group">

                       </div><!-- Input Group -->
                   </form>
               </div>
           </div>


<div class="panel panel-warning" style="margin-top: 0em;" data-widget="{&quot;draggable&quot;: &quot;false&quot;}" data-widget-static="">
<div class="panel-body no-padding" style="padding: 0px;">
<table class="table table-striped">
<thead>
<tr class="warning">
    <th>商品名称</th>
    <th>类别</th>
    <th>单价</th>
    <th>图片</th>
    <th>数量</th>
</tr>
</thead>
<tbody>

<c:forEach var="odetail" items="${list}" varStatus="status">
    <tr>
    <td>${odetail.goods.name}</td>
    <td>${odetail.goods.type.name}</td>
    <td>${odetail.goods.price}</td>
    <td style="line-height: 50px;" ><img src="${pageContext.request.contextPath}/images/${odetail.goods.pic}"  style="max-height:48px;"></td>
    <td>${odetail.quantity}</td>
<%--        <td>--%>
<%--        <button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info"><a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/odetail/update?id=${odetail.id}" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></button>--%>
<%--        <button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector"><a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${odetail.id})" ><i class="fa fa-trash-o" aria-hidden="true"></i></a></button>--%>
<%--        </td>--%>
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

</body>
</html>
