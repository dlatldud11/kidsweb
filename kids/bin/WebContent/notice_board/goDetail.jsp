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
				<h4>공지 사항</h4>
			</div>
			<div class="row panel-body">
				<div class="col-sm-4">
					<table>
						<tr>
							<td>
								<img src="${bean.files}" class="img-rounded" 
									alt="${bean.class_id}" width="200" height="200">		
							</td>
						</tr>
					</table>
				</div>
				<div class="col-sm-8">
					<table class="table table-bordered">
						<tr>
							<td width="25%" align="center">글 번호</td>
							<td width="75%" align="left">${bean.notino}</td>
						</tr>
						<tr>
							<td width="25%" align="center">제목</td>
							<td width="75%" align="left">${bean.title}</td>
						</tr>
						<tr>
							<td width="25%" align="center">아이디</td>
							<td width="75%" align="left">${bean.tid}</td>
						</tr>
						<tr>
							<td width="25%" align="center">글 내용</td>
							<td width="75%" align="left">${bean.content}</td>
						</tr>
						<tr>
							<td width="25%" align="center">조회수</td>
							<td width="75%" align="left">${bean.readhit}</td>
						</tr>
						<tr>
							<td width="25%" align="center">등록일자</td>
							<td width="75%" align="left">${bean.regdate}</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="col-sm-7" style="float:right;">
				<button class="btn btn-info" onclick="location.href='<%=NoForm%>goUpdate&notino=${bean.notino}'">
					글 수정
				</button>
				<button class="btn btn-danger" onclick="location.href='<%=NoForm%>goDelete&notino=${bean.notino}'">
					글 삭제
				</button>
			</div>
		</div>
	</div>
</body>
</html>