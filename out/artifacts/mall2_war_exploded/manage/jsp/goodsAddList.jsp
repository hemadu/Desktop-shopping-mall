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
                       商品管理
                   </a></li>
           </ol>
           <div class="search-wrap" style="margin-left: 5px">
               <div class="search-content">
                   <form action="${pageContext.request.contextPath }/goods/list?change=1" method="post" name="queryForm">
                       <input type="hidden" name="pageIndex" value="1"/>
                       <div class="input-group">
                           <table class="search-tab">
                               <tbody><tr>

                                   <th width="75">请选择:</th>
                                   <td>
                                       <select id="tid" name="tid" style="height: 35px;width:90px;margin-right: 40px;padding:0 5px;border: 1px solid #e0e0e0;font-size: 0.85em;color: #999;font-weight: bold;">
                                       </select>
                                   </td>

                                   <th width="60" >名称:</th>
                                   <td ><input style="margin-right: 100px;" type="text" name="name" value="${name}" class="form-control1 input-search" placeholder="请输入查找内容"></td>
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
    <th>ID</th>
    <th>类别</th>
    <th>名称</th>
    <th>价格</th>
    <th>库存</th>
    <th>图片</th>
    <th>描述</th>
    <th>操作</th>
</tr>
</thead>
<tbody>

<c:forEach var="goods" items="${list}" varStatus="status">
    <tr>
    <td>${goods.id}</td>
    <td>${goods.type.name}</td>
    <td>${goods.name}</td>
    <td>${goods.price}</td>
    <td>${goods.quantity}</td>
    <td style="line-height: 50px;" ><img src="${pageContext.request.contextPath}/images/${goods.pic}"  style="max-height:48px;"></td>
    <td style="width: 40%;">${goods.content}</td>
        <td>
            <a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/pdetail/add?id=${goods.id}" ><button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button></a>
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
    //加载类别
    $.getJSON("${pageContext.request.contextPath }/type/jsonlist",function(data){
        $("#tid").html("<option value=''>类别</option>");
        $(data).each(function(index,d){
            if('${requestScope.tid}'==d.id){
                $("#tid").append("<option selected value='"+d.id+"'>"+d.name+" </option>");
            }else{
                $("#tid").append("<option value='"+d.id+"'>"+d.name+" </option>");
            }
        });
        //form.render('select'); //刷新select选择框渲染
    });
    // if(confirm("是否删除 ")){
    //     location.href="..goods?action=del&id="+id;
    // }
    function del(obj){
        if(confirm("是否删除 ")){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath }/goods/del/"+obj ,
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
