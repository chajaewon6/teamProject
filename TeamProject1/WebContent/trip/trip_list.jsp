<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Travel HTML-5 Template </title>
        <style type="text/css">
        .form-row tm-search-form-row{
        margin-top: 400px;
        }
        @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		.jg{
		font-family: 'Jeju Gothic', sans-serif;
		font-size:18px;
		font-weight:bold;
		}
		#title{
        	
        	text-shadow: 2px 2px 2px gray;
        }
        </style>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
      <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico">
  
   </head>

   <body>
    <main>
        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="서울도심.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2 id="title">지역별 여행지</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!-- Favourite Places Start -->
        <div class="favourite-place">
            <div class="container">
            <br>
            <br>
            <br>
               <ul>
                <li><img src="home_img.JPG">&nbsp;&nbsp;&lt;&nbsp;&nbsp;지역&nbsp;&nbsp;&lt;
                   <c:if test="${cno == 2}">
     						 &nbsp;&nbsp;광화문</c:if>
     			   <c:if test="${cno == 3}">
     						 &nbsp;&nbsp;명동</c:if> 
     			   <c:if test="${cno == 4}">
     						 &nbsp;&nbsp;동대문</c:if> 
     				<c:if test="${cno == 5}">
     						 &nbsp;&nbsp;홍대</c:if> 
     				<c:if test="${cno == 6}">
     						 &nbsp;&nbsp;여의도</c:if> 
     				<c:if test="${cno == 7}">
     						 &nbsp;&nbsp;이태원</c:if> 
     				<c:if test="${cno == 8}">
     						 &nbsp;&nbsp;강남</c:if> 
     				<c:if test="${cno == 9}">
     						 &nbsp;&nbsp;잠실</c:if>
                </li>
                
               </ul>
                <!-- Section Tittle -->
                
                 <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                           <c:if test="${cno == 2}">
                             <span>역사의 도시</span>
     						 <h2>광화문</h2></c:if> 
                          <c:if test="${cno == 3}">
                            <span>쇼핑의 메카</span>
     						 <h2>명동</h2></c:if> 
     					  <c:if test="${cno == 4}">
     					   <span>쇼핑과 예술로 밤을 지새우는 열정의 거리</span>
     						 <h2>동대문</h2></c:if> 
     					  <c:if test="${cno == 5}">
     					   <span>젊음의 열기가 가득한</span>
     						 <h2>홍대</h2></c:if> 
     					  <c:if test="${cno == 6}">
     					   <span>봄바람 휘날리며~ 흩날리는 벚꽃잎이~</span>
     						 <h2>여의도</h2></c:if> 
     					  <c:if test="${cno == 7}">
     					  <span>다양한 문화가 공존하는</span>
     						 <h2>이태원</h2></c:if> 
     					  <c:if test="${cno == 8}">
     					  <span>트렌드의 중심</span>
     						 <h2>강남</h2></c:if> 
     					  <c:if test="${cno == 9}">
     					  <span>놀라움으로 가득한 서울의 녹색 쉼터</span>
     						 <h2>잠실</h2></c:if> 	 
                        </div>
                    </div>
                </div>
               
                 <br>
                  <br>
                   <br>
                <div class="row">
                   <!--  <a href="#" class="btn btn btn-sm btn-success">업데이트순</a>
               <a href="#" class="btn btn btn-sm btn-primary">추천순</a>
               <a href="#" class="btn btn btn-sm">가나다순</a> -->
                </div>
                <br>
                            
                <div class="row">
                   <c:forEach var="tvo" items="${tList }">
                            
                    <div class="col-xl-3 col-xl-3 col-md-6">
                    
                        <div class="single-place sm-30" style="width:270px;height:380px">
                            <div class="place-img">
                                <a href="../trip/detail_before.do?no=${tvo.no }" ><img src="${tvo.poster }" style="width:100%;height:170px"></a>
                            </div>
                              <div class="place-cap">
                                <div class="place-cap-top">
                                <div class="#">
                                
                                 <h4 class="text-left jg" ><a href="../trip/detail_before.do?no=${tvo.no }" >${tvo.title }</a></h4>
                                
                                     <!--<span><i class="fas fa-star"></i>
                                    <span></span> </span>-->
                                    </div>
                                 
                                   <!--  <p class="dolor">c<span>c</span></p> -->
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <!--  <li><i class="far fa-clock"></i>3 Days</li> -->
                                        <li><!-- <i class="fas fa-map-marker-alt"></i> -->${tvo.content }</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="fab"><a href="../trip/detail_before.do?no=$"></a></div>
                       </c:forEach>
                   
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
                                  <c:if test="${startPage>1 }">
           <li><a href="../trip/trip_list.do?cno=${cno }&page=${startPage-1 }">&laquo; 이전</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
            <c:if test="${i==curpage }">
             <c:set var="type" value="class=current"/>
            </c:if>
            <c:if test="${i!=curpage }">
             <c:set var="type" value=""/>
            </c:if>
            <li><a href="../trip/trip_list.do?cno=${cno }&page=${i }">${i }</a></li>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
            <li><a href="../trip/trip_list.do?cno=${cno }&page=${endPage+1 }">다음 &raquo;</a></li>
          </c:if>
          </ul>
                              </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Pagination-area End -->
    </main>
    
    </body>
</html>