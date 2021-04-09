<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Travel HTML-5 Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
     <!--  <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico"> -->

      <!-- CSS here -->
            <link rel="stylesheet" href="../css/bootstrap.min.css">
            <link rel="stylesheet" href="../css/owl.carousel.min.css">
            <link rel="stylesheet" href="../css/flaticon.css">
            <link rel="stylesheet" href="../css/slicknav.css">
            <link rel="stylesheet" href="../css/animate.min.css">
            <link rel="stylesheet" href="../css/magnific-popup.css">
            <link rel="stylesheet" href="../css/fontawesome-all.min.css">
            <!-- <link rel="stylesheet" href="../css/themify-icons.css"> -->
            
            <link rel="stylesheet" href="../css/slick.css">
            <link rel="stylesheet" href="../css/nice-select.css">
            <link rel="stylesheet" href="../css/style.css">
            <!-- bootstrap -->
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script><script type="text/javascript"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript">
Shadowbox.init({
	players:["iframe"]
});
$(function(){
	$('#login').click(function(){
		Shadowbox.open({
			content:'../member/login.jsp',
			player:'iframe',
			title:'login',
			width:340,
			height:220
		})
	})
	$('#checkBtn').click(function(){
		Shadowbox.open({
			content:'../member/idcheck.jsp',
			player:'iframe',
			title:'아이디중복체크',
			width:340,
			height:200
		})
	})
	$('#postBtn').click(function(){
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode);
				$('#addr1').val(data.address);
			}
		}).open();
	})
	
});
</script>
   
   
   </head>

   <body>
    <!-- Preloader Start -->
     <!--<div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="../img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div> -->
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
       <div class="header-area">
            <div class="main-header ">
                <div class="header-top top-bg d-none d-lg-block">
                   <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="header-info-left">
                                <!-- <ul>                          
                                    <li>needhelp@gotrip.com</li>
                                    <li>666 569 025077</li>
                                    <li>broklyn street new york</li>
                                </ul> -->
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="header-info-right f-right">
                                <ul class="header-social"> 
                                <c:if test="${sessionScope.id==null }">   
                                    <li><a href="#" id="login">로그인</a></li>
                                 </c:if>
                                 <c:if test="${sessionScope.id!=null }">
                                	 <li style="color:white">${sessionScope.name}<!--(${sessionScope.admin=='y'?"관리자":"일반사용자" }) -->님 환영합니다!</li>                          
                                 </c:if> 
                                 <c:if test="${sessionScope.id!=null }">   
                                    <li><a href="../member/logout.do" id="logout" >로그아웃</a></li>
                                 </c:if>  
                                 <c:if test="${sessionScope.id==null }">       
                                    <li><a href="../member/join.do">회원가입</a></li>
                                </c:if>
                                </ul>
                            </div>
                        </div>
                       </div>
                   </div>
                </div>
               <div class="header-bottom  header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="../main/main.do"><img src="../img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-10">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>               
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="../main/main.do">Home</a></li>
                                            <li><a href="../trip/location.do">지역별 여행지</a>
                                            <ul class="submenu">
                                                    <li><a href="../trip/trip_list.do?cno=2">광화문</a></li>
                                                    <li><a href="../trip/trip_list.do?cno=3">명동</a></li>
                                                    <li><a href="../trip/trip_list.do?cno=4">동대문</a></li>
                                                    <li><a href="../trip/trip_list.do?cno=5">홍대</a></li>
                                                    <li><a href="../trip/trip_list.do?cno=6">여의도</a></li>
                                                    <li><a href="../trip/trip_list.do?cno=7">이태원</a></li>
                                                    <li><a href="../trip/trip_list.do?cno=8">강남</a></li>
                                                    <li><a href="../trip/trip_list.do?cno=9">잠실</a></li>
      										</ul>
                                            </li>
                                            <li><a href="#">커뮤니티</a>
                                             <ul class="submenu">
                                                    <li><a href="../board/board_main.do?">여행사진 공유</a></li>
                                                </ul>
                                            </li>
                                            <c:if test="${sessionScope.id==null }">   
                                            <li><a href="../hotel/list.do">호텔목록</a>
                                            </c:if>
                                            <c:if test="${sessionScope.id!=null }">   
                                            <li><a href="../hotel/reserve.do">호텔예약</a>
                                            </c:if>
                                            <ul class="submenu">
                                            
                                                    <li><a href="../hotel/list.do?cno=1">강남/역삼/삼성/신사/청담</a></li>
                                                    <li><a href="../hotel/list.do?cno=2">서초/교대</a></li>
                                                    <li><a href="../hotel/list.do?cno=3">잠실/송파/왕십리/강동</a></li>
                                                    <li><a href="../hotel/list.do?cno=4">을지로/시청/명동</a></li>
                                                    <li><a href="../hotel/list.do?cno=5">종로/인사동/동대문/강북</a></li>
                                                    <li><a href="../hotel/list.do?cno=6">서울역/이태원/용산</a></li>
                                                    <li><a href="../hotel/list.do?cno=7">마포/홍대/신촌/서대문</a></li>
                                                    <li><a href="../hotel/list.do?cno=8">영등포/여의도/김포공항</a></li>
                                                    <li><a href="../hotel/list.do?cno=9">구로/금천/관악/동작</a></li>
                                            
                                                </ul>
                                            </li>
                                        	<c:if test="${sessionScope.id!=null }">
                                        		<c:if test="${sessionScope.admin=='n' }">
                                            		<li><a href="../mypage/mypage.do">마이페이지</a></li>
                                            	</c:if>
                                            	<c:if test="${sessionScope.admin=='y' }">
                                            		<li><a href="../mypage/admin.do">관리자페이지</a></li>
                                            	</c:if>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
   <!-- 내용 들어가는 위치 -->
    <jsp:include page="${main_jsp }"></jsp:include>
 
    <!-- Footer Start-->
     <footer>
        <div class="footer-area footer-padding footer-bg" data-background="../img/service/footer_bg.jpg">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
                       <div class="single-footer-caption mb-50">
                         <div class="single-footer-caption mb-30">
                              <!-- logo -->
                             <div class="footer-logo">
                                 <a href="index.html"><img src="../img/logo/logo2_footer.png" alt=""></a>
                             </div>
                             <div class="footer-tittle">
                                 <p>
                                     서울 관광의 모든것, 
                                     지금 go trip에서 만나요
                                </p>
                             </div>
                         </div>
                       </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>서울명소</h4>
                                <ul>
                                    <li><a href="#">광화문</a></li>
                                    <li><a href="#">명동</a></li>
                                    <li><a href="#">동대문</a></li>
                                    <li><a href="#">홍대</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>호텔예약</h4>
                                <ul>
                                    <li><a href="#">강남/역삼/삼성</a></li>
                                    <li><a href="#">서초/교대</a></li>
                                    <li><a href="#">잠실/송파/왕십리</a></li>
                                    <li><a href="#">을지로/시청/명동</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>커뮤니티</h4>
                                <ul>
                                 <li><a href="../board/board_main.do">여행사진 공유</a></li>
                                 
                             </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer bottom -->
                <div class="row pt-padding">
                 <div class="col-xl-7 col-lg-7 col-md-7">
                    
                 </div>
                  <div class="col-xl-5 col-lg-5 col-md-5">
                        <!-- social -->
                        
                 </div>
             </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>

   <!-- JS here -->
   
      <!-- All JS Custom Plugins Link Here here -->
        <script src="./../js/vendor/modernizr-3.5.0.min.js"></script>
      
      <!-- Jquery, Popper, Bootstrap -->
      <script src="./../js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./../js/popper.min.js"></script>
        <script src="./../js/bootstrap.min.js"></script>
       <!-- Jquery Mobile Menu -->
        <script src="./../js/jquery.slicknav.min.js"></script>

      <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./../js/owl.carousel.min.js"></script>
        <script src="./../js/slick.min.js"></script>
      <!-- One Page, Animated-HeadLin -->
        <script src="./../js/wow.min.js"></script>
      <script src="./../js/animated.headline.js"></script>
        <script src="./../js/jquery.magnific-popup.js"></script>

      <!-- Scrollup, nice-select, sticky -->
        <script src="./../js/jquery.scrollUp.min.js"></script>
        <script src="./../js/jquery.nice-select.min.js"></script>
      <script src="./../js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="./../js/contact.js"></script>
        <script src="./../js/jquery.form.js"></script>
        <script src="./../js/jquery.validate.min.js"></script>
        <script src="./../js/mail-script.js"></script>
        <script src="./../js/jquery.ajaxchimp.min.js"></script>
        
      <!-- Jquery Plugins, main Jquery -->   
        <script src="./../js/plugins.js"></script>
        <script src="./../js/main.js"></script>
        
    </body>
</html>