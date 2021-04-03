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
                
										    <a href="#" class="btn btn btn-sm">추천순</a>
										    <a href="#" class="btn btn btn-sm">낮은 가격순</a>
										    <a href="#" class="btn btn btn-sm">높은 가격순</a>
									 
                <div class="row">
                	<c:forEach var="hvo" items="${hList }">
       							
                    <div class="col-xl-4 col-lg-4 col-md-6">
                    
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${hvo.poster }" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                <div class="#">
                                    <span><i class="fas fa-star"></i>
                                    <span>${hvo.star }</span> 
                                    </span>
                                    </div>
                                    <h3><a href="../hotel/detail.do?no=${hvo.no }">${hvo.title }</a></h3>
                                    <p class="dolor">${hvo.grade } <span>/${hvo.price }</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <!--  <li><i class="far fa-clock"></i>3 Days</li> -->
                                        <li><i class="fas fa-map-marker-alt"></i>${hvo.addr }</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="fab"><a href="../hotel/detail_before.do?no=${hvo.no }"></a></div>
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
    <footer>
        
        <!-- Footer Start-->
        <div class="footer-area footer-padding footer-bg" data-background="../img/service/footer_bg.jpg">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
                       <div class="single-footer-caption mb-50">
                         <div class="single-footer-caption mb-30">
                              <!-- logo -->
                             <div class="footer-logo">
                                 <a href="index.html"><img src="../img/logo/logo2_footer.png" alt=""></a>
                             </div>
                             <div class="footer-tittle">
                                 <div class="footer-pera">
                                     <p>Lorem iaspsum doldfor sit amvset, consectetur adipisicing cvelit csed do eiusmod tempor incididucvccnt ut labovre.</p>
                                </div>
                             </div>
                         </div>
                       </div>
                    </div>
                    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-5">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Quick Links</h4>
                                <ul>
                                    <li><a href="#">About</a></li>
                                    <li><a href="#"> Offers & Discounts</a></li>
                                    <li><a href="#"> Get Coupon</a></li>
                                    <li><a href="#">  Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>New Products</h4>
                                <ul>
                                    <li><a href="#">Woman Cloth</a></li>
                                    <li><a href="#">Fashion Accessories</a></li>
                                    <li><a href="#"> Man Accessories</a></li>
                                    <li><a href="#"> Rubber made Toys</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
                        <div class="single-footer-caption mb-50">
                            <div class="footer-tittle">
                                <h4>Support</h4>
                                <ul>
                                 <li><a href="#">Frequently Asked Questions</a></li>
                                 <li><a href="#">Terms & Conditions</a></li>
                                 <li><a href="#">Privacy Policy</a></li>
                                 <li><a href="#">Privacy Policy</a></li>
                                 <li><a href="#">Report a Payment Issue</a></li>
                             </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer bottom -->
                <div class="row pt-padding">
                 <div class="col-xl-7 col-lg-7 col-md-7">
                    <div class="footer-copy-right">
                         <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                 </div>
                  <div class="col-xl-5 col-lg-5 col-md-5">
                        <!-- social -->
                        <div class="footer-social f-right">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-behance"></i></a>
                            <a href="#"><i class="fas fa-globe"></i></a>
                        </div>
                 </div>
             </div>
            </div>
        </div>
        <!-- Footer End-->
 
    </footer>
    </body>
</html>