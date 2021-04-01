<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main-image
{
   background-image: url("https://www.travelmap.co.kr/contents/files/board/news/2020/12/editor_3824_1608277874_1608278606.png");
   background-size:cover;
   background-repeat:no-repeat;
   height: 18%;
   width:100%;
   
}
.single-place{
	height:40%;
	width:100%;
	
}
/* .video-area{
	height:18%;
	width:50%;
	margin:0px auto;
	
} */
.place-img{
	width:350px;
	height:250px;
	object-fit:cover;
} 
</style>
</head>
<body>
<main>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
               <div class="main-image">
                <!-- <div class="single-slider hero-overly  slider-height d-flex align-items-center" data-background="../img/hero/h1_hero.jpg"> -->
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-9 col-lg-9 col-md-9">
                                <div class="hero__caption">
                                    <h1>Find <span>Next tour!</span> </h1>
                                    <p>여행을 떠나봐요!</p>
                                </div>
                            </div>
                        </div>
                        <!-- Search Box -->
                        <div class="row">
                            <div class="col-xl-12">
                                <!-- form -->
                                <form action="#" class="search-box">
                                    <div class="input-form mb-30">
                                        <input type="text" placeholder="어디로 떠나볼까요?">
                                    </div>
                                    
                                    <div class="search-form mb-30">
                                        <a href="#">찾기</a>
                                    </div>   
                                </form>   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Favourite Places Start -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>서울엔 어떤 장소가 있을까?</span>
                            <h2>지역별 관광지</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                
                <c:forEach var="vo" items="${mList }" varStatus="s">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${vo.rink }" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>8.0 Superb</span> </span>
                                    <h3><a href="#">${vo.img_name}</a></h3>
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
                    </c:forEach>
                    
                    
        <!-- Favourite Places End -->
        <!-- Video Start Arera -->
        <div class="video-area video-bg pt-100 pb-100"  data-background="https://t1.daumcdn.net/cfile/tistory/252FA9345225669928">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="video-caption text-center">
                            <!-- <div class="video-icon">
                                <a class="popup-video" href="https://www.youtube.com/watch?v=MbqfFFE8vXY" tabindex="0"><i class="fas fa-play"></i></a>
                            </div> -->
                            <div>
                            	<iframe width="500" height="300" src="https://www.youtube.com/embed/MbqfFFE8vXY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <p class="pera1">어디를 갈지 막막하다면 이 영상을 봐줘!</p>
                            <p class="pera2">당신이 서울에서 꼭 가봐야 할 </p>
                            <p class="pera3">장소 TOP 10</p>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    
        <!-- Blog Area Start -->
        <div class="home-blog-area section-padding2">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>지금 핫한 여행을 만나보세요!</span>
                            <h2>여행 사진 공유</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="home-blog-single mb-30">
                            <div class="blog-img-cap">
                                <div class="blog-img">
                                    <img src="https://lh3.googleusercontent.com/proxy/SvMxDztkW4MEZKtEf0H3BL83PH4Y0qNS656rFyxglMv5FNQp_HeLjli5Y9ln_rh18d5alBbcuATYBYwjAVXFQlFB2IVuk7YTe30TxA" alt="">
                                </div>
                                <div class="blog-cap">
                                    <p> |   동대문</p>
                                    <h3><a href="single-blog.html">동대문에 FEEL을 느껴봐!( ๑˃̶ ꇴ ˂̶)♪⁺</a></h3>
                                    <a href="#" class="more-btn">더보기 »</a>
                                </div>
                            </div>
                            <div class="blog-date text-center">
                                <span>24</span>
                                <p>Now</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="home-blog-single mb-30">
                            <div class="blog-img-cap">
                                <div class="blog-img">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb2EdOUXD-CvZlawC7APVNuzIzF4jIWsUQrQ&usqp=CAU" alt="">
                                </div>
                                <div class="blog-cap">
                                    <p> |   강남</p>
                                    <h3><a href="single-blog.html">이것만 보면 나도 강남 마스터 (ง •̀ω•́)ง✧</a></h3>
                                    <a href="#" class="more-btn">더보기 »</a>
                                </div>
                            </div>
                            <div class="blog-date text-center">
                                <span>24</span>
                                <p>Now</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog Area End -->
        
        <%-- <c:forEach var="cvo" items="${ckList }" varStatus="s">
         <c:if test="${s.index<9 }">
          <a href="../trip/trip_detail.do?no=${cvo.no }" style="width:100px;height:100px">
          <img src="${cvo.poster}" >
          </a>
         </c:if>
        </c:forEach> --%>

    </main>
</body>
</html>