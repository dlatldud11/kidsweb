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
				<h4>식단 정보</h4>
			</div>
			<div class="row panel-body">
				<div class="col-sm-4">
					<table>
						<tr>
							<td>
								<img src="./upload/${bean.files}" class="img-rounded" 
									alt="${bean.category}" width="200" height="200">		
							</td>
						</tr>
					</table>
				</div>
				<div class="col-sm-8">
					<table class="table table-bordered">
						<tr>
							<td width="25%" align="center">등록 일자</td>
							<td width="75%" align="left">${bean.regdate}&nbsp;&nbsp;${bean.category}</td>
						</tr>
						<tr>
							<td width="25%" align="center" style="padding-top:9%;">식단 내용</td>
							<td width="75%" align="left">
							<textarea class="form-control" rows="5" cols="10" readonly="readonly">${bean.content}</textarea>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="col-sm-7" style="float:right;">
				<button class="btn btn-info" onclick="location.href='<%=NoForm%>dietList'">
					돌아 가기
				</button>
				<button class="btn btn-info" onclick="location.href='<%=NoForm%>dietUpdate&dietno=${bean.dietno}'">
					수정
				</button>
				<button class="btn btn-danger" onclick="location.href='<%=NoForm%>dietDelete&dietno=${bean.dietno}'">
					삭제
				</button>
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