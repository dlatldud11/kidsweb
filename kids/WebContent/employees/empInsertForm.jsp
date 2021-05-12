<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath() ;
	String mappingName = "/Kids" ;
	
	String YesForm = contextPath + mappingName ;
	String NoForm = contextPath + mappingName + "?command=" ;
%>
<%
	int twelve = 12;
%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath()%>/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath()%>/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
	
	 <script src="<%=request.getContextPath()%>/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath()%>/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath()%>/bootstrap/js/sb-admin-2.min.js"></script>
	
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	function Checkid(){
		var tid = document.myform.tid.value;
		if(tid.length < 4){
		alert('아이디는 최소 4자리 이상이어야 합니다.');
		document.myform.tid.focus();
		return false;
		}
		var url = '<%=NoForm%>idCheck&id=' + tid;
		window.open(url, 'mywin', 'height=150,width=300');
	}
	function isCheckFalse(){
		document.myform.isCheck.value = false ;
	}
	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();	
	});
	</script>
</head>
<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원 가입</h1>
                            </div>
                            <form class="user" name="myform" action="<%=YesForm%>" method="post">
                            <input type="hidden" name="command" value="empInsert">
                            <input type="hidden" name="isCheck" value="false">
                                <div class="form-group row">
                                    <div class="col-sm-9">
										<input type="text" class="form-control align-self-auto" id="tid" placeholder="아이디를 입력해 주세요"
										name="tid" data-toggle="tooltip" title="아이디는 4글자 이상 10글자 이하로 입력해 주세요."
										onkeyup="isCheckFalse();" value="${bean.tid}">
										<span class="text-danger">${errtid}</span>
									</div>
									<div class="col-sm-3">
										<input type="button" value="중복 체크" class="btn btn-info align-self-center" onclick="Checkid();">
									</div>
                                </div>
                                <div class="form-group">
                                	<div class="row">
	                                 	<div class="col-sm-<%=twelve%>">
											<input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해 주세요."
											name="password" data-toggle="tooltip" title="비밀번호는 4글자 이상 12글자 이하로 입력해 주세요.">
											<span class="text-danger">${errpassword}</span>
	                                	</div>
                                	</div>
                                </div>
                                <div class="form-group">
                                	<div class="row">
	                                    <div class="col-sm-<%=twelve%>">
											<input type="text" class="form-control" id="name" placeholder="이름을 입력해 주세요."
											name="name" data-toggle="tooltip" title="이름은 2글자 이상 10글자 이하로 입력해 주세요." value="${bean.name}">
											<span class="text-danger">${errname}</span>
										</div>
									</div>
                                </div>
                                 <div class="form-group">
                                	<div class="row">
	                                    <div class="col-sm-<%=twelve%>">
											<input type="date" class="form-control" id="birth" placeholder="생일을 입력해 주세요."
											name="birth" data-toggle="tooltip" title="생일은 yyyy/mm/dd형식으로 입력해 주세요." value="${bean.birth}">
											<span class="text-danger">${errbirth}</span>
										</div>
									</div>
                                </div>
                                 <div class="form-group">
                                	<div class="row">
	                                    <div class="col-sm-<%=twelve%>">
											<input type="text" class="form-control" id="hp" placeholder="연락처를 입력해 주세요."
											name="hp" data-toggle="tooltip" title="'-'없이 숫자만 10~11자리 입력해 주세요." value="${bean.hp}">
											<span class="text-danger">${errhp}</span>
										</div>
									</div>
                                </div>
                                 <div class="form-group">
										<div>
											<label class="radio-inline align-self-center">
												<input type="radio" name="gender" id="gender" value="남">남자
											</label>
											&nbsp;&nbsp;&nbsp;
											<label class="radio-inline align-self-center">
												<input type="radio" name="gender" id="gender" value="여">여자
											</label>
											<span class="text-danger">${errgender}</span>
										</div>
	                                </div>
                                <div class="form-group">
                                	<div class="row">
	                                    <div class="col-sm-<%=twelve%>">
											<input type="text" class="form-control" id="email" placeholder="이메일을 입력해 주세요."
											name="email" value="${bean.email}">
											<span class="text-danger">${erremail}</span>
										</div>
									</div>
                                </div>
                                 <div class="form-group row">
                               		 <div class="col-sm-8">
										<input type="text" class="form-control" id="fakezipcode" 
										disabled="disabled" name="fakezipcode">
										<input type="text" name="zipcode" id="zipcode">
										<span class="text-danger">${errzipcode}</span>
									</div>
									<div class="col-sm-4">
										<input type="button" value="우편 번호 찾기" class="btn btn-info" onclick="zipfind();">
									</div>
                                </div>
                                 <div class="form-group">
                                	<div class="row">
	                                    <div class="col-sm-<%=twelve%>">
											<input type="text" class="form-control" id="fakeaddress1" name="fakeaddress1" disabled="disabled">
											<input type="text" name="address1" id="address1"> 
											<span class="text-danger">${erraddress1}</span>
										</div>
									</div>
                                </div>
                                 <div class="form-group">
                                	<div class="row">
	                                    <div class="col-sm-<%=twelve%>">
											<input type="text" class="form-control" id="address2" name="address2" placeholder="세부주소를 입력해 주세요.">
											<span class="text-danger">${erraddress2}</span>
										</div>
									</div>
                                </div>
                                <div class="form-group">
                                	<div class="row">
	                                    <div class="col-sm-<%=twelve%>">
											<select class="form-control" id="class_id" name="class_id">
								        		<option value="0" selected="selected">--- 학급명을 선택해 주세요.</option>
											    <option value="1">해바라기</option>
											    <option value="2">민들레</option>
											    <option value="3">장미</option>
										  	</select>
											<span class="text-danger">${errclass_id}</span>
										</div>
									</div>
                                </div>
                                <div class="form-group">
                                	<div class="row">
	                                    <div class="col-sm-<%=twelve%>">
											<select class="form-control" id="subject_code" name="subject_code">
								        		<option value="0" selected="selected">--- 과목명을 선택해 주세요.</option>
											    <option value="1">체육</option>
											    <option value="2">미술</option>
											    <option value="3">코딩</option>
										  	</select>
											<span class="text-danger">${errsubject_code}</span>
										</div>
									</div>
                                </div>
                                <div class="form-group">
                                	<div class="row" style="float:right;">
	                                    <div class="col-sm-<%=twelve%>">
											<button type="submit" class="btn btn-info">가입</button>
											&nbsp;&nbsp;&nbsp;
											<button type="reset" class="btn btn-info">다시 쓰기</button>
										</div>
									</div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>