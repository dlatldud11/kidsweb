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
        <link href="<%=request.getContextPath()%>/bootstrap2/css/styles.css?after" rel="stylesheet" />
       
        <!-- w3school 예제에서 가져옴 -->
       	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
			    html, body {width:100%;height:100%;margin:0;padding:0;} 
			    .map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
			    .radius_border{border:1px solid #919191;border-radius:5px;}     
			    .custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
			    .custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
			    .custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
			    .custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
			    .custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
			    .custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
			    .custom_typecontrol .selected_btn:hover {color:#fff;}   
			    .custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
			    .custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
			    .custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
			    .custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
			    </style>
	    </head>
  
    <body data-spy="scroll" data-target=".navbar" data-offset="50">

  
 		<!-- Navigation-->
		<nav class="navbar navbar-expand-sm navbar-dark fixed-top clear-fix d-flex justify-content-between" style="background:white; position:flex; justify-content:space-between;">  
			<div class="form-inline">
				<img alt="로고" src="./images/logo.png" width="50" height="50">
				&nbsp;
				<h6 style="margin-top: 0.3rem; margin-bottom: 0.5rem; font-weight: 700; line-height: 1.2;">아이하루 어린이집</h6>
			</div>
		</nav>
  
        <!-- Masthead-->
        <header class="masthead text-white text-center">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto"> <!-- 1차 범위 좁힘 -->
                   		<img alt="로고" src="./images/logo.png" width="100" height="100">
						 <h1 class="mb-5">아이하루 어린이집</h1>
                    </div>
                    	
                    	
                    <div class="col-md-10 col-lg-8 col-xl-7 mx-auto"> <!-- 하위 요소들 가운데 정렬. 2차 범위 좁힘 -->
                            <div class="row text-center" style="width:100%">
                                <div class="col-12 col-md-8 mb-2 mb-md-0 mx-auto" align="center" style="width:100%;float:none; margin:0 auto">
									
									<!-- 탭 만들기 보호자/직원용 -->
									<div class="container">
									  <!-- Nav pills -->
									  <ul class="nav nav-fill" role="tablist">
									    <li class="nav-item rounded-lg " style="width:25%; background:white; height:50px; padding:0.5rem; border: 1px solid #ffd700; background:#ffd700;">
									      <a class="navbar-toggler active mx-auto" data-toggle="pill" href="#home" style="color:white; font-weight:bolder; ">보호자</a>
									    </li>
									    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									    <li>
									    </li>
									    <li class="nav-item rounded-lg " style="width:25%; background:white; height:50px; padding:0.5rem; border: 1px solid #ffd700; background:#ffd700;">
									      <a class="navbar-toggler" data-toggle="pill" href="#menuemp" style="color:white;">직원</a>
									    </li>
									  </ul>
									
										 <!-- Tab panes -->
										 <div class="tab-content">
										    <!-- 홈 : 보호자 -->
										    
										    <div id="home" class="container tab-pane active"><br>
										    	<form action="<%=YesForm%>" method="post">
										    		<div>
												     	<h3>보호자 로그인</h3>
												    </div>
			       	
			       									<input type="hidden" name="command" value="paLogin">
				                                	<input class="form-control form-control-lg" type="text" id="pid" name="pid" placeholder="아이디를 입력하세요."/>
				                                	<br>
				                                	<input class="form-control form-control-lg" type="password" id="password" name="password" placeholder="비밀번호를 입력하세요." />
				                                	<br>
				                                	<button class="btn btn-block btn-lg btn-default" style="background:#ffd700;"type="submit">로그인</button>
				                                </form>	
			                                	<a style="color:#ffd700; "href="/kids/parents/paInsert.jsp">회원가입</a>
			                                	&nbsp;
				                                <a style="color:#ffd700;" class="text-white" onclick="window.open('./parents/paIdSearch.jsp','paidsearch','height=400, width=400, menubar=no, location=no, left=400, top=200');">아이디/</a>
				                                <a style="color:#ffd700;" class="text-white" onclick="window.open('./parents/paPaSearch.jsp','papasearch','height=400, width=400, menubar=no, location=no, left=400, top=200');">비밀번호 찾기</a>
				                                <br><span class="form-control-static err" style="color:#d61d4e;">${pErrmsg}</span>
										    </div>
										    
										    <!-- 직원 -->
										  
										    <div id="menuemp" class="container tab-pane fade"><br>
										    	<form action="<%=YesForm%>" method="post">
												    <div>
												    	<h3>직원 로그인</h3>
												    </div>
												     
												     <input type="hidden" name="command" value="empLogin">  	
				                                	<input class="form-control form-control-lg" type="text" id="id" name="id" placeholder="아이디를 입력하세요." value="${id}"/>
				                                	<br>
				                                	<input class="form-control form-control-lg" type="password" id="password" name="password" placeholder="비밀번호를 입력하세요." />
				                                	<br>
				                                	<button  style="background:#ffd700;" class="btn btn-block btn-lg btn-default" type="submit">로그인</button>
				                                </form>	
				                                
			                                	<a style="color:#ffd700;" href="<%=NoForm%>empInsert">회원가입</a>
			                                	&nbsp;
				                                <a class="text-white" onclick="window.open('./employees/empIdSearch.jsp','empidsearch','height=400, width=400, menubar=no, location=no, left=400, top=200');">아이디/</a>
				                                <a class="text-white" onclick="window.open('./employees/empPaSearch.jsp','emppasearch','height=400, width=400, menubar=no, location=no, left=400, top=200');">비밀번호 찾기</a>
				                                <br><span class="form-control-static err" >${errmsg}</span>
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
        
        
           <!-- Testimonials-->
        <section class="testimonials text-center bg-light">
            <div class="container">
                <h2 class="mb-5">유치원 식구들을 소개합니다</h2>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="<%=request.getContextPath()%>/bootstrap2/assets/img/teacherqueen.jpg" alt="..." />
                            <h5>이사장님</h5>
                            <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="<%=request.getContextPath()%>/bootstrap2/assets/img/teacherman.jpg" alt="..." />
                            <h5>원장님</h5>
                            <p class="font-weight-light mb-0">"Bootstrap is amazing. I've been using it to create lots of super nice landing pages."</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                            <img class="img-fluid rounded-circle mb-3" src="<%=request.getContextPath()%>/bootstrap2/assets/img/teacher4.jpg" alt="..." />
                            <h5>원장님</h5>
                            <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to us!"</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
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
                    <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('<%=request.getContextPath()%>/bootstrap2/assets/img/child.jpg')"></div>
                    <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                        <h2>Fully Responsive Design</h2>
                        <p class="lead mb-0">When you use a theme created by Start Bootstrap, you know that the theme will look great on any device, whether it's a phone, tablet, or desktop the page will behave responsively!</p>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-lg-6 text-white showcase-img" style="background-image: url('<%=request.getContextPath()%>/bootstrap2/assets/img/kindergarden4.jpg')"></div>
                    <div class="col-lg-6 my-auto showcase-text">
                        <h2>Updated For Bootstrap 4</h2>
                        <p class="lead mb-0">Newly improved, and full of great utility classes, Bootstrap 4 is leading the way in mobile responsive web development! All of the themes on Start Bootstrap are now using Bootstrap 4!</p>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('<%=request.getContextPath()%>/bootstrap2/assets/img/child2.jpg')"></div>
                    <div class="col-lg-6 order-lg-1 my-auto showcase-text">
                        <h2>Easy to Use & Customize</h2>
                        <p class="lead mb-0">Landing Page is just HTML and CSS with a splash of SCSS for users who demand some deeper customization options. Out of the box, just add your content and images, and your new landing page will be ready to go!</p>
                    </div>
                </div>
            </div>
        </section>
     
        <section class="testimonials text-center bg-light">
            <div class="container">
            	<h2 class="mb-3">오시는 길</h2>
            	<div class="offset-3">
	            	 <p class="font-weight-light mb-0 float-left"><font class="font-weight-bold" style="font-size:20px">주소 : </font> &nbsp;서울특별시 서초구 서초4동 강남대로 459&nbsp;&nbsp; </p> 
	           		 <p class="font-weight-light mb-3 float-left"><font class="font-weight-bold " style="font-size:20px">☎TEL : </font> &nbsp; 02-2298-2277</p>
           		  </div>
    			<div class="mx-auto col-lg-12" id="map" style="width:800px;height:600px;"></div>
		    </div>
		    
		    <div class="map_wrap">
			    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
			</div>
		    
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f916b3499c761c67ba93165b60cef596"></script>
			
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(37.50296156302804, 127.02428579999999),
					level: 3
				};
		
				var map = new kakao.maps.Map(container, options);
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(37.50296156302804, 127.02428579999999); 

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				var iwContent = '<div style="padding:5px;">아이하루 어린이집<br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,37.50296156302804, 127.02428579999999" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
				});
				  
				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker); 
			</script>
        </section>
        <!-- Call to Action-->
        <section class="call-to-action text-white text-center">
            <div class="overlay"></div>
            <div class="container">
            
                <div class="row">
                    <div class="col-xl-9 mx-auto"><h2 class="mb-4">상담문의</h2></div>
                    <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                        	
                        	<form action="<%=YesForm %>" method="post">
                        		<input type="hidden" name="command" value="resInsert">
	                        	<input class="form-control form-control-lg" name="name"type="text" placeholder="원아 이름을 입력하세요" />
	                        	<br>
	                        	<input class="form-control form-control-lg" type="text" name="hp" placeholder="휴대폰 번호를 입력하세요" />
	                        	<br>
	                        	<input class="form-control form-control-lg" type="date" name="resdate" placeholder="희망 상담일자를 입력하세요" />
	                        	<br>
	                        	<input class="form-control btn btn-default" type="submit" value="상담예약" style="background:#ffd700;"/>
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