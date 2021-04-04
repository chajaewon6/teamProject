<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Travel HTML-5 Template </title>
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
                <div class="col-lg-8 mb-0 mb-lg-0">
                    <div class="blog_left_sidebar">
                    
                    
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="${vo.poster }" alt="">
                                <a class="blog_item_date">
           												
                            				<p>${vo.star }</p>
                                    
                        					
                                </a>
                            </div>

                            <div class="blog_details">
                                
                                    <h1 style="color:orange">${vo.title }</h1>
                                    <ul class="blog-info-link">
                                    <p class="dolor" style="color:green;font-size:20px">${vo.grade } <span style="color:gray">/ ${vo.price }</span></p>
                                </ul>
                                <strong style="font-size:15pt">간략 소개</strong>
                                <p>${vo.content }</p>
                                <ul>
                                        <!--  <li><i class="far fa-clock"></i>3 Days</li> -->
                                        <li style="color:gray;font-size:20px"></i>주소:${vo.addr }</li>
                                    </ul>
                                     <div id="map" style="width:100%;height:500px;"></div>
																	      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b5fd4dfaa14d2fbfdde362bc5e093417&libraries=services"></script>
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
																			geocoder.addressSearch("${vo.addr}", function(result, status) {
																			
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
																			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title}</div>'
																			        });
																			        infowindow.open(map, marker);
																			
																			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
																			        map.setCenter(coords);
																			    } 
																			});    
																			</script>   
                								</div>    
                            </div>
                        </article>     
                    </div>
   
                 <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">최근 방문 호텔</h3>
                            <c:forEach var="fvo" items="${fList }">
                            
                            <a href="../hotel/detail.do?no=${fvo.no }">
                            <div class="media post_item">
                                <img src="${fvo.poster }" alt="post" style="width:140px;height:115px">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>${fvo.title }</h3>
                                    </a>
                                    <p class="dolor" style="color:green">${fvo.grade } <span style="color:black">  ${fvo.price }</span></p>
                                </div>  
                            </div>
                            </a>
                            
                            </c:forEach>
  
                        </aside>
                        <aside class="single_sidebar_widget newsletter_widget">
                            <h4 class="widget_title">예약정보</h4>

                            <form action="#">
                                <div class="single-element-widget mt-30">
          <ul>
          <label for="checkin">체크인</label>
          <input type=date size="20" name="checkin"></ul>
          <ul>
           <label for="checkout">체크아웃</label>
          <input type=date size="20" name="checkout"></ul>
							<ul>
							<label for="adult">성인
							<div class="input-group-icon mt-10" name="adult" style="background-color:white">
								
								<div class="form-select" id="default-select">
											<select>
									<option value="1">1</option>
									<option value="1">2</option>
									<option value="1">3</option>
									<option value="1">4</option>
									<option value="1">5</option>
									<option value="1">6</option>
									<option value="1">7</option>
									<option value="1">8</option>
									<option value="1">9</option>
									</select>
								</div>
							</div>
							</label>
							<label for="kid">어린이
							<div class="input-group-icon mt-10" name="kid">
								
								<div class="form-select" id="default-select">
											<select>
									<option value="1">1</option>
									<option value="1">2</option>
									<option value="1">3</option>
									<option value="1">4</option>
									<option value="1">5</option>
									<option value="1">6</option>
									<option value="1">7</option>
									<option value="1">8</option>
									<option value="1">9</option>
									</select>
								</div>
							</div>
							</label>
							</ul>
							<label for="kid">방개수
							<div class="input-group-icon mt-20" name="kid">
								
								<div class="form-select" id="default-select">
											<select>
									<option value="1">1</option>
									<option value="1">2</option>
									<option value="1">3</option>
									<option value="1">4</option>
									<option value="1">5</option>
									<option value="1">6</option>
									<option value="1">7</option>
									<option value="1">8</option>
									<option value="1">9</option>
									</select>
								</div>
							</div>
							</label>
						</div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">예약하기</button>
                            </form>
                        </aside>
                      
                		</div>
                </div>
                
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
</body>
</html>