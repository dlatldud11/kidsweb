<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<title>카드형 식단표</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<c:set var="i" value="0"/>
<c:set var="j" value="4"/>
<body>
	<div class="form-group" align="center">
	 <h2>식단</h2>
		<span style="float:right;">
			<a href="<%=NoForm%>dietInsert" class="btn btn-info" type="buttoen">식단표 등록&nbsp;</a>
		</span>
	</div>
	<hr>
	  <div class="form-group w3-center">
		<div class="row w3-container w3-center">
		
			<c:forEach var="bean" items="${requestScope.lists}">
			  <div class="w3-card-4" style="margin-right:5px;margin-left:25px;width:380px;height:365px">
			  <a href="<%=NoForm%>dietDetail&dietno=${bean.dietno}">
			    <img src="${bean.files}" alt="Alps" style="width:100%">
			    <div class="w3-container w3-center">
			    <p style="float:left;">${bean.category}/${bean.regdate}</p><br>
			      <textarea class="form-control" readonly="readonly" style="float:left;width:100%;height:130px">${bean.content}</textarea>
			    </div>
			     </a>
			  </div>
			</c:forEach>
			
		</div>
	</div>
</body>
</html>