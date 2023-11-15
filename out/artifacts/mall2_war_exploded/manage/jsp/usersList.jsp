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
                       用户管理
                   </a></li>
<!--               <li class="active">Data</li>-->
<%--                <c:if test="${userSession.role==1}">--%>
<%--               <button  style="padding: 3px 6px;height: 30px;margin-left: 2px;float: right;" type="button"  class="btn btn-default"><a style="text-decoration: none;"  href="${pageContext.request.contextPath}/manage/add.jsp"><i class="fa fa-plus" aria-hidden="true"></i>增加</a></button>--%>
<%--                </c:if>--%>
           </ol>
           <div class="search-wrap" style="margin-left: 5px">
               <div class="search-content">
                   <form action="${pageContext.request.contextPath }/users/list" method="post" name="queryForm">
                       <input type="hidden" name="pageIndex" value="1"/>
                       <div class="input-group">
                           <table class="search-tab">
                               <tbody><tr>

                                   <th width="60">身份:</th>
                                   <td>
                                       <select name="role" style="height: 35px;width:90px;margin-right: 40px;padding:0 5px;border: 1px solid #e0e0e0;font-size: 0.85em;color: #999;font-weight: bold;">
                                           <option value="" style="color: #999;font-weight: bold;"  selected>身份</option>
                                           <option value="0" style="color: #999;font-weight: bold;"
                                                   <c:if test="${role==0}">
                                                       selected
                                                   </c:if>
                                           >会员</option>
                                           <option value="1" style="color: #999;font-weight: bold;"
                                                   <c:if test="${role==1}">
                                                       selected
                                                   </c:if>>管理员</option>
                                       </select>
                                   </td>

                                   <th width="60" >姓名:</th>
                                   <td ><input style="margin-right: 100px;" type="text" name="name" value="${name}" class="form-control1 input-search" placeholder="请输入查找姓名"></td>
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
    <th>姓名</th>
    <th>电话</th>
    <th>身份</th>
    <th>头像</th>
    <th>地址</th>
    <th>性别</th>
    <th>生日</th>
    <th>邮箱</th>
    <th>操作</th>
</tr>
</thead>
<tbody>

<c:forEach var="users" items="${list}" varStatus="status">
    <c:if test="${users.id!=null}">
    <tr>
    <td>${users.username}</td>
    <td>${users.name}</td>
    <td>${users.phone}</td>
    <td>
        ${users.role==1?"管理员":"会员"}
    </td>
    <td><img src="${pageContext.request.contextPath}/images/${users.pic}"  style="max-width:35px;"></td>
    <td>${users.address.content}</td>
        <td>${users.sex}</td>
        <td>${users.birth}</td>
        <td>${users.email}</td>
        <td >
            <a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/users/update?id=${users.id}" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></a>
            <a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${users.id})" ><button style="padding:2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector"><i class="fa fa-trash-o" aria-hidden="true"></i></button></a>

        </td>
    </tr>
    </c:if>
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
<script type="text/javascript" src="${pageContext.request.contextPath }manage/js/nolist.js"></script>
<script>
    // if(confirm("是否删除 ")){
    //     location.href="..goods?action=del&id="+id;
    // }
    function del(obj){
        if(confirm("是否删除 ")){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath }/users/del/"+obj ,
                // data:{method:"deluser",uid:obj.attr("userid")},
                dataType:"json",
                success:function(data){
                    if(data.delResult == "true"){//删除成功：移除删除行
                        alert("删除成功");
                    }else if(data.delResult == "false"){//删除失败
                        alert("对不起，删除失败");
                    }else if(data.delResult == "notexist"){
                        alert("对不起，该用户不存在");
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
