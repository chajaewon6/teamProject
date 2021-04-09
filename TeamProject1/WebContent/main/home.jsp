<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="../css/maincardstyle.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');
.mb-30{
      margin:0px auto;
}
#slides{
	height:200px;
}
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

.place-img{
   width:350px;
   height:250px;
   object-fit:cover;
} 

.gotrip aaa{
	font-family: 'Nanum Pen Script', cursive;
}
.adrgo{
	font-family: 'Sunflower', sans-serif;
}
.pearar{
	font-family: 'Sunflower', sans-serif;
}

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
.jg{
margin-top:5px;
font-family: 'Jeju Gothic', sans-serif;
font-size:25px;
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
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-9 col-lg-9 col-md-9">
                                <div class="hero__caption">
                                    <h1>Find <span>Next tour!</span> </h1>
                                    <div class="gotrip">
                                    	<p>여행을 떠나봐요!</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Search Box -->
                        <div class="row">
                            <div class="col-xl-12">
                                <!-- form -->
                                <form action="#" class="search-box">
                                    <div class="search-form mb-30 adrgo">
                             <a href="../main/search.do">어디로 떠나볼까요?</a>   
                                    </div> 
                                    <div style="height:100px"></div>     
                                </form>   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Favourite Places Start -->
        <%-- <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>서울엔 어떤 장소가 있을까?</span>
                            <h2>지역별 여행지</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                
                <!-- <a href="../trip/trip_list.do?cno=${vo.crink }"> 
                     <a href="../trip/detail_before.do?no=${tvo.no }"
                     
                     ../trip/trip_list.do?cno=${vo.crink }
                -->
  
                 <c:forEach var="vo" items="${mList }" varStatus="s"> 
                    <div class="col-xl-3 col-lg-3 col-md-6 text-center">
                        <div class="single-place mb-30" style="width:280px;height:370px">
                            <div class="place-img" style="width:280px;height:190px">
                                <a href="../trip/trip_list.do?cno=${vo.crink }"><img src="${vo.rink }" ></a>
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <!-- <span><i class="fas fa-star"></i><span></span> </span>  -->
                                    <h3><a href="../trip/trip_list.do?cno=${vo.crink }">${vo.img_name}</a></h3>
                                   
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                           <p class="dolor"> <span>${vo.content }</span></p>
                                    </ul>
                                </div> 
                            </div>
                        </div>      
                    </div>
                    </c:forEach>
                    </div> --%>
                    
                    
                    
<!-- partial:index.partial.html -->
<div id="hero-slides">
  <div id="header">
    <div id="logo"></div>
    <div id="menu">
      <div id="hamburger">
        <div class="slice"></div>
        <div class="slice"></div>
        <div class="slice"></div>
      </div>
    </div>
  </div>
  <div id="slides-cont">
    <div class="button" id="next"></div>
    <div class="button" id="prev"></div>
    <div id="slides">
      <div class="slide" style="background-image: url(https://cdn.asiacenews.com/news/photo/201509/782_686_3331.jpg)">
        <div class="number">01</div>
        <div class="body">
          <div class="location">Gwanghwamun</div>
          <div class="headline">광화문</div><a href="../trip/trip_list.do?cno=2" target="_blank">
            <div class="link">광화문 여행지 보기</div></a>
        </div>
      </div>
      <div class="slide" style="background-image: url(http://www.kbiznews.co.kr/news/photo/201808/47559_9641_4327.jpg)">
        <div class="number">02</div>
        <div class="body">
          <div class="location">Hongdae</div>
          <div class="headline">홍대</div><a href="../trip/trip_list.do?cno=5" target="_blank">
            <div class="link">홍대 여행지 보기</div></a>
        </div>
      </div>
      <div class="slide" style="background-image: url(https://post-phinf.pstatic.net/MjAxOTA2MDdfMjg1/MDAxNTU5OTAxNTI4OTI1.ksgdSBsru0xoE4gwdsiJDQs6CCk0Y6hxYPPRvs03TiUg.Ma8oLtZGxXU3krxr08K_QUOY4G5V27kHrM5YTYQM9yYg.JPEG/5b2be0be1ae6621e008b46a9-960-639.jpg?type=w1200)">
        <div class="number">03</div>
        <div class="body">
          <div class="location">Gangnam</div>
          <div class="headline">강남</div><a href="../trip/trip_list.do?cno=8" target="_blank">
            <div class="link">강남 여행지 보기</div></a>
        </div>
      </div>
      <div class="slide" style="background-image: url(https://dimg.donga.com/wps/ECONOMY/IMAGE/2017/12/21/87857896.3.jpg)">
        <div class="number">04</div>
        <div class="body">
          <div class="location">Jamsil</div>
          <div class="headline">잠실</div><a href="../trip/trip_list.do?cno=9" target="_blank">
            <div class="link">잠실 여행지 보기</div></a>
        </div>
      </div>
      <div class="slide" style="background-image: url(https://pds.joins.com/news/component/htmlphoto_mmdata/201910/27/5297f67b-6fcd-4fcd-8917-d318b81f9f99.jpg)">
        <div class="number">05</div>
        <div class="body">
          <div class="location">Dongdaemun</div>
          <div class="headline">동대문</div><a href="../trip/trip_list.do?cno=4" target="_blank">
            <div class="link">동대문 여행지 보기</div></a>
        </div>
      </div>
      <div class="slide" style="background-image: url(https://i.pinimg.com/originals/78/f1/82/78f182e6ee86865924f5a1f72ab8f1a6.jpg)">
        <div class="number">06</div>
        <div class="body">
          <div class="location">Itaewon</div>
          <div class="headline">여의도</div><a href="../trip/trip_list.do?cno=6" target="_blank">
            <div class="link">여의도 여행지 보기</div></a>
        </div>
      </div>
      <div class="slide" style="background-image: url(https://d1m8tzv6n1gicn.cloudfront.net/uploads/c3a94edfdeafbde34087a3cc486c913f.PNG)">
        <div class="number">07</div>
        <div class="body">
          <div class="location">Itaewon</div>
          <div class="headline">이태원</div><a href="../trip/trip_list.do?cno=7" target="_blank">
            <div class="link">이태원 여행지 보기</div></a>
        </div>
      </div>
      <div class="slide" style="background-image: url(https://t1.daumcdn.net/cfile/blog/2676364B53FA6AA30D)">
        <div class="number">08</div>
        <div class="body">
          <div class="location">Myeongdong</div>
          <div class="headline">명동</div><a href="../trip/trip_list.do?cno=3" target="_blank">
            <div class="link">명동 여행지 보기</div></a>
        </div>
      </div>
      
      
      
     
    </div>
    <div id="next-catch"></div>
    <div id="prev-catch"></div>
  </div>
  <div id="footer"><a href="https://dribbble.com/shots/3888265-Motion-Study" target="_blank">
      <div id="dribbble"></div></a></div>
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/6.26.0/polyfill.min.js'></script><script  src="../js/maincardscript.js"></script>

                    
                    
                    
                    <div class="favourite-place place-padding">
            <div class="container">
                    <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>서울엔 어떤 호텔이 있을까?</span>
                            <h2>지역별 호텔</h2>
                        </div>
                    </div>
                </div>
                    <div class="row">
                
                <!-- <a href="../trip/trip_list.do?cno=${vo.crink }"> 
                     <a href="../trip/detail_before.do?no=${tvo.no }"
                     
                     ../trip/trip_list.do?cno=${vo.crink }
                -->
  
                 <c:forEach var="hvo" items="${mList1 }"> 
                    <div class="col-xl-4 col-lg-4 col-md-6 text-center">
                    
                        <div class="single-place mb-30" style="width:380px;height:370px">
                            <div class="place-img" style="width:380px;height:190px">
                                <a href="../hotel/list.do?cno=${hvo.cno }"><img src="${hvo.poster }" ></a> 
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <!-- <span><i class="fas fa-star"></i><span></span> </span>  -->
                                    <h3 style="color:gray" class="jg">${hvo.category }</h3>
                                   
                                </div>
                                
                            </div>
                        </div> 
                    </div>
                    </c:forEach>
                    </div>
                    </div>
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
                            <p class="pera1 pearar">어디를 갈지 막막하다면 이 영상을 봐줘!</p>
                            <p class="pera2 pearar">당신이 서울에서 꼭 가봐야 할 </p>
                            <p class="pera3 pearar">장소 TOP 10</p>
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
                            <a href="../board/board_main.do">
                                <div class="blog-img">
                                    <img src="https://pds.joins.com/news/component/htmlphoto_mmdata/201406/29/htm_2014062922222430103011.jpg" alt="">
                                </div>
                                <div class="blog-cap">
                                    <p> |   동대문</p>
                                    <h3><a href="../board/board_detail.do?no=27">동대문의 FEEL을 느껴봐!( ๑˃̶ ꇴ ˂̶)♪⁺</a></h3>
                                    <a href="../board/board_detail.do?no=27" class="more-btn">더보기 »</a>
                                </div>
                            </a>
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
                            <a href="../board/board_main.do">
                                <div class="blog-img">
                                    <img src="https://youimg1.tripcdn.com/target/100v1f000001h1aeoCF7F_C_750_500.jpg?proc=source%2Ftrip" alt="">
                                </div>
                                <div class="blog-cap">
                                    <p> |   강남</p>
                                    <h3><a href="../board/board_detail.do?no=28">이것만 보면 나도 강남 마스터 (ง •̀ω•́)ง✧</a></h3>
                                    <a href="../board/board_detail.do?no=28" class="more-btn">더보기 »</a>
                                </div>
                            </a>
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