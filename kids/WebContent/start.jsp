<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String contextPath = request.getContextPath() ;
	String mappingName = "/Kids" ;
	
	String YesForm = contextPath + mappingName ;
	String NoForm = contextPath + mappingName + "?command=" ;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
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
        <link href="<%=request.getContextPath()%>/bootstrap2/css/styles.css" rel="stylesheet" />
       
        <!-- w3school 예제에서 가져옴 -->
       	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
  
    <body data-spy="scroll" data-target=".navbar" data-offset="50">
  
 		<!-- Navigation-->
		<nav class="navbar navbar-expand-sm navbar-dark fixed-top" style="background:white; position:flex; justify-content:space-between;">  
			<div>
				<img alt="로고" src="./images/아이하루 로고.png" width="75" height="50">
			</div>
			<div>
			  <ul class="navbar-nav" id="navtest">
			    <li class="nav-item">
			      <a class="nav-link" href="#section2">Section 2</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#section3">Section 3</a>
			    </li>
			    <li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			        Section 4
			      </a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="#section41">Link 1</a>
			        <a class="dropdown-item" href="#section42">Link 2</a>
			      </div>
			    </li>
			  </ul>
		  </div>
		</nav>
  
        <!-- Masthead-->
        <header class="masthead text-white text-center">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto"> <!-- 1차 범위 좁힘 -->
                    	<h1 class="mb-5">아이하루 어린이집</h1>
                    </div>
                    	
                    	
                    <div class="col-md-10 col-lg-8 col-xl-7 mx-auto"> <!-- 하위 요소들 가운데 정렬. 2차 범위 좁힘 -->
                            <div class="row text-center" style="width:100%">
                                <div class="col-12 col-md-8 mb-2 mb-md-0" style="width:30%;float:none; margin:0 auto">
									
									<!-- 탭 만들기 보호자/직원용 -->
									<div class="container">
									  <h2 style="text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;"><font color="#ffd700">환</font><font color="d61d4e">영</font><font color="2699fb">합</font><font color="32ad22">니</font><font color="9400ff">다</font></h2>
									  <br>
									  <!-- Nav pills -->
									  <ul class="nav nav-fill" role="tablist">
									    <li class="nav-item rounded-lg" style="background:#d61d4e; height:50px; padding:0.5rem; border: 5px solid #d61d4e;">
									      <a class="navbar-toggler active mx-auto" data-toggle="pill" href="#home" style="color:white; font-weight:bolder;">보호자</a>
									    </li>
									    <li class="nav-item rounded-lg " style="background:#2699fb; height:50px; padding:0.5rem; border: 5px solid #2699fb;">
									      <a class="navbar-toggler" data-toggle="pill" href="#menuemp" style="color:white; font-weight:bolder;">직원</a>
									    </li>
									  </ul>
									
										 <!-- Tab panes -->
										 <div class="tab-content">
										    <!-- 홈 : 보호자 -->
										    
										    <div id="home" class="container tab-pane active"><br>
										    	<form action="<%=YesForm%>" method="post">
										    		<div style="color:white; background:#d61d4e; padding:0; margin:0;" >
												     	<h3>보호자 로그인</h3>
												    </div>
												     <p>즐거운 하루 보내요^-^</p>
			       	
			       									<input type="hidden" name="command" value="paLogin">
				                                	<input class="form-control form-control-lg" type="text" id="pid" name="pid" placeholder="아이디를 입력하세요."/>
				                                	<br>
				                                	<input class="form-control form-control-lg" type="password" id="password" name="password" placeholder="비밀번호를 입력하세요." />
				                                	<br>
				                                	<button class="btn btn-block btn-lg btn-danger" type="submit">로그인</button>
				                                </form>	
				                                <span class="form-control-static err">${pErrmsg}</span>
			                                	<a style="color:#d61d4e; "href="/kids/parents/paInsert.jsp">회원가입</a>
			                                	&nbsp;
				                                <a class="text-white" onclick="window.open('./parents/paIdSearch.jsp','paidsearch','height=400, width=400, menubar=no, location=no, left=400, top=200');">아이디/</a>
				                                <a class="text-white" onclick="window.open('./parents/paPaSearch.jsp','papasearch','height=400, width=400, menubar=no, location=no, left=400, top=200');">비밀번호 찾기</a>
										    </div>
										    
										    <!-- 직원 -->
										  
										    <div id="menuemp" class="container tab-pane fade"><br>
										    	<form action="<%=YesForm%>" method="post">
												    <div style="color:white; background:#2699fb; padding:0; margin:0;">
												    	<h3>직원 로그인</h3>
												    </div>
												    <p>오늘도 아자아자 화이팅!</p>
												     
												     <input type="hidden" name="command" value="empLogin">  	
				                                	<input class="form-control form-control-lg" type="text" id="id" name="id" placeholder="아이디를 입력하세요." value="${id}"/>
				                                	<br>
				                                	<input class="form-control form-control-lg" type="password" id="password" name="password" placeholder="비밀번호를 입력하세요." />
				                                	<span class="form-control-static err">${errmsg}</span>
				                                	<br>
				                                	<button class="btn btn-block btn-lg btn-primary" type="submit">로그인</button>
				                                </form>	
				                                
			                                	<a style="color:#2699fb; " href="<%=NoForm%>empInsert">회원가입</a>
			                                	&nbsp;
				                                <a class="text-white" onclick="window.open('./employees/empIdSearch.jsp','empidsearch','height=400, width=400, menubar=no, location=no, left=400, top=200');">아이디/</a>
				                                <a class="text-white" onclick="window.open('./employees/empPaSearch.jsp','emppasearch','height=400, width=400, menubar=no, location=no, left=400, top=200');">비밀번호 찾기</a>
										    </div>
										    
										</div><!-- tab Pane 끝 -->
	                                </div><!-- 탭 만들기 container 끝 -->
                          	 </div>
                    	</div>
                	</div><!-- 하위요소들 가운데 정렬 끝 -->
                </div><!-- row 끝 -->
              </div><!-- header container 끝 -->
        </header>
        
        
        
        
        
        <!-- 참고로 잠시 둠 -->
        
        <div id="section1" class="container-fluid bg-success" style="padding-top:70px;padding-bottom:70px">
  <h1>Section 1</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
<div id="section2" class="container-fluid bg-warning" style="padding-top:70px;padding-bottom:70px">
  <h1>Section 2</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
<div id="section3" class="container-fluid bg-secondary" style="padding-top:70px;padding-bottom:70px">
  <h1>Section 3</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
<div id="section41" class="container-fluid bg-danger" style="padding-top:70px;padding-bottom:70px">
  <h1>Section 4 Submenu 1</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
<div id="section42" class="container-fluid bg-info" style="padding-top:70px;padding-bottom:70px">
  <h1>Section 4 Submenu 2</h1>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
</div>
        
        
        
        <!--  -->
        
        
        
        
        <section class="features-icons bg-light text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                            <div class="features-icons-icon d-flex"><i class="icon-screen-desktop m-auto text-primary"></i></div>
                            <h3>Fully Responsive</h3>
                            <p class="lead mb-0">This theme will look great on any device, no matter the size!</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                            <div class="features-icons-icon d-flex"><i class="icon-layers m-auto text-primary"></i></div>
                            <h3>Bootstrap 4 Ready</h3>
                            <p class="lead mb-0">Featuring the latest build of the new Bootstrap 4 framework!</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="features-icons-item mx-auto mb-0 mb-lg-3">
                            <div class="features-icons-icon d-flex"><i class="icon-check m-auto text-primary"></i></div>
                            <h3>Easy to Use</h3>
                            <p class="lead mb-0">Ready to use with your own content, or customize the source files!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        
        <!-- Image Showcases-->
        <section class="showcase">
            <div class="container-fluid p-0">
                <div class="row no-gutters">
                    <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('<%=request.getContextPath()%>/bootstrap2/assets/img/bg-showcase-1.jpg')"></div>
                    <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                        <h2>Fully Responsive Design</h2>
                        <p class="lead mb-0">When you use a theme created by Start Bootstrap, you know that the theme will look great on any device, whether it's a phone, tablet, or desktop the page will behave responsively!</p>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-lg-6 text-white showcase-img" style="background-image: url('<%=request.getContextPath()%>/bootstrap2/assets/img/bg-showcase-2.jpg')"></div>
                    <div class="col-lg-6 my-auto showcase-text">
                        <h2>Updated For Bootstrap 4</h2>
                        <p class="lead mb-0">Newly improved, and full of great utility classes, Bootstrap 4 is leading the way in mobile responsive web development! All of the themes on Start Bootstrap are now using Bootstrap 4!</p>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('<%=request.getContextPath()%>/bootstrap2/assets/img/bg-showcase-3.jpg')"></div>
                    <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                        <h2>Easy to Use & Customize</h2>
                        <p class="lead mb-0">Landing Page is just HTML and CSS with a splash of SCSS for users who demand some deeper customization options. Out of the box, just add your content and images, and your new landing page will be ready to go!</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonials-->
        <section class="testimonials text-center bg-light">
            <div class="container">
                <h2 class="mb-5">What people are saying...</h2>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="<%=request.getContextPath()%>/bootstrap2/assets/img/testimonials-1.jpg" alt="..." />
                            <h5>Margaret E.</h5>
                            <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="<%=request.getContextPath()%>/bootstrap2/assets/img/testimonials-2.jpg" alt="..." />
                            <h5>Fred S.</h5>
                            <p class="font-weight-light mb-0">"Bootstrap is amazing. I've been using it to create lots of super nice landing pages."</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="<%=request.getContextPath()%>/bootstrap2/assets/img/testimonials-3.jpg" alt="..." />
                            <h5>Sarah W.</h5>
                            <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to us!"</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Call to Action-->
        <section class="call-to-action text-white text-center">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto"><h2 class="mb-4">Ready to get started? Sign up now!</h2></div>
                    <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                        <form>
                            <div class="form-row">
                                <div class="col-12 col-md-9 mb-2 mb-md-0"><input class="form-control form-control-lg" type="email" placeholder="Enter your email..." /></div>
                                <div class="col-12 col-md-3"><button class="btn btn-block btn-lg btn-primary" type="submit">Sign up!</button></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
                        <ul class="list-inline mb-2">
                            <li class="list-inline-item"><a href="#!">About</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Contact</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Terms of Use</a></li>
                            <li class="list-inline-item">⋅</li>
                            <li class="list-inline-item"><a href="#!">Privacy Policy</a></li>
                        </ul>
                        <p class="text-muted small mb-4 mb-lg-0">© Your Website 2021. All Rights Reserved.</p>
                    </div>
                    <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
                        <ul class="list-inline mb-0">
                            <li class="list-inline-item mr-3">
                                <a href="#!"><i class="fab fa-facebook fa-2x fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item mr-3">
                                <a href="#!"><i class="fab fa-twitter-square fa-2x fa-fw"></i></a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#!"><i class="fab fa-instagram fa-2x fa-fw"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
 
        <!-- Bootstrap core JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<%=request.getContextPath()%>/bootstrap2/js/scripts.js"></script>
    </body>
</html>