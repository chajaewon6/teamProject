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
<meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
    <!-- Place favicon.ico in the root directory -->
    <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
<meta name="viewport" content="width=device-width"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="../css/comment.css">
 <link rel="stylesheet" href="../css/bootstrap.min.css">
            <link rel="stylesheet" href="../css/owl.carousel.min.css">
            <link rel="stylesheet" href="../css/flaticon.css">
            <link rel="stylesheet" href="../css/slicknav.css">
            <link rel="stylesheet" href="../css/animate.min.css">
            <link rel="stylesheet" href="../css/magnific-popup.css">
            <link rel="stylesheet" href="../css/fontawesome-all.min.css">
            <link rel="stylesheet" href="../css/themify-icons.css">
            <link rel="stylesheet" href="../css/slick.css">
            <link rel="stylesheet" href="../css/nice-select.css">
            <link rel="stylesheet" href="./css/button.css">
<style type="text/css">
.ripple {
  background-position: center;
  transition: background 0.8s;
}
.ripple:hover {
  background: #47a7f5 radial-gradient(circle, transparent 1%, #47a7f5 1%) center/15000%;
}
.ripple:active {
  background-color: #6eb9f7;
  background-size: 100%;
  transition: background 0s;
}

/* Button style */
button {
  border: none;
  border-radius: 2px;
  padding: 12px 18px;
  font-size: 16px;
  text-transform: uppercase;
  cursor: pointer;
  color: white;
  background-color: #2196f3;
  box-shadow: 0 0 4px #999;
  outline: none;
}
</style>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
$(function(){
	$('.delBtn').click(function(){
		let no=$(this).attr("data-no");
		let cno=$(this).attr("data-cno");
		location.href="../hotel/hotel_reply_delete.do?no="+no+"&cno="+cno;
	});
	$('.updateBtn').click(function(){
		$('.updateli').hide();
		$('.updateBtn').text("수정");
		let no=$(this).attr("data-no");
		if(i==0)
			{
				$(this).text("취소");
				$('#m'+no).show("slow");
				i=1;
			}
		else
			{
				$(this).text("수정");
				$('#m'+no).hide("slow");
				i=0;
			}
	});
});
</script>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
    <!-- Place favicon.ico in the root directory -->
    
  </head>

<body>
    
    <!-- Preloader Start-->
   
  
     
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
                                
                                    <h1 style="color:orange">${vo.title }
                                    
                                    </h1>
                                <ul class="blog-info-link">
                                    <p class="dolor" style="color:green;font-size:20px">${fn:substring(vo.grade,0,fn:indexOf(vo.grade,"(")) } <span style="color:gray">/ ${vo.price }</span></P>
                                    
                                </ul>
                                <strong style="font-size:15pt">간략 소개</strong>
                                <p>${vo.content }</p>
                               
                                <ul>
                                        <!--  <li><i class="far fa-clock"></i>3 Days</li> -->
                                        <li style="color:gray;font-size:20px"></i>주소:${vo.addr }</li>
                                    </ul>
                                     <div id="map" style="width:100%;height:500px;"></div>
																	      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f52532232d7ccc95a9e8fada5490dcb&libraries=services"></script>
																	      <ul>
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
																			</ul>
																		 <ul colspan="2" class="text-right">
                                 
													       	
													       		<c:if test="${sessionScope.id!=null }">
													       			<c:if test="${count==0 }">
													       				<a href="../hotel/jjim.do?no=${vo.no }" class="button -dark center" style="color:white" data-no="10">찜하기</a>
													       			</c:if>
													       			<c:if test="${count!=0 }">
													       				<button class="ripple">찜하기</button>
													       			</c:if>
													       		</c:if>
													       		
          
													       		<a href="../hotel/list.do"><button class="ripple">목록</button></a>
													       
													      </ul> 
                								</div>   
              						</article>
                            </div>
                     
                        
                        
                        
					 	 
          <div class="blog_left_sidebar">
          <div class="row">
          <!-- 댓글 쓰기 -->
         <!--  <h4>댓글 달기</h4><br> -->
          <div class="comments">
           <c:if test="${sessionScope.id!=null }"> 
           
		<div class="comment-wrap">
		<form action="../hotel/hotel_reply_insert.do" method=post>
				<div class="comment-block">
						<textarea name="msg" id="id" cols="100" rows="3" placeholder="Add comment..."></textarea>
						<input type="hidden" name=cno value="${vo.no }">
				</div>
				<div style="height:20px"></div>
				 <button class="ripple">댓글 등록</button>
			</form>
			</div>
			
		</c:if>
		<!-- 댓글 출력 -->
		<c:forEach var="rvo" items="${rList }">
		<div class="comment-wrap">
				<div class="comment-block">
						<p class="comment-text">${rvo.msg }</p>
						<p class="comment-text" style="font-size:10px;">작성자:&nbsp;${rvo.name }</p>
						<div class="bottom-comment">
								<div class="comment-date">${rvo.dbday }</div>
		 
								<!-- 수정, 삭제 -->
								<c:if test="${sessionScope.id==rvo.id }">
								<ul class="comment-actions">
									<li class="complain updateBtn" data-no="${rvo.no }">수정</li>
								    <li class="reply delBtn" data-no="${rvo.no }" data-cno="${vo.no }">삭제</li>
								</ul>
								
								
								
								<div class="comment-wrap updateli" style="display:none" id="m${rvo.no }">
								<form action="../hotel/hotel_reply_update.do" method="post">
								<div class="comment-block">
								<textarea name="msg" id="id" cols="50" rows="3" placeholder="${rvo.msg }"></textarea>
									<input type="hidden" name=cno value="${vo.no }">
                                  	<input type="hidden" name=no value="${rvo.no }">
									</div>
								<div style="height:10px"></div>
				 				<button type="submit" class="button -dark center">댓글 수정</button>
				 				</form>	
										</div>
								
								</c:if>
							</div>
						</div>
					</div>
					</c:forEach> 	
				</div>
			</div>
			</div>
		
			<!-- --------------------------댓글 영역 끝----------------------------- -->

      
	      						</div>  
	      						<div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">최근 방문 호텔</h3>
                            <c:forEach var="fvo" items="${fList }" varStatus="s">
                            <c:if test="${s.index<9 }">
                            <a href="../hotel/detail.do?no=${fvo.no }">
                            <div class="media post_item">
                                <img src="${fvo.poster }" alt="post" style="width:140px;height:115px">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>${fvo.title }</h3>
                                    </a>
                                    <p class="dolor" style="color:green">${fn:substring(fvo.grade,0,fn:indexOf(fvo.grade,"(")) } <ul><span style="color:black">  ${fvo.price }</span></ul></p>
                                </div>  
                            </div>
                            </a>
                            </c:if>
                            
                            </c:forEach>
  
                        </aside> 
                		</div>
                </div>  
	                </div>
                 <%-- <div class="col-lg-4">
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
                                    <p class="dolor" style="color:green">${fn:substring(fvo.grade,0,fn:indexOf(fvo.grade,"(")) } <ul><span style="color:black">  ${fvo.price }</span></ul></p>
                                </div>  
                            </div>
                            </a>
                            
                            </c:forEach>
  
                        </aside>
                        <aside class="single_sidebar_widget newsletter_widget">
                            <h4 class="widget_title">예약정보</h4>

                            <form action="../hotel/reserve.do">
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit"><a href="#">예약하기</a></button>
                            </form>
                        </aside>
                      
                		</div>
                </div> --%>
                
                
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
</body>
</html>