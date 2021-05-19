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
					<div class="col-sm-12">
						<table class="table table-bordered">
							<tr>
								<td width="10%" align="center">제목</td>
								<td width="90%" align="left">
									${bean.title}<p style="float:right;">글 번호 : ${bean.notino} &nbsp;&nbsp; 작성자 : ${bean.tid} &nbsp;&nbsp; 조회수 : ${bean.readhit}</p>
								</td>
							</tr>
							<tr>
								<td width="25%" align="center" colspan="2"><p style="float:left;">글 내용</p>
								<textarea class="form-control" readonly="readonly"style="float:left;width:100%;height:600px">${bean.content}</textarea></td>
								
							</tr>
							<tr>
								<td width="25%" align="center">등록일자</td>
								<td width="75%" align="left">${bean.regdate}</td>
							</tr>
						</table>
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