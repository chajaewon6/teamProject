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
$(function(){
	$('#findBtn').click(function(){
    let cno=$(this).attr("value");
$.ajax({
		type:'post',
		url:'../trip/trip_recent.do',//post_result.do/dong/값
		data:{"cno":cno},
		success:function(result)
			{
				$('.print').html(result);
			}
		})
	})
})
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
    
     <!-- slider Area End-->
    <!--================Blog Area =================-->
    
    <section class="blog_area section-padding">
               
      <div class="container">
      		  <ul>
                <li><img src="home_img.JPG">&nbsp;&nbsp;&lt;&nbsp;&nbsp;여행지&nbsp;&nbsp;&lt;&nbsp;&nbsp;상세보기
                </li>
               </ul>
               <br>
               
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
               <!-- 찜하기  -->
               <%-- div class="text-right">
                 <c:if test="${sessionScope.id!=null }">
                  <c:if test="${count==0 }">
                  <a href="../jjim.do?no=${vo.no }" class="btn btn-sm btn-danger">찜하기</a>
                  </c:if>
                  <c:if test="${count!=0 }">
                  <span class="btn btn-sm btn-active">찜하기</span>
                  </c:if>
                 </c:if>
                 
                  <a href="../main/main.do" class="btn btn-sm btn-primary">목록</a>
               </div>       --%>
                           
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
                     <th width=20% class="text-right">교통정보 </th>
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
                  
                  <ul class="text-right">
                   <c:if test="${sessionScope.id!=null }">
   						<c:if test="${count==0 }">
                        <a href="../trip/jjim.do?no=${tvo.no }"><button class="ripple">찜하기</button></a>
                        </c:if>
                        <c:if test="${count!=0 }">
                        <span>찜완료 </span>
                        </c:if>
                     </c:if>
                  
               
                  	<a href="javascript:history.back();"><button class="ripple">목록</button></a>
                  	
                 </ul>             
                 
                 
                  <ul>
                  <button class="ripple" id="findBtn" value="${tvo.cno }">주변 관광지 더보기</button>
                  
                  </ul>
                  
                  <div class="print"></div>
                  
                  
               </div>  
            
               
            </div>
                    
   
                  <div class="col-lg-3">
                    <div class="blog_right_sidebar text-center">
                        
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">최근 방문 여행지</h3>
                            <table>
                            <c:forEach var="tvo" items="${fList }"  varStatus="s">
                            <tr>
                             <a href="../trip/detail_before.do?no=${tvo.no }">
                              <!-- div class="media post_item"> -->
                              <c:if test="${s.index<5 }">
                               <img src="${tvo.poster }" alt="post" style="width:160px;height:115px">
                               <%-- <h4>${tvo.title }</h4> --%>
                               <p style="font-size:10pt;margin:0px auto">${tvo.title }</p>
                               <br>
                               </c:if>
                              <!-- <div class="media-body">
                                <a href="single-blog.html"></a>
                              </div> -->  
                             </div>
                            </a>
                            </tr>
                            </c:forEach>
  							</table>
                        </aside>
                      
                      </div>
                </div>
                
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
</body>
</html>