<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<title>카드형 식단표</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
  <h2>식단</h2>
	<span style="float:right;">
		<a href="bfdietInssert.jsp">아침&nbsp;</a>
		<a href="lcdietInssert.jsp">점심&nbsp;</a>
		<a href="dndietInssert.jsp">저녁&nbsp;</a>
		<a href="dsdietInssert.jsp">간식&nbsp;</a>
	</span>
<div class="row w3-container">
	<div class="col-xl-4">
	  <div class="w3-card-4" style="width:50%">
	    <img src="${bean.bffiles}" alt="Alps" style="width:100%">
	    <div class="w3-container w3-center">
	 	   <a style="float:right;" href="bfdietUpdate.jsp">수정</a>
	      <p>${bean.bf}</p>
	    </div>
	  </div>
	</div>
	<div class="col-xl-4">  
	  <div class="w3-card-4" style="width:50%">
	    <img src="${bean.lcfiles}" alt="Alps" style="width:100%">
	    <div class="w3-container w3-center">
	    	<a style="float:right;" href="lcdietInssert.jsp">수정</a>
	      <p>${bean.bf}</p>
	    </div>
	  </div>
	</div>
	<div class="col-xl-4">  
	  <div class="w3-card-4" style="width:50%">
	    <img src="${bean.dnfiles}" alt="Alps" style="width:100%">
	    <div class="w3-container w3-center">
	    	<a style="float:right;" href="dndietInssert.jsp">수정</a>
	      <p>${bean.bf}</p>
	    </div>
	  </div>
	</div>  
	<div class="col-xl-4">  
	  <div class="w3-card-4" style="width:50%">
	    <img src="${bean.dsfiles}" alt="Alps" style="width:100%">
	    <div class="w3-container w3-center">
	 	   <a style="float:right;" href="dsdietInssert.jsp">수정</a>
	      <p>${bean.bf}</p>
	    </div>
	  </div>
	</div>
</div>

</body>
</html>
<html>
<body>
<%@ include file="./../common/footer.jsp" %>
</body>
</html>