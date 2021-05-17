<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath() ;
	String mappingName = "/Kids" ;
	
	String YesForm = contextPath + mappingName ;
	String NoForm = contextPath + mappingName + "?command=" ;
%>
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
      var url = '<%=NoForm%>paStSearch';
      window.open(url, 'stsearch', 'height=200, width=350');
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
      else if(document.writeForm.idcheck.value == false)
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
         var url = '<%=NoForm%>pidCheck&pid='+pid;
         window.open(url,"checkpid","width=450 height=150 left=800 top=200");
      }
   }
   
	function checkForm(){
		/*alert('호호호');*/
		var myform = document.myform;
		/* alert(myform); */
		var id = myform.id.value;
		if(!(id.length >=3 && id.length <=10)){
			alert('아이디는 4글자 이상 10글자 이어야 합니다');
			myform.id.select();
			return false;
		}
		/* 이름은 2글자 이상 30글자 이하이어야 합니다 */
		var name = myform.name.value;
		if(!(name.length >=2 && name.length <=30)){
			alert('이름은 2글자 이상 30글자 이하이어야 합니다');
			myform.name.focused;
			return false;
		}
		
		var password = myform.password.value;
		if(!(password.length >= 3 && password.length <= 8)){
			alert('비밀번호는 3글자 이상 8글자 이하이어야 합니다.');
			myform.password.select();
			return false;
		}
		
		var reg = /[a-z]{1}[a-z0-9@#$]{2,7}/;
		var result = reg.test(password);
		if(result == false){
			alert('1번째 글자는 반드시 알파벳 소문자가 와야 합니다.');
			myform.password.select();
			return false;
		}
		//특수 문자(@#$)가 들어 있으면 0 이상의 값을 반환해 줍니다.
		result = password.indexOf("@")>=0 ||
		 		password.indexOf("#")>=0 ||
				password.indexOf("$")>=0;
				
		if(result==false){
			alert('특수문자(@#$) 중에서 반드시 1개가 와야 합니다');
			myform.password.select();
			return false;
		}
		
		var salary = myform.salary.value;
		if(isNaN(salary)){
			alert('급여는 숫자 형식으로 입력해 주셔야 합니다');
			myform.salary.select();
			return false;
		}
		salary = Number(salary);
		if(!(salary >= 100 && salary<=1000)){
			alert('급여는 최소 100원 이상 1000원 이하로 입력해 주셔야 합니다.');
			myform.salary.select();
			return false;
		}
		
		var hiredate = myform.hiredate.value;
		var reg = /^\d{4}[\/-][01]\d[\/-][0123]\d$/;
		var result = reg.test(hiredate);
		if(result==false){
			alert('입사일자는 yyyy/mm/dd 또는 yyyy-mm-dd 형식으로 입력해주세요');
			myform.hiredate.select();
			return false;
		}
		
		/*arrgender은 성별 정보를 담고 있는 배열*/
		var arrgender = myform.gender;
//		alert(arrgender.length); //2
//		alert(arrgender[0].checked);
		var cnt = 0;//카운터 변수
		for(var i=0; i<arrgender.length; i++){
			if(arrgender[i].checked){
				cnt +=1;
			}
		}
		if(cnt == 0){
			alert('성별 체크가 누락되었습니다.');
			return false;
		}

		var arrhobby = myform.hobby;
//		alert(arrhobby.length); //4
		var cnt=0;
		for(var i=0; i<arrhobby.length; i++){
			if(arrhobby[i].checked){
				cnt += 1;
			}
		}
		if(!(cnt >=2 && cnt <=3)){
			alert('취미는 반드시 2개 이상, 3개 이하로 체크 되어야 합니다.');
			return false;
		}
		
		var job = myform.job.value;
		if(job == "-"){
			alert('직업을 선택해 주셔야 합니다.');
			return false;
		}

		return false;
	}
   
   
   function idcheckFalse(){
	   document.writeForm.idcheck.value=false;
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
//    function add_input(){
//       var writeForm = document.writeForm.getElementById("box");
//       // create element(input)
//       var input1 = document.createElement('input');
//       var input2 = document.createElement('input');
//       // set attribute(input)
//       input1.setAttribute("type", "number");
//       input1.setAttribute("name", "childid");
//       input2.setAttribute("type", "number");
//       input2.setAttribute("name", "childid2");
//       
//       writeForm.appendChild(input1);
//       writeForm.appendChild(input2);
//       
//       writeForm.submit;
//    }    

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
         <form action="<%=YesForm %>" name="writeForm" method="post" enctype="multipart/form-data">
         	<input type="text" name="idcheck" value="false">
            <input type="hidden" name="command" value="paInsert">
                <div class="form-group">
               <label for="pid" class="form-control-label col-sm-0">아이디</label>
               <div class="form-row">
                  <div class="col-">
                     <input type="text" class="form-control" id="pid" name="pid" onkeyup="idcheckFalse();">
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
                     <button class="btn btn-secondary" id ="addbtn" onclick="add_input();">추가</button>
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
               <button class="form-control btn btn-primary" onclick="javascript:checkWrite();">회원가입</button>
            </div>
         </form>
      </div>   
   </div>
   <br>
   <br>
</body>
</html>