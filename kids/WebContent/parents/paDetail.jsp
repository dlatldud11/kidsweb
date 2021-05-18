<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부모 상세 페이지</title>
</head>
<body>
	<div class="container col-sm-offset-2 col-sm-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4 align="center">보호자 정보 상세 보기</h4>
			</div>
			<div class="row panel-body">
				<div class="col-sm-4">
					<table>
						<tr>
							<td>
								<!-- 상대경로로 바꾸세요. 브라우저에서는 보안상 사용자 PC의 경로에 바로 접근할 수 없습니다. (크롬브라우저에서 작동X -> 수정)-->
								<img src="./upload/${bean.image }" class="img-rounded" alt="${requestScope.bean.name}" width="200" height="200">
							</td>
						</tr>
					</table>
				</div>
				<div class="col-sm-8">
					<table class="table table-bordered">
						<tr style="background : #ffd700">
	          				<td>관계</td>
	          				<td>${requestScope.bean.relationship}</td>
	          			</tr>
	       				<tr style="background : #ffd700">
	       					<td>${requestScope.bean.classname}</td>
	       					<td>${requestScope.bean.stname}</td>
	       				</tr>
	       				<c:if test="${requestScope.bean.classname2 ne null}">
	        				<tr style="background : #ffd700">
	        					<td>${requestScope.bean.classname2}</td>
	        					<td>${requestScope.bean.stname2}</td>
	        				</tr>
	       				</c:if>
	       				<c:if test="${requestScope.bean.classname3 ne null}">
	       					<tr style="background : #ffd700">
	        					<td>${requestScope.bean.classname3}</td>
	        					<td>${requestScope.bean.stname3}</td>
	        				</tr>
	       				</c:if> 
						<tr>
							<td width="25%" align="center">아이디</td>
							<td width="75%" align="left">${requestScope.bean.pid}</td>
						</tr>
						<tr>
							<td width="25%" align="center">이름</td>
							<td width="75%" align="left">${requestScope.bean.name}</td>
						</tr>
						<tr>
							<td width="25%" align="center">생년월일</td>
							<td width="75%" align="left">${requestScope.bean.birth}</td>
						</tr>
						<tr>
							<td width="25%" align="center">성별</td>
							<td width="75%" align="left">${requestScope.bean.gender}</td>
						</tr>
						<tr>
							<td width="25%" align="center">이메일</td>
							<td width="75%" align="left">${requestScope.bean.email}</td>
						</tr>
						<tr>
							<td width="25%" align="center">휴대폰</td>
							<td width="75%" align="left">${requestScope.bean.hp}</td>
						</tr>
						<tr>
							<td width="25%" align="center">우편번호</td>
							<td width="75%" align="left">${requestScope.bean.zipcode}</td>
						</tr>
						<tr>
							<td width="25%" align="center">주소</td>
							<td width="75%" align="left">${requestScope.bean.address1}</td>
						</tr>
						<tr>
							<td width="25%" align="center">상세주소</td>
							<td width="75%" align="left">${requestScope.bean.address2}</td>
						</tr>
						<tr>
							<td width="25%" align="center">승인상태</td>
							<td width="75%" align="left">${requestScope.bean.submit}</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="col-sm-7" style="float:right;">
				<c:if test="${sessionScope.loginfo.responsibilities == '원장' || sessionScope.loginfo.responsibilities == '직원' }">
					<button class="btn btn-primary" onclick="location.href='location.href='<%=NoForm%>paSubmitUpdate&pid=${bean.pid}&page=detail'">
						가입 승인
					</button>
				</c:if>
				<button class="btn btn-info" onclick="location.href='<%=NoForm%>paUpdate&pid=${requestScope.bean.pid }'">
					정보 수정
				</button>
				<button class="btn btn-danger" onclick="location.href='<%=NoForm%>paDelete&pid=${requestScope.bean.pid }'">
					정보 삭제
				</button>
				<button class="btn btn-info" onclick="location.href='<%=NoForm%>paList'">
					돌아 가기
				</button>
			</div>
		</div>
	</div>
</body>
</html>