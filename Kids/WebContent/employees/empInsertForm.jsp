<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../start.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();	
	});
	</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="<%=NoForm%>" method="post">
		<!-- <input type="hidden" name="command" value="empInsert"> -->
		<div class="form-group">
			<div>
				<label class="control-label" for="id">아이디</label>
				<input type="text" class="form-control" id="id" placeholder="아이디를 입력해 주세요"
				name="id" data-toggle="tooltip" title="아이디는 4글자 이상 10글자 이하로 입력해 주세요."
				onkeyup="isCheclFalse();" value="${bean.id}">
			</div>
			<div>
				<input type="button" value="중복 체크" class="btn btn-info" onclick="idCheck();">
			</div>
		</div>
		<div class="form-group">
			<div>
				<label class="control-label" for="password">비밀번호</label>
				<input type="text" class="form-control" id="password" placeholder="비밀번호를 입력해 주세요."
				name="password" data-toggle="tooltip" title="비밀번호는 4글자 이상 12글자 이하로 입력해 주세요.">
			</div>
		</div>
		<div class="form-group">
			<div>
				<label class="control-label" for="name">이름</label>
				<input type="text" class="form-control" id="name" placeholder="이름을 입력해 주세요."
				name="name" data-toggle="tooltip" title="이름은 2글자 이상 10글자 이하로 입력해 주세요." value="${bean.name}">
			</div>
		</div>
		<div class="form-group">
			<div>
				<label class="control-label" for="birth">생일</label>
				<input type="date" class="form-control" id="birth" placeholder="생일을 입력해 주세요."
				name="birth" data-toggle="tooltip" title="생일은 yyyy/mm/dd형식으로 입력해 주세요." value="${bean.birth}">
			</div>
		</div>
		<div class="form-group">
			<div>
				<label class="control-label" for="hp">연락처</label>
				<input type="text" class="form-control" id="hp" placeholder="연락처 입력해 주세요."
				name="hp" data-toggle="tooltip" title="'-'없이 숫자만 입력해 주세요." value="${bean.hp}">
			</div>
		</div>
		<div class="form-group">
			<div>
				<label class="control-label" for="gender">성별</label>
				<div>
					<label class="radio-inline">
						<input type="radio" name="gender" id="gender" value="남">남자
					</label>
					&nbsp;&nbsp;&nbsp;
					<label class="radio-inline">
						<input type="radio" name="gender" id="gender" value="여">여자
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div>
				<label class="control-label" for="email">이메일</label>
				<input type="text" class="form-control" id="email" placeholder="이메일을 입력해 주세요."
				name="email" value="${bean.email}">
			</div>
		</div>
		<div class="form-group">
			<div>
				<label class="control-label" for="zipcode">우편 번호</label>
				<input type="text" class="form-control" id="fakezipcode" 
				disabled="disabled" name="fakezipcode">
				<input type="hidden" name="zipcode" id="zipcode">
			</div>
			<div>
				<input type="button" value="우편 번호 찾기" class="btn btn-info" onclick="zipfind();">
			</div>
		</div>
		<div class="form-group">
			<div>
				<label class="control-label" for="address1">주소</label>
				<input type="text" class="form-control" id="fakeaddress1" name="fakeaddress1" disabled="disabled">
				<input type="hidden" name="address1" id="address1"> 
			</div>
		</div>
		<div class="form-group">
			<div>
				<label class="control-label" for="address2">세부 주소</label>
				<input type="text" class="form-control" id="address2" name="address2">
			</div>
		</div>
		<div class="form-group">
		<div>
			<label class="control-label" for="class_id">학급명</label>
	        	<select class="form-control" id="class_id" name="class_id">
	        		<option value="-">--- 학급명을 선택해 주세요.</option>
				    <option value="1">해바라기</option>
				    <option value="2">민들레</option>
				    <option value="3">장미</option>
			  	</select>
	      	</div>
		</div>
		<div class="form-group">
			<div>
			<label class="control-label" for="subject_code">담당과목</label>
	        	<select class="form-control" id="subject_code" name="subject_code">
	        		<option value="-">--- 과목명을 선택해 주세요.</option>
				    <option value="1">체육</option>
				    <option value="2">미술</option>
				    <option value="3">코딩</option>
			  	</select>
	      	</div>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-default" onclick="return checkForm();">가입</button>
			&nbsp;&nbsp;&nbsp;
			<button type="reset" class="btn btn-default">다시 쓰기</button>
		</div>
	</form>
</body>
</html>