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
                        方案管理
                   </a></li>
               <button  style="padding: 3px 6px;height: 30px;margin-left: 2px;float: right;" type="button"  class="btn btn-default"><a style="text-decoration: none;"  href="${pageContext.request.contextPath}/goods/list?change=1"><i class="fa fa-plus" aria-hidden="true"></i>增加</a></button>
               <button  style="padding: 3px 6px;height: 30px;margin-left: 2px;float: right;" type="button" onclick="history.go(-1)" class="btn btn-danger">返回</button>

           </ol>
           <div class="search-wrap" style="margin-left: 5px">
               <div class="search-content">
                   <form action="${pageContext.request.contextPath }/pdetail/list" method="post" name="queryForm">
                       <input type="hidden" name="pageIndex" value="1"/>
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
    <th>操作</th>
</tr>
</thead>
<tbody>

<c:forEach var="pdetail" items="${list}" varStatus="status">
    <tr>
    <td>${pdetail.goods.name}</td>
    <td>${pdetail.goods.type.name}</td>
    <td>${pdetail.goods.price}</td>
    <td style="line-height: 50px;" ><img src="${pageContext.request.contextPath}/images/${pdetail.goods.pic}"  style="max-height:48px;"></td>
    <td>${pdetail.quantity}</td>
        <td>
            <a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/pdetail/update?id=${pdetail.id}" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></a>
            <a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${pdetail.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector"><i class="fa fa-trash-o" aria-hidden="true"></i></button></a>
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

    function del(obj){
        if(confirm("是否删除 ")){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath }/pdetail/del/"+obj ,
                // data:{method:"deluser",uid:obj.attr("userid")},
                dataType:"json",
                success:function(data){
                    if(data.delResult == "true"){//删除成功：移除删除行
                        alert("删除成功");
                    }else if(data.delResult == "false"){//删除失败
                        alert("对不起，删除失败");
                    }else if(data.delResult == "notexist"){
                        alert("对不起，该项不存在");
                    }
                    location.reload();
                },
                error:function(data){
                    alert("对不起，删除失败");
                }
            });
        }

    }

</script>
</body>
</html>
