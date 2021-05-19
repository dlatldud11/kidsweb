<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../common/common.jsp" %>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		
		window.onload = function(){
			/* 필드 검색 상태 보존 */
			$('#year option').each(function(){
				if($(this).val() == '${year}'){
					$(this).attr('selected', 'selected') ;
				}			
			});
			
			$('#month option').each(function(){
				if($(this).val() == '${month}'){
					$(this).attr('selected', 'selected') ;
				}			
			});
			
			$('#order option').each(function(){
				if($(this).val() == '${order}'){
					$(this).attr('selected', 'selected') ;
				}			
			});
			
		} 
	</script>
</head>
<body>


<div class="container">
  <h2>상담 예약 목록</h2>
  <form name="myform" id="myform" action="<%=YesForm %>" method="post">
  	<input type="hidden" name="command" value="resList">
	<div class="form-inline" id="box">
		<div class="form-inline">
			<select name="year" id="year" class="form-control">
				<%
				    Calendar cal = Calendar.getInstance();
				 
				    int year = cal.get(Calendar.YEAR);
				    int month = cal.get(Calendar.MONTH) + 1;
				    
				    for(int i = year - 5; i < year + 5; i++) { 
				        if(i == year) {
				            out.println("<option selected=\"selected\" value=\""+i+"\">" + i + "</option>");
				        } else {
				            out.println("<option value=\""+i+"\">" + i + "</option>");
				        }
				    }
				%>
			</select>

			<label for="year">년</label>  
			<select name="month" id="month" class="form-control">
				<%
				    for(int i = 1; i <= 12; i++) {
				        if(i == month) {
				            out.println("<option selected=\"selected\" value=\""+i+"\">" + i + "</option>");
				        } else {
				            out.println("<option value=\""+i+"\">" + i + "</option>");
				        }
				    }
				%>
			</select>
			<label for="month">월</label> 
			<select class="form-control" id="order" name="order">
				<option value="desc">최신일자 순
				<option value="asc">과거일자 순
			</select>
			</div>
			<div class="form-inline">
				<input type="text" class="form-control" name="keyword" id="keyword" placeholder="이름/휴대폰">
				<input type="submit" class="form-control" value="검색">
				 ${pageInfo.pagingStatus}
			</div>
		</div>
	</form>
 
  <table class="table table-hover">
    <thead>
      <tr align="center">
      	<th>예약일자<th>
        <th>이름</th>
        <th>휴대폰</th>
        <th>등록일자</th>
        <th>상담</th>
        <th>취소</th>
      </tr>
    </thead>
    <tbody align="center">
    	<c:forEach var="bean" items="${requestScope.lists }">
	      <tr>
	      	<td>${bean.res_date }</td>
	      	<td></td>
	      	<td>${bean.name }</td>
	      	<td>${bean.hp }</td>
	      	<td>${bean.reg_date}</td>
	      	<td>
	      		<button class="form-control" onclick="location.href='<%=NoForm%>resUpdate&rid=${bean.rid}'">상담</button>
	      	</td>
	      	<td>
	      		<button class="form-control" onclick="location.href='<%=NoForm%>resDelete&rid=${bean.rid}'">취소</button>
	      	</td>
	      </tr>
	    </c:forEach>
    </tbody>
  </table>
 	 <div align="center">
		<footer>${pageInfo.pagingHtml}</footer>
	</div>
</div>

</body>
</html>