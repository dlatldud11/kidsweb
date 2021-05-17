<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<title>카드형 식단표</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<div class="w3-container">
  <h2>식단</h2>
	<span style="float:right;">
		<a href="<%=NoForm%>dietInsert">식단표 등록&nbsp;</a>
	</span>
	<c:forEach var="bean" items="${requestScope.lists}">
	<div class="w3-container">
	  <div class="w3-card-4" style="width:25%">
	  <a href="<%=NoForm%>dietDetail&dietno=${bean.dietno}">
	    <img src="${bean.files}" alt="Alps" style="width:100%">
	    <div class="w3-container w3-center">
	    <p style="float:left;">${bean.category}/${bean.regdate}</p><br>
	      <p>${bean.content}</p>
	    </div>
	     </a>
	  </div>
	</div>
	</c:forEach>
</div>
</body>
</html>