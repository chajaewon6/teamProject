<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
 		<script language="javascript">
  		function showPopup() { window.open("./html/08_2_popup.html", "a", "width=400, height=300, left=100, top=50"); }
  		</script>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Travel HTML-5 Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico">

		<!-- CSS here -->
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
            <link rel="stylesheet" href="../css/style.css">
            <link rel="stylesheet" href="./css/button.css">
            <style>
        		.intro{
            			position: absolute;
      						  left: 400px;
       							 top: 70px;
          			  }
   		    </style>
   </head>

   <body>
    

    <main>
        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/bra/image/aJ93GlCnzd_nPtfeK8yaEaYF7hU.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>여행사진 공유</h2>
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
                    
                <c:forEach var="vo" items="${mList }" varStatus="s">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <a href="board_detail.do?no=${vo.pb_no }"><img src="${vo.pb_pic }" alt=""></a>
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><span>작성자:&nbsp;${vo.user_id }</span> </span><br>
                                    <span><span>조회수:&nbsp;${vo.pb_picHit }</span> </span>
                                    <h3><a href="board_detail.do?no=${vo.pb_no }">${vo.pb_picLoc }</a></h3>
                                    <p class="tag" style="color:#00D8FF; font-size:20px">${vo.pb_picTag }</p>
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
                                <!-- 이전 -->
                               <c:if test="${startPage>1 }"> <!-- startPage 6이면 -->
                                  <li class="page-item"><a class="page-link" href="../board/board_main.do?page=${startPage-1 }">이전</a></li>
                                </c:if>  
                             	
                                <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1"> 
                                    <li class="page-item active"><a class="page-link" href="../board/board_main.do?page=${i }">${i }</a></li>
                               </c:forEach>   
                                 
                                 <!-- 다음 -->
                                 <c:if test="${endPage<totalPage}">
                                  <li class="page-item"><a class="page-link" href="../board/board_main.do?page=${endPage+1 }">다음</a></li>
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
	