<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Travel HTML-5 Template </title>
    
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
   
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
    <!-- Place favicon.ico in the root directory -->
    
  </head>

<body>
    
    <!-- Preloader Start-->
   
  
     <!-- slider Area Start-->
     <!---
     <div class="slider-area ">
        
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="../img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>호텔 상세보기</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
     -->
     <!-- slider Area End-->
    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
      <div class="container">
        <div class="row">
        
          <div class="col-lg-9 mb-0 mb-lg-0 text-center">
            <strong style="font-size:20pt;color:orange"> ${tvo.category }</strong><br>
            <br>
              <strong style="font-size:30pt;height:80px">${tvo.title }</strong>
             	<div class="post-element" style="height:80px">
              <br>
              <br>
                  <span>${tvo.regdate }</span>
                </div>
                      
                    <div class="blog_left_sidebar">
                      <article class="blog_item">
                      <br>
                        <div class="blog_item_img">
                          <img class="img-rounded" src="${tvo.poster}" style="width:700px;height:500">
                            
                        </div>
					</div>		
                           
                    <div class="blog_details">
                      <!--  <ul class="blog-info-link">
                      //  <p class="dolor" style="color:green;font-size:20px">??? <span style="color:gray">/ ${vo.price }</span></p>
                      //</ul>
                       // <strong style="font-size:15pt">간략 소개</strong>-->
                        <p class="text-left">${tvo.content }</p>
                         <br>
                         <br>
                      <ul>
                        <!--  <li><i class="far fa-clock"></i>3 Days</li> -->
                        <!--<li style="color:gray;font-size:20px"></i>주소:${tvo.addr }</li>-->
                        <table class="table">
						  
						  <tr>
							<th width=20% class="text-right">주소</th>
							  <td width=80% class="text-left">${tvo.address }</td>
						  </tr>
						  <tr>
							<th width=20% class="text-right">교통정보</th>
							  <td width=80% class="text-left">${tvo.subwayinfo }</td>
						  </tr>
						 
                        </table>
                       </ul>
                                     
                    <div id="map" style="width:100%;height:300px;margin:0px auto"></div>
					  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f52532232d7ccc95a9e8fada5490dcb&libraries=services"></script>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
							center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							level: 3 // 지도의 확대 레벨
							};  
							
							// 지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer, mapOption); 
							
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();
																			
							// 주소로 좌표를 검색합니다
							geocoder.addressSearch("${tvo.address }", function(result, status) {
																			
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
																			
							var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
																			
							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
							map: map,
							position: coords
							});
							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow({
								content: '<div style="width:150px;text-align:center;padding:6px 0;">${tvo.title}</div>'
								});
							infowindow.open(map, marker);
																			
							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
								} 
							});    
						</script> 
					</div>    
                							
            </div>
                    
   
                  <div class="col-lg-3">
                    <div class="blog_right_sidebar">
                        
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">최근 검색 여행지</h3>
                            <c:forEach var="tvo" items="${LList }">
                            
                            <a href="../hotel/detail.do?no=${tvo.no }">
                            <div class="media post_item">
                                <img src="${tvo.poster }" alt="post" style="width:140px;height:115px">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>${tvo.title }</h3>
                                    </a>
                                    <p class="dolor" style="color:green">aa <span style="color:black"> </span></p>
                                </div>  
                            </div>
                            </a>
                            
                            </c:forEach>
  
                        </aside>
                		</div> 
                </div>
                
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
</body>
</html>