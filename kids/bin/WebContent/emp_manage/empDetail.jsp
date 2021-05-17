<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container col-sm-offset-2 col-sm-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4>ㅇㅇㅇ 투약의뢰서</h4>
			</div>
			<div class="row panel-body">
				<div class="col-sm-4">
					<table>
						<tr>
							<td>
								<img src="<%=request.getContextPath()%>/images/teacher.jpg" class="img-rounded" 
									alt="${bean.name}" width="200" height="200">		
							</td>
						</tr>
					</table>
				</div>
				<div class="col-sm-8">
					<table class="table table-bordered">
						<tr>
							<td width="25%" align="center">등록 날짜</td>
							<td width="75%" align="left">${bean.name}</td>
						</tr>
						<tr>
							<td width="25%" align="center">약종류</td>
							<td width="75%" align="left">${bean.tid}</td>
						</tr>
						<tr>
							<td width="25%" align="center">투약량</td>
							<td width="75%" align="left">${bean.class_id}</td>
						</tr>
						<tr>
							<td width="25%" align="center">투약 횟수</td>
							<td width="75%" align="left">${bean.subject_code}</td>
						</tr>
						<tr>
							<td width="25%" align="center">투약 시간</td>
							<td width="75%" align="left">${bean.gender}</td>
						</tr>
						<tr>
							<td width="25%" align="center">보관방법</td>
							<td width="75%" align="left">${bean.birth}</td>
						</tr>
						<tr>
							<td width="25%" align="center">비고</td>
							<td width="75%" align="left">${bean.birth}</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="col-sm-7" style="float:right;">
				<button class="btn btn-info" onclick="location.href='<%=NoForm%>empList'">
					돌아 가기
				</button>
				<button class="btn btn-info" onclick="location.href='<%=NoForm%>empUpdate&tid=${bean.tid}'">
					확인
				</button>
				<%-- <button class="btn btn-danger" onclick="location.href='<%=NoForm%>empDelete&tid=${bean.tid}'">
					직원 정보 삭제
				</button> --%>
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