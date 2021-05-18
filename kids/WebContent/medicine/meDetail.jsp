<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function alertchecks(){
		alert("이미 확인하였습니다.");
	}
</script>
<body>
	<div class="container col-sm-offset-2 col-sm-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4>${bean.name} 투약의뢰서</h4>
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
							<td width="75%" align="left">${bean.regdate}</td>
						</tr>
						<tr>
							<td width="25%" align="center">약종류</td>
							<td width="75%" align="left">${bean.category}</td>
						</tr>
						<tr>
							<td width="25%" align="center">투약량</td>
							<td width="75%" align="left">${bean.amount}</td>
						</tr>
						<tr>
							<td width="25%" align="center">투약 횟수</td>
							<td width="75%" align="left">${bean.reps}</td>
						</tr>
						<tr>
							<td width="25%" align="center">투약 시간</td>
							<td width="75%" align="left">${bean.hour}</td>
						</tr>
						<tr>
							<td width="25%" align="center">보관방법</td>
							<td width="75%" align="left">${bean.storagemethod}</td>
						</tr>
						<tr>
							<td width="25%" align="center">비고</td>
							<td width="75%" align="left">${bean.textarea}</td>
						</tr>
						<tr>
							<td width="25%" align="center">확인 여부</td>
							<td width="75%" align="left">${bean.checks}</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="col-sm-7" style="float:right;">
				<button class="btn btn-info" onclick="location.href='<%=NoForm%>meList'">
					돌아 가기
				</button>
				<c:choose>
					<c:when test="${bean.checks != '안읽음' }">
						<button class="btn btn-info" onclick="alertchecks();">
						확인
						</button>
					</c:when>
					<c:when test="${bean.checks == '안읽음' }">
						<button class="btn btn-info" onclick="location.href='<%=NoForm%>meCheck&meno=${bean.meno}'">
						확인
						</button>
					</c:when>
				</c:choose>
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