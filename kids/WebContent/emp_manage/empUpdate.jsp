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
	<form name="myform" action="<%=YesForm%>" method="post">
	<input type="hidden" name="command" value="empUpdate">
	<input type="hidden" name="isCheck" value="false">
		<table border="1">
			<tr>
				<td width="25%" align="center">이름</td>
				<td width="75%" align="left">
				<input type="text" name="fakename" id="fakename" value="${bean.name}" disabled="disabled">
				<input type="hidden" name="name" id="name" value="${bean.name}">
				</td>
			</tr>
			<tr>
				<td width="25%" align="center">아이디</td>
				<td width="75%" align="left">
				<input type="text" name="faketid" id="faketid" value="${bean.tid}" disabled="disabled">
				<input type="hidden" name="tid" id="tid" value="${bean.tid}">
				<input type="hidden" name="password" id="password" value="${bean.password}">
				</td>
			</tr>
			<tr>
				<td width="25%" align="center">담당 학급</td>
				<td width="75%" align="left">
					<select class="form-control" id="class_id" name="class_id">
		        		<option value="0" selected="selected">--- 학급명을 선택해 주세요.</option>
					    <option value="1">해바라기</option>
					    <option value="2">민들레</option>
					    <option value="3">장미</option>
				  	</select>
					<span class="text-danger">${errclass_id}</span>
				</td>
			</tr>
			<tr>
				<td width="25%" align="center">담당 과목</td>
				<td width="75%" align="left">
					<select class="form-control" id="subject_code" name="subject_code">
		        		<option value="0" selected="selected">--- 과목명을 선택해 주세요.</option>
					    <option value="1">체육</option>
					    <option value="2">미술</option>
					    <option value="3">코딩</option>
				  	</select>
					<span class="text-danger">${errsubject_code}</span>
				</td>
			</tr>
			<tr>
				<td width="25%" align="center">성별</td>
				<td width="75%" align="left">
				<input type="radio" name="gender" id="gender" value="남">남자
				<input type="radio" name="gender" id="gender" value="여">여자
				</td>
			</tr>
			<tr>
				<td width="25%" align="center">생년월일</td>
				<td width="75%" align="left">
				<input type="text" name="birth" id="birth" value="${bean.birth}"></td>
			</tr>
			<tr>
				<td width="25%" align="center">핸드폰 번호</td>
				<td width="75%" align="left">
				<input type="text" name="hp" id="hp" value="${bean.hp}"></td>
			</tr>
			<tr>
				<td width="25%" align="center">이메일</td>
				<td width="75%" align="left">
				<input type="text" name="email" id="email" value="${bean.email}"></td>
			</tr>
			<tr>
				<td width="25%" align="center">직급</td>
				<td width="75%" align="left">
					<select class="form-control" id="class_id" name="class_id">
		        		<option value="-">--- 직급을 선택해 주세요.</option>
					    <option value="직원" selected="selected">담임선생님</option>
					    <option value="특별">특별활동선생님</option>
				  	</select>
					<span class="text-danger">${errclass_id}</span>
				</td>
			</tr>
			<tr>
				<td width="25%" align="center">주소</td>
				<td width="75%" align="left">
				<input type="text" name="address1" id="address1" value="${bean.address1}"></td>
			</tr>
			<tr>
				<td width="25%" align="center">주소</td>
				<td width="75%" align="left">
				<input type="text" name="address2" id="address2" value="${bean.address2}"></td>
			</tr>
			<tr>
				<td width="25%" align="center">급여</td>
				<td width="75%" align="left">
				<input type="number" name="salary" id="salary" value="${bean.salary}"></td>
			</tr>
			<tr>
				<td width="25%" align="center">등록 날짜</td>
				<td width="75%" align="left">
				<input type="text" name="join_date" id="join_date" value="${bean.join_date}" disabled="disabled"></td>
			</tr>
			<tr>
				<td width="75%" align="left">
				<input type="hidden" class="form-control" id="fakezipcode" 
				disabled="disabled" name="fakezipcode">
				<input type="hidden" name="zipcode" id="zipcode" value="${bean.zipcode}">
				<span class="text-danger">${errzipcode}</span>
			</tr>
		</table>
		<hr>
		<div class="col-sm-7" style="float:right;">
			<button class="btn btn-info" onclick="location.href='<%=NoForm%>empDetail&tid=${bean.tid}&${requestScope.parameters}'">
				돌아 가기
			</button>
			&nbsp;
			<button type="submit" class="btn btn-info">
				직원 정보 수정
			</button>
		</div>
	</form>
</body>
</html>