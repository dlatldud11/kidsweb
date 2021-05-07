<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE><html><head></head>
<body> 	
<%
	String imsi = request.getContextPath() + "/Kids?command=" ; 	
	//response.sendRedirect( imsi ) ;
%>
	<a href="<%=imsi%>hello">헬로우</a>
	<br><br><br>
	<a href="<%=imsi%>world">월드</a>
	뭐했다고 벌써 5시지?! 
	여러분 오늘 자습 하실건가요? 처음 입장했을 때 페이지는 stylish 포트폴리오 템플릿으로 할까요? 
	다른 템플릿은 유료네요 ㅠㅠ 
</body>
</html>