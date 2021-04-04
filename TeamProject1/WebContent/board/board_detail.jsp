<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-0 mb-lg-0">
                    <div class="blog_left_sidebar">
                    
                    
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="${vo.pb_pic }" alt="">
                                <a class="blog_item_date"> 
           					     </a>
                            </div>

                            <div class="blog_details">
                                
                                    <h1 style="color:orange">${vo.pb_picTitle }</h1>
                                    <ul class="blog-info-link">
                                   
                                </ul>
                                <strong style="font-size:15pt">한줄 소개</strong>
                                <p>${vo.pb_picContent }</p>
                                <div style="color:gray;font-size:15px;float:left">조회수:&nbsp;</div> 
                                <div style="color:pink;font-size:15px;float:left">${vo.pb_picHit }</div><br>
                                
                                     <div id="map" style="width:100%;height:500px;"></div>
     
                					</div>
                                 </article>
                            </div>
                       
										
                       

                        
                    </div>
                   
                
                 <div class="col-lg-4">
                    <div class="blog_right_sidebar">            
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">인근 여행지 추천</h3>
                            <%-- <c:forEach var="hvo" items="">
                            
                            <a href="../hotel/detail.do?no=${hvo.no }">
                            <div class="media post_item">
                                <img src="" alt="post" style="width:140px;height:115px">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>${hvo.title }</h3>
                                    </a>
                                    <p class="dolor" style="color:green"> <span style="color:black"></span></p>
                                </div>  
                            </div>
                            </a>
                            
                            </c:forEach> --%>
  
                        </aside>
                	</div>
                </div> <!-- col-lg-4 end -->
            </div> <!-- row-end -->
        </div>
    </section>
</body>
</html>