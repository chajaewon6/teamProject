<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/mypage.css">
<style type="text/css">

#trip-text{
	margin-bottom: 50px;
	font-size:25px;
}

.text{
	margin-top:20px;
}

.profile{
	width:100%;
	height:130px;
}

</style>
</head>
<body>
<main>
	
	<!-- 새로운 프로필 카드 -->
	
	<div class="container">

		<div class="profile">

			<div class="profile-image">

				<img src="https://images.unsplash.com/photo-1513721032312-6a18a42c8763?w=152&h=152&fit=crop&crop=faces" alt="">

			</div>

			<div class="profile-user-settings">

				<h1 class="profile-user-name">MYID</h1>

				<button class="btn profile-edit-btn">프로필 수정</button>

				<button class="btn profile-edit-btn">이미지 변경</button>

			</div>

			<div class="profile-stats">

				<ul>
					<li><span class="profile-stat-count">164</span> 관심 목록</li>
					<li><span class="profile-stat-count">188</span> 나의 여행 사진</li>
					<li><span class="profile-stat-count">206</span> 예매 목록</li>
				</ul>

			</div>

			<div class="profile-bio">

				<p><span class="profile-real-name">Jane Doe</span>자기소개글 출력📷✈️🏕️</p>

			</div>

		</div>
		<!-- End of profile section -->

        <!-- Favourite Places Start -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div id="trip-text">
                        	<h3>가고싶은 여행지✈️</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                    <c:forEach var="vo" items="${fList }" varStatus="s">
                        <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${vo.poster }">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>${vo.star }</span> </span>
                                    <h3><a href="#">${vo.title }</a></h3>
                                    <p class="dolor"><span>/ ${vo.price }</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <!-- <li><i class="far fa-clock"></i>3 Days</li> -->
                                        <li><i class="fas fa-map-marker-alt"></i>${vo.addr }</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                        </c:forEach>
                    </div>
                   </div>
                   
                   <div class="row">
                    <div class="col-lg-12">
                        <div id="trip-text">
                        	<h3>가고 싶은 호텔🌇</h3>
                        </div>
                    </div>
                </div>
                <div class="row mypage_row">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                        <c:forEach var="vo" items="${hList }" varStatus="s">
                            <div class="place-img">
                                <img src="${vo.poster }">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>${vo.star }</span> </span>
                                    <h3><a href="#">${vo.title }</a></h3>
                                    <p class="dolor">등급 <span>/ ${vo.price }</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="fas fa-map-marker-alt"></i>${vo.addr}</li>
                                        <li> <a href="../hotel/jjim_cancel.do?no=${hjList[s.index]}" class="btn btn-sm btn-primary">취소</a></li>
                                    </ul>
                                </div>
                            </div>
                              </c:forEach>
                        </div>
                    </div>
                   </div>
                   
                     
                    <div class="row">
                    <div class="col-lg-12">
                        <div id="trip-text">
                        	<h3>내가 올린 여행 사진📷</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="../img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
                                    <h3><a href="#">The Dark Forest Adventure</a></h3>
                                    <p class="dolor">$1870 <span>/ Per Person</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>3 Days</li>
                                        <li><i class="fas fa-map-marker-alt"></i>Los Angeles</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                   </div>
                   
                    <div class="row">
                    <div class="col-lg-12">
                        <div id="trip-text">
                        	<h3>내가 예매한 호텔🌃</h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                <c:forEach var="vo" items="${rList }">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="../img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>${vo.no }</span> </span>
                                    <h3><a href="#">${vo.title }</a></h3>
                                    <p class="dolor">가격 <span>${vo.inwon }</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>${vo.day }</li>
                                        <li><i class="fas fa-map-marker-alt"></i>${hvo.addr }</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                   </div>
                    
                </div>
            </div>
        </div>
        <!-- Favourite Places End -->

        <!-- Pagination-area Start -->
        <div class="pagination-area pb-100 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="single-wrap d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-start">
                                  <li class="page-item"><a class="page-link" href="#"><span class="flaticon-arrow roted left-arrow"></span></a></li>
                                    <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                                  <li class="page-item"><a class="page-link" href="#"><span class="flaticon-arrow right-arrow"></span></a></li>
                                </ul>
                              </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Pagination-area End -->
    </main>
        <!-- Footer End-->
   

<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="../js/vendor/modernizr-3.5.0.min.js"></script>
		
		<!-- Jquery, Popper, Bootstrap -->
		<script src="../js/vendor/jquery-1.12.4.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="../js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="../js/owl.carousel.min.js"></script>
        <script src="./../js/slick.min.js"></script>

		<!-- One Page, Animated-HeadLin -->
        <script src="../js/wow.min.js"></script>
		<script src="../js/animated.headline.js"></script>
		
		<!-- Scrollup, nice-select, sticky -->
        <script src="../js/jquery.scrollUp.min.js"></script>
        <script src="../js/jquery.nice-select.min.js"></script>
		<script src="../js/jquery.sticky.js"></script>
        <script src="../js/jquery.magnific-popup.js"></script>

        <!-- contact js -->
        <script src="../js/contact.js"></script>
        <script src="../js/jquery.form.js"></script>
        <script src="../js/jquery.validate.min.js"></script>
        <script src="../js/mail-script.js"></script>
        <script src="../js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="../js/plugins.js"></script>
        <script src="../js/main.js"></script>

</body>
</html>