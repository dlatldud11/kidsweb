<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>   
<!DOCTYPE><html><head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>아이하루 어린이집</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/bootstrap2/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"></script>
        <!-- Simple line icons-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%=request.getContextPath()%>/bootstrap2/css/styles.css?after" rel="stylesheet" />
       
        <!-- w3school 예제에서 가져옴 -->
       	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body> 	
<%
	String imsi = request.getContextPath() + "/Kids?command=" ; 	
	//response.sendRedirect( imsi ) ;
%>
	<a href="<%=imsi%>hello">헬로우</a>
	<br><br><br>
	<a href="<%=imsi%>world">월드</a>
	안녕하세요 0514 aa
	0517 시영 내용 추가 시영내용추가 
	<!--  <div class="col mr-2">
                           <div class="container">
                           <ul class="nav nav-pills">
						  <li class="active"><a href="#nobean" class="btn btn-light btn-icon-split btn-sm">
						  <span class="text-md font-weight-bold text-primary">공지사항</span></a></li>
						  
					   	  <li><a href="#home" class="btn btn-light btn-icon-split btn-sm">
						  <span class="text-md font-weight-bold text-primary">&nbsp;알림장</span></a></li>
						  
					      <li><a href="#" class="btn btn-light btn-icon-split btn-sm">
						  <span class="text-md font-weight-bold text-primary">&nbsp;특별활동</span></a></li>
						  </ul>
						  <div class="tab-content">
                             <div class="text-md font-weight-bold text-primary text-uppercase mb-1">
                                  Today Issue</div>
                               <div class="h5 mb-0 font-weight-bold text-gray-800">
                               <div id="nobean" class="container tab-pane active">
                               공지사항
                               </div>
                               
                               <div id="home" class="container tab-pane active">
                               테스트
                               </div>
                               </div>tab
                               </div>container 끝  -->
                               <div class="container">
									  <!-- Nav pills -->
									  <ul class="nav nav-fill" role="tablist">
									    <li class="nav-item rounded-lg">
									      <a class="navbar-toggler active mx-auto" data-toggle="pill" href="#home">보호자</a>
									    </li>
									    <li class="nav-item rounded-lg ">
									      <a class="navbar-toggler" data-toggle="pill" href="#menuemp">직원</a>
									    </li>
									  </ul>
										 <!-- Tab panes -->
										 <div class="tab-content">
										    <!-- 홈 : 보호자 -->
										    <div id="home" class="container tab-pane active"><br>
										    		<div  >
										    		dkdkdk
												    </div>
										    </div>
										    <!-- 직원 -->
										    <div id="menuemp" class="container tab-pane fade"><br>
										    		<div >
										    		ddd
												    </div>
										    </div>
										</div><!-- tab Pane 끝 -->
	                                </div><!-- 탭 만들기 container 끝 -->
</body>
</html>