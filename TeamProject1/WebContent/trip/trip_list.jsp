<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
 		<script language="javascript">
  		//function showPopup() { window.open("./html/08_2_popup.html", "a", "width=400, height=300, left=100, top=50"); }
  		</script>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Travel HTML-5 Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico">

		
            <style>
        		.intro{
            			position: absolute;
      						  left: 400px;
       							 top: 70px;
          			  }
   		    </style>
   </head>

   <body>
    <!-- Preloader Start -->
    <!-- <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="../img/logo/logo.png" alt="">
                </div>
            </div>
        </div>
    </div> -->
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
       
        <!-- Header End -->
    </header>

    <main>
        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="./img/서울도심.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="hero-cap text-center">
                                <h2>지역별 여행지</h2>
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
                            <h2 style="color:#00D8FF">#BEST PHOTO</h2>
                            <span class=intro style="color:#000000">서울여행공유에서 가장 인기가 많은 사진 10장을 소개합니다.</span>
                        </div>
                    </div>
                </div>
               
               
                <div class="row">
                <c:forEach var="vo" items="${rList }" >
                
                    <div class="col-xl-3 col-xl-3 col-xl-3">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${vo.poster }"  alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>작성자</span> </span>
                                    <h4 ><a href="#">${vo.title }</a></h4>
                                    <p class="tag" style="color:#00D8FF; font-size:20px">#치맥 #라면 #소풍</p>
                                </div>
                              
                            </div>
                        </div>
                        
                    </div>
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
                <li class="page-item"><a class="page-link" href="#"><span class="flaticon-arrow roted left-arrow"></span></a></li>
                 <li class="page-item active"><a class="page-link" href="#">01</a></li>
                 <li class="page-item"><a class="page-link" href="../trip/trip_list.do?cno=${vo.cno=1 }page=${curPage=2 }">02</a></li>
                 <li class="page-item"><a class="page-link" href="#">03</a></li>
                <li class="page-item"><a class="page-link" href="#"><span class="flaticon-arrow right-arrow"></span></a></li>
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
       
        <!-- Footer End-->
 
    </footer>

	
        
    </body>
</html>