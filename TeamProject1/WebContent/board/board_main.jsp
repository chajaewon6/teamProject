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
.mypage_row{
  margin: 0px auto;
  width:1500px;
}
        		.intro{
            			margin: 0px auto;
            			font-size:15px;
          			  }
          		.share{
          			background-color:#014b85;
          			color:white;
          		}
          		
          		/* .main_img{
          			width:500px;
          			height:400px;
          		} */
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
.comment-block{
	width:800px;
} 
   		    </style>
   </head>

   <body>
    

    <main>
        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="https://t1.daumcdn.net/cfile/tistory/9912A0365AD6B0333B">
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
                            <span class="intro" style="color:#000000">우리가 보고 찍은 서울의 모습</span>
                            <div style="height:50px"></div>
                            <c:if test="${sessionScope.id!=null }"> 
                            <a href="board_insert.do">
                            <button class="ripple">나도 공유하러 가기</button></a>
                            </c:if>
                             <div style="height:50px"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    
                <c:forEach var="vo" items="${mList }" varStatus="s">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <a href="board_detail.do?no=${vo.pb_no }"><img src="../upload/${vo.pb_pic }" alt="" class="main_img"></a>
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
	