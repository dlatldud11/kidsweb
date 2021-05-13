<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>	
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>유치원 회원가입</title>

	<link href="<%=request.getContextPath() %>/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath() %>/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	
	function stSearch(){
		alert('학생찾기');
		var pid = document.writeform.pid.value;
		var url = '<%=request.getContextPath()%>/kids?command=paStSearch';
		window.open(url, 'stsearch', 'height=150, width=300');
	}
	
	function checkWrite(){
		document.getElementById("piddiv").innerText="";
		document.getElementById("pwddiv").innerText="";
		document.getElementById("repwddiv").innerText="";
		//초기화과정을 거쳐야 제값들어갈떄 값 정상적으로 출력
		
		if(document.writeForm.pid.value=="")
		document.getElementById("piddiv").innerText="  아이디를 입력하세요";
		else if(document.writeForm.password.value=="")
		document.getElemnetById("pwddiv").innerText="  비밀번호를 입력하세요";
		else if(document.writeForm.repassword.value=="")
		document.getElementById("repwddiv").innerText="  비밀번호 확인을 입력하세요";
		else if(document.writeForm.password.value != document.writeform.repassword.value)
		document.getElementById("repwddiv").innerText="  비밀번호가 일치하지 않습니다";
		else if(document.writeForm.check.value =="")
		document.getElementById("piddiv").innerText= "  중복체크 하세요";
		else if(document.writeForm.pid.value != document.writeForm.idcheck.value)
		document.getElementById("piddiv").innerText= "  중복체크 하세요";
		
		else document.writeForm.submit();
	}
	
	function checkPid(){
		document.getElementById("piddiv").innerText="";
		var pid = document.writeForm.pid.value;
		
		if(pid==""){
			console.log('if문들어옴');
			document.getElementById("piddiv").innerText="  먼저 아이디를 입력하세요";
		} 
		else{
			console.log('else 들어옴');
			var url = '<%=request.getContextPath()%>/Kids?command=idCheck&pid='+pid;
			window.open(url,"checkPid","width=450 height=150 left=800 top=200");
		}
	}

	 function checkPost() {
		var width = 500; //팝업의 너비
		var height = 500; //팝업의 높이
			
	    new daum.Postcode({
			width : width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
	  		height : height,
		
	        oncomplete: function(data) {
	           var addr = ''; // 주소 변수
	           var extraAddr = ''; // 참고항목 변수

	           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	        
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('zipcode').value = data.zonecode;
	            document.getElementById("address1").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("address2").focus();
	        	}
			}
	    }).open({
			left: (window.screen.width / 2) - (width / 2),
			top: (window.screen.height / 2) - (height / 2)
	});  
 }
//	 function add_input(){
//		 var writeForm = document.writeForm.getElementById("box");
//		 // create element(input)
//		 var input1 = document.createElement('input');
//		 var input2 = document.createElement('input');
//		 // set attribute(input)
//		 input1.setAttribute("type", "number");
//		 input1.setAttribute("name", "childid");
//		 input2.setAttribute("type", "number");
//		 input2.setAttribute("name", "childid2");
//		 
//		 writeForm.appendChild(input1);
//		 writeForm.appendChild(input2);
//		 
//		 writeForm.submit;
//	 }	 

	function add_input(){
		document.getElementById('childadd').innerHTML +="<br><div class='form-row' id='deleteid'><div class='col-'>"
			+"<input type='text' name='childid' class='form-control' readonly></div><div class='col-'>"
			+"<input type='button' class='form-control btn btn-primary' value='학생 찾기' onclick='stSearch2();'>"
			+"</div><div class='col-'>"
			+"<button class='btn btn-secondary' onclick='add_input2();'>추가</button> </div> <div class='col-'>"
			+"<button class='btn btn-danger' onclick='delete_input();'>삭제</button> </div> </div>";
	}
	
	function add_input2(){
		document.getElementById('childadd').innerHTML +="<br><div class='form-row' id='deleteid2'><div class='col-'>"
			+"<input type='text' name='childid' class='form-control' readonly></div><div class='col-'>"
			+"<input type='button' class='form-control btn btn-primary' value='학생 찾기' onclick='stSearch3();'>"
			+"</div><div class='col-'>"
			+"<button class='btn btn-danger' onclick='delete_input2();'>삭제</button> </div> </div>";
	}
	
	function delete_input(){
		document.getElementById('deleteid').outerHTML = "";
	}
	
	function delete_input2(){
		document.getElementById('deleteid2').outerHTML = "";
	}
	
	
	</script>
	<style type="text/css">
		div#piddiv,div#pwddiv,div#repwddiv{
			color:red;
			font-size:10pt;
			font-weight:bold;
			padding-left:5px;
		}
	</style>
	
</head>
<body>
	<br>
	<div class="container">
		<!-- 회원가입 절차 표시 -->
	</div>
	<br>
	<div class="card card-primary offset-sm-3 col-sm-6" id="paInsert">
		<div class="card-body">
			<div class="card-title">
				<h1 align="center" align="center">회원가입</h1>
			</div>
			<form action="<%=request.getContextPath()+"/Kids" %>" name="writeForm" method="post">
				<input type="hidden" name="command" value="paInsert">
   				 <div class="form-group">
					<label for="pid" class="form-control-label col-sm-0">아이디</label>
					<div class="form-row">
						<div class="col-">
							<input type="text" class="form-control" id="pid" name="pid">
							<input type="hidden" name="idcheck" value="">
						</div>
						<div class="col-">
							<input type="button" class="form-control btn btn-primary" value="중복체크" onclick="checkPid();">
						</div>
					</div>
				</div>
				<div class="form-group" id="piddiv"></div>
				<div class="form-group">
					<label for="password" class="form-control-label col-sm-0">비밀번호</label>
					<div class="col-">
						<input type="password" class="form-control" id="password" name="password">
					</div>
				<div class="form-group" id="pwddiv"></div>
				</div>
				<div class="form-group">
					<label for="password" class="form-control-label col-sm-0">비밀번호 확인</label>
					<div class="col-">
						<input type="password" class="form-control" id="repassword" name="repassword">
					</div>
				</div>
				<div class="form-group" id="repwddiv"></div>
				
				<div class="form-group">
					<label for="name" class="form-control-label col-sm-0">이름</label>
					<div class="col-">
						<input type="text" class="form-control" id="name" name="name">
					</div>
				</div>
				<div class="form-group">
					<label for="birth" class="form-control-label col-sm-0">생년월일</label>
					<div class="col-">
						<input type="date" class="form-control" id="birth" name="birth">
					</div>
				</div>
				<div class="form-group">
					<label for="gender" class="form-control-label col-sm-0">성별</label>
						<div class="form-row">
							<div class="col-">
								<input type="radio" class="form-control" id="gender" name="gender" value="남">
								<label for="gender" class="form-control-label col-sm-0">&nbsp;남&nbsp;</label>
							</div>
							<div class="col-">
								<input type="radio" class="form-control" id="gender" name="gender" value="여">
								<label for="gender" class="form-control-label col-sm-0">&nbsp;여&nbsp;</label>
							</div>
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="form-control-label col-sm-0">이메일</label>
					<div class="form-row">
						<div class="col-5">
							<input type="text" class="form-control" id="email1" name="email"> 
						</div>
						<label for="email" class="form-control-label col-sm-0">&nbsp;@&nbsp;</label>
						<div class="col-5">
							<select class="form-control" name="email2" id="email2">
								<option value="-">---선택하세요
								<option value="naver.com">naver.com
								<option value="gmail.com">gmail.com
								<option value="daum.net">daum.net			
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="hp" class="form-control-label col-sm-0">휴대폰</label>
					<div class="col-">
						<input type="number" class="form-control" id="hp" name="hp">
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>
					</div>
				</div>
				<div class="form-group">
					<label for="image" class="form-control-label col-sm-0">사진</label>
					<div class="col-">
						<input type="file" class="form-control-file border" id="image" name="image">
					</div>
				</div>
				<div class="form-group">
					<label for="zipcode" class="form-control-label col-sm-0">우편번호</label>
					<div class="form-row">
						<div class="col-">
							<input type="text" class="form-control" id="zipcode" name="zipcode" readonly>
						</div>
						<div class="col-">
							<input type="button" class="form-control btn btn-primary" value="우편번호검색" onclick="checkPost()">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="address1" class="form-control-label col-sm-0">주소</label>
					<div class="col-">
						<input type="text" class="form-control" id="address1" name="address1" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="address2" class="form-control-label col-sm-0">상세주소</label>
					<div class="col-">
						<input type="text" class="form-control" id="address2" name="address2">
					</div>
				</div>
				<div class="form-group" id="childadd">
					<label for="sid" class="form-control-label col-sm-0">자녀등록</label>
					<div class="form-row">
						<div class="col-">
							<input type="text" class="form-control" id="sid" name="sid" readonly>
						</div>
						<div class="col-">
							<input type="button" class="form-control btn btn-primary" value="학생 찾기" onclick="stSearch();">
						</div>
						<div class="col-">
							<button class="btn btn-secondary" onclick="add_input();">추가</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="relationship" class="form-control-label col-sm-0">관계</label>
					<div class="form-row">
						<div class="col-1">
							<input type="radio" class="form-control" id="relationship" name="relationship" value="아버지">
						</div>
						<label for="relationship" class="form-control-label col-sm-0">&nbsp;아버지&nbsp;</label>
						<div class="col-1">
							<input type="radio" class="form-control" id="relationship" name="relationship" value="어머니">
						</div>
						<label for="relationship" class="form-control-label col-sm-0">&nbsp;어머니&nbsp;</label>
						<div class="col-1">
							<input type="radio" class="form-control" id="relationship" name="relationship" value="조부모">
						</div>
						<label for="relationship" class="form-control-label col-sm-0">&nbsp;조부모&nbsp;</label>
						<div class="col-1">
							<input type="radio" class="form-control" id="relationship" name="relationship" value="기타">
						</div>
						<label for="relationship" class="form-control-label col-sm-0">&nbsp;기타&nbsp;</label>	
					</div>
				</div>
				<br>
				<div class="form-group">
					<button class="form-control btn btn-primary" onclick="javascript:checkWrite()">회원가입</button>
				</div>
			</form>
		</div>	
	</div>
	<br>
	<br>
</body>
</html>