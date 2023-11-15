<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


 		<div class="page-bar">
<%--			<input type="hidden" id="totalPageCount" value="${pageInfo.total}"/>--%>
			<nav>
				<ul class="pagination" style="margin:0;float:right;">
					<li><a href="javascript:page_nav(${pageBean.prevPage});"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
					<li><a >${pageBean.pageNo }/${pageBean.totalPage}</a></li>
					<li><a href="javascript:page_nav(${pageBean.nextPage });"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>

				</ul>
			</nav>



<%--				<li>共${pageInfo.total }条记录&nbsp;&nbsp; ${pageInfo.pageNum }/${pageInfo.pages}页</li>--%>
<%--				<c:if test="${!pageInfo.isFirstPage}">--%>
<%--					<a href="javascript:page_nav(1);">首页</a>--%>
<%--					<a href="javascript:page_nav(${pageInfo.prePage});">上一页</a>--%>
<%--				</c:if>--%>
<%--				<c:if test="${!pageInfo.isLastPage}">--%>
<%--					<a href="javascript:page_nav(${pageInfo.nextPage });">下一页</a>--%>
<%--					<a href="javascript:page_nav(${pageInfo.endRow});">最后一页</a>--%>
<%--				</c:if>--%>
<%--		 <span class="page-go-form"><label>跳转至</label>--%>
<%--	     <input type="text" name="inputPage" id="inputPage" class="page-key" />页--%>
<%--	     <button type="button" class="page-btn" onClick='jump_to(document.getElementById("inputPage").value)'>GO</button>--%>
<%--		</span>--%>
		</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/manage/js/rollpage.js"></script>
