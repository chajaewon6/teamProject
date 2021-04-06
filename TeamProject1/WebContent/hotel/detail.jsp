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
<style>
.intro{
position: absolute;
 left: 400px;
 top: 70px;
 }
 :root {
  --color-dark:  #014b85;;
  --color-ocean:  #416dea;
  --color-grass: #3dd28d;
  --color-snow: #FFFFFF;
  --color-salmon: #F32C52;
  --color-sun: #feee7d;
  --color-alge: #7999a9;
  --color-flower: #353866;
  --color-smoke: #e4e4e4;
  
  --borderRadius: 36px;

  --font-face: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
}

// button styles
.button {
  display: flex;
  overflow: hidden;

  margin: 10px;
  padding: 12px 12px;

  cursor: pointer;
  user-select: none;
  transition: all 150ms linear;
  text-align: center;
  white-space: nowrap;
  text-decoration: none !important;
  text-transform: none;
  text-transform: capitalize;

  color: #fff;
  border: 0 none;
  border-radius: var(--borderRadius);

  font-size: 5px;
  font-weight: 500;
  line-height: 1.3;

  -webkit-appearance: none;
  -moz-appearance:    none;
  appearance:         none;
 
  justify-content: center;
  align-items: center;
  flex: 0 0 160px;
  
  box-shadow: 2px 5px 10px var(--color-smoke);

  &:hover {
    transition: all 150ms linear;

    opacity: .85;
  }
  
  &:active {
    transition: all 150ms linear;
    opacity: .75;
  }
  
  &:focus {
    outline: 1px dotted #959595;
    outline-offset: -4px;
  }
}

.button.-regular {
  color: #202129;
  background-color: #f2f2f2;
  
  &:hover {
    color: #202129;
    background-color: #e1e2e2;
    opacity: 1;
  }
  
  &:active {
    background-color: #d5d6d6;
    opacity: 1;
  }
}

.button.-dark {
  color: var(--color-snow);
  background: var(--color-dark);
  
   &:focus {
    outline: 1px dotted white;
    outline-offset: -4px;
  }
}
  
.button.-green {
  color: var(--color-snow);
  background: var(--color-grass);
}

.button.-blue {
  color: var(--color-snow);
  background: var(--color-ocean);
}

.button.-salmon {
  color: var(--color-snow);
  background: var(--color-salmon);
}

.button.-sun {
  color: #f15c5c;
  background: var(--color-sun);
}

.button.-alge {
  color: #e7ff20;
  background: var(--color-alge);
}

.button.-flower {
  color: #FE8CDF;
  background: var(--color-flower);
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
																	      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b5fd4dfaa14d2fbfdde362bc5e093417&libraries=services"></script>
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
													       				<a href="../hotel/jjim.do?no=${vo.no }" class="btn btn-medium btn-primary" style="color:white">찜하기</a>
													       			</c:if>
													       			<c:if test="${count!=0 }">
													       				<span class="btn btn-medium btn-default">찜하기</span>
													       			</c:if>
													       		</c:if>
													       		<a href="../main/main.do" class="btn btn-medium btn-danger" style="color:white">목록</a>
													       
													      </ul> 
                								</div>   
              						</article> 
                            </div>
                     
                        
                        
                         <!-- 댓글 영역 -->
         
          <div class="row">
          <!-- 댓글 쓰기 -->
         <!--  <h4>댓글 달기</h4><br> -->
          <div class="comments">
           <c:if test="${sessionScope.id!=null }"> 
           
		<div class="comment-wrap">
		<form action="../hotel/hotel_reply_insert.do" method=post>
				<div class="comment-block">
						<textarea name="msg" id="id" cols="100" rows="3" placeholder="Add comment..."></textarea>
						<input type="hidden" name=cno value="${no }">
				</div>
				<div style="height:20px"></div>
				 <button class="button -dark center">댓글 등록</button>
			</form>
			</div>
			
		</c:if>
		<!-- 댓글 출력 -->
		 <c:forEach var="rvo" items="${rList }">
		<div class="comment-wrap">
				<div class="comment-block">
						<p class="comment-text">$${rvo.msg }</p>
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
                        
                        
                        
   								<%-- <div class="blog_left_sidebar">
   									<h2>댓글</h2>
							        <ul>
							        <c:forEach var="rvo" items="${rList }">
							          <li>
							            <article class="blog_item">
							            <div class="blog_details">
							            <table>
							              <header>
							                
							                <address style="font-size:30px">
							                By <a href="#" style="color:purple">${rvo.name }</a>
							               
							                </address>
							                
							                <time datetime="2045-04-06T08:15+00:00" style="color:gray">${rvo.dbday }</time>
							              </header>
							              <table>
							              <div class="comcont">
							                <pre style="white-space:pre-wrap;border:none;background-color:white;font-size:30px;color:gray">${rvo.msg }</pre>
							              	 <figure class="avatar text-right">
								                <c:if test="${sessionScope.id==rvo.id }">
									                <span class="btn btn-medium btn-success updateBtn" data-no="${rvo.no }">수정</span>
									                <span class="btn btn-medium btn-danger delBtn" data-no="${rvo.no }" data-cno="${vo.no }">삭제</span>
								                </c:if>
							                </figure>
							              </div>
							              </table>
							            </table>
							            </div>
							            </article>
							          </li>
							          <li style="display:none" id="m${rvo.no }" class="updateli">
							          <!-- 수정할폼 -->
							          
							          <form action="../hotel/hotel_reply_update.do" method="post">
							          <table class="table">
							          	<tr>
							          		<td>
							          			<textarea rows="7" cols="30" name="msg">${rvo.msg }</textarea>
							          			<input type="hidden" name=cno value="${vo.no }">
							          			<input type="hidden" name=no value="${rvo.no }">
							          			<input type="submit" value="댓글수정" class="btn btn-medium btn-danger">
							          		</td>
							          	</tr>
							          </table>
							        </form>
							        <form action="../hotel/hotel_reply_update.do" method="post">
                                
                                    <div class="form-group">
                                        <textarea class="form-control w-100" name="msg" cols="30" rows="9" placeholder=" Enter Message">${rvo.msg }</textarea>
                                    		<input type="hidden" name=cno value="${vo.no }">
                                    		<input type="hidden" name=no value="${rvo.no }">
							          								<div class="form-group mt-3">
                                					<input type="submit" class="button button-contactForm boxed-btn" value="댓글수정">
                            						</div>			
                                    </div>
                                
                        </form>
							          </li>
							          </c:forEach>
							        </ul>
							        
                        <form action="../hotel/hotel_reply_insert.do" method="post">
                            
                                    <div class="form-group" >
                                        <textarea class="form-control w-100" name="msg" cols="30" rows="9" placeholder=" Enter Message"></textarea>
                                    		<input type="hidden" name=cno value="${vo.no }">
							          								<div class="form-group mt-3">
                                					<input type="submit" class="button button-contactForm boxed-btn" value="댓글쓰기">
                            						</div>			
                                    </div>      
                        </form>
                     --%>
                    
							      <%--  <c:if test="${sessionScope.id!=null }">
							        <form action="../hotel/hotel_reply_insert.do" method="post">
							          <table class="table">
							          	<tr>
							          		<td>
							          			<textarea rows="7" cols="30" name="msg"></textarea>
							          			<input type="hidden" name=cno value="${vo.no }">
							          			<input type="submit" value="댓글쓰기" class="btn btn-sm btn-danger">
							          		</td>
							          	</tr>
							          </table>
							        </form>
							        </c:if>
							      
							      
							      
							      <h2>댓글</h2>
							        <ul>
							        <c:forEach var="rvo" items="${rList }">
							          <li>
							            <article>
							              <header>
							                <figure class="avatar">
								                <c:if test="${sessionScope.id==rvo.id }">
									                <span class="btn btn-xs btn-success updateBtn" data-no="${rvo.no }">수정</span>
									                <span class="btn btn-xs btn-danger delBtn" data-no="${rvo.no }" data-cno="${vo.no }">삭제</span>
								                </c:if>
							                </figure>
							                <address>
							                By <a href="#">${rvo.name }</a>
							                </address>
							                <time datetime="2045-04-06T08:15+00:00">${rvo.dbday }</time>
							              </header>
							              <div class="comcont">
							                <pre style="white-space:pre-wrap;border:none;background-color:white">${rvo.msg }</pre>
							              </div>
							            </article>
							          </li>
							          <li style="display:none" id="m${rvo.no }" class="updateli">
							          <form action="../hotel/hotel_reply_update.do" method="post">
							          <table class="table">
							          	<tr>
							          		<td>
							          			<textarea rows="7" cols="30" name="msg">${rvo.msg }</textarea>
							          			<input type="hidden" name=cno value="${vo.no }">
							          			<input type="hidden" name=no value="${rvo.no }">
							          			<input type="submit" value="댓글수정" class="btn btn-sm btn-danger">
							          		</td>
							          	</tr>
							          </table>
							        </form>
							          </li>
							          </c:forEach>
							        </ul>
							        <c:if test="${sessionScope.id!=null }">
							        <form action="../hotel/hotel_reply_insert.do" method="post">
							          <table class="table">
							          	<tr>
							          		<td>
							          			<textarea rows="7" cols="30" name="msg"></textarea>
							          			<input type="hidden" name=cno value="${vo.no }">
							          			<input type="submit" value="댓글쓰기" class="btn btn-sm btn-danger">
							          		</td>
							          	</tr>
							          </table>
							        </form>
							        </c:if>
      							</div>
      							--%>
      						</div>    
                </div>
    <%--<div class="form-group">
       <textarea class="form-control w-100" name="message" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder=" Enter Message"></textarea>
                                    </div> --%>
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
                                    <p class="dolor" style="color:green">${fn:substring(fvo.grade,0,fn:indexOf(fvo.grade,"(")) } <ul><span style="color:black">  ${fvo.price }</span></ul></p>
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
											<option value="1">0</option>
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