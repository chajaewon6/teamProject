<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
        </style>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<!-- <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico"> -->
		<script src="https://kit.fontawesome.com/72d0971596.js" crossorigin="anonymous"></script>
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
  
   </head>

   <body>
    <main>
        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="../img/hero/contact_hero.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>호텔 예약</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!-- Favourite Places Start -->
        <div class="favourite-place place-padding">
            <div class="container">
                
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>${hvo.category }</span>
                            <h2>서울지역별 호텔목록</h2>
                        </div>
                    </div>
                </div>
<!--                 
										    <a href="#" class="btn btn btn-sm">추천순</a>
										    <a href="#" class="btn btn btn-sm">낮은 가격순</a>
										    <a href="#" class="btn btn btn-sm">높은 가격순</a>
									  -->
                <div class="row">
                	<c:forEach var="hvo" items="${hList }">
       							
                    <div class="col-xl-4 col-lg-4 col-md-6">
                    
                        <div class="single-place mb-30">
                        <a href="../hotel/detail.do?no=${hvo.no }">
                            <div class="place-img">
                                <img src="${hvo.poster }" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                <div class="#">
                                    <span><i class="far fa-grin-stars"></i>
                                    <span>${hvo.star }</span> 
                                    </span>
                                    </div>
                                    <h4>${hvo.title }</h4>
                                    <p class="dolor">${fn:substring(hvo.grade,0,fn:indexOf(hvo.grade,"(")) } <span>/${hvo.price }</span></p>
                                    <!--  <h2>${fn:substring(fvo.address,0,fn:indexOf(fvo.address,"지"))}</h2> -->
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <!--  <li><i class="far fa-clock"></i>3 Days</li> -->
                                        <li><i class="fas fa-map-marker-alt"></i>${hvo.addr }</li>
                                    </ul>
                                </div>
                            </div>
                            </a> 
                        </div>
                        
                    </div>
                   <!-- <div class="fab"><a href="../hotel/detail_before.do?no=${hvo.no }"></a></div> -->
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
           <li><a href="../hotel/list.do?cno=${cno }&page=${startPage-1 }">&laquo; 이전</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
            <c:if test="${i==curpage }">
             <c:set var="type" value="class=current"/>
            </c:if>
            <c:if test="${i!=curpage }">
             <c:set var="type" value=""/>
            </c:if>
            <li><a href="../hotel/list.do?cno=${cno }&page=${i }">${i }</a></li>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
            <li><a href="../hotel/list.do?cno=${cno }&page=${endPage+1 }">다음 &raquo;</a></li>
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