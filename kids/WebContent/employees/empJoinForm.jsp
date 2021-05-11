<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath() ;
	String mappingName = "/Kids" ;
	
	String YesForm = contextPath + mappingName ;
	String NoForm = contextPath + mappingName + "?command=" ;
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Cards</title>

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
	
</head>
<body>
	<div class="row">
	<div class="container col-sm-3">
          <div class="card border-left-primary shadow h-60 py-3">
              <div class="card-body" style="width:50%;float:none; margin:0 auto">
                  <div class="row align-items-center	"><!-- 내부 내용 -->
                      <div class="col mr-2" >
                          <div class="text-xl font-weight-bold text-primary text-uppercase">
                             <h5><a href="<%=NoForm%>empInsert">직원 가입</a></h5></div>
                      </div>
                      <div class="col-align-center">
              			<a href="<%=NoForm%>empInsert">
                          <img style="width:100%; margin:0" src="<%=request.getContextPath()%>/images/teacher.jpg">
                      	</a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
	 <div class="container col-sm-3">
          <div class="card border-left-warning shadow h-60 py-3">
              <div class="card-body" style="width:50%;float:none; margin:0 auto">
                  <div class="row no-gutters align-items-center	"><!-- 내부 내용 -->
                      <div class="col mr-2" >
                          <div class="text-xs font-weight-bold text-primary text-uppercase">
                             <h5><a href="<%=NoForm%>paInsert">보호자 가입</a></h5></div>
                      </div>
                      <div class="col-auto">
                      	<a href="<%=NoForm%>paInsert">
                          <img style="width:100%; margin:0" src="<%=request.getContextPath()%>/images/parents.jpeg">
						</a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
   </div>
</body>
</html>