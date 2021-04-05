<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
$(function(){
	$('.delBtn').click(function(){
		let no=$(this).attr("data-no");
		let pno=$(this).attr("data-pno");
		location.href="../board/board_reply_delete.do?no="+no+"&pno="+pno;
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
                                
                                     <!-- <div id="map" style="width:100%;height:500px;"></div> -->
                                     
                                     
     							 
                					</div>
                                 </article>
                                 
         <!-- 댓글 영역 -->
         
          <div class="row">
                    <div class="col-12">
                        <h2 class="contact-title">Get in Touch</h2>
                    </div>
                    <div class="col-lg-8">
                        <form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100" name="message" id="message" cols="30" rows="5" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder=" Enter Message"></textarea>
                                    </div>
                                </div>
                                <!-- <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" name="name" id="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your name'" placeholder="Enter your name">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" name="email" id="email" type="email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" placeholder="Email">
                                    </div>
                                </div> -->
                                <!-- <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control" name="subject" id="subject" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Subject'" placeholder="Enter Subject">
                                    </div>
                                </div> -->
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" class="button button-contactForm boxed-btn">Send</button>
                            </div>
                        </form>
                    </div>
                </div>
                <c:forEach var="rvo" items="${rList }">
                <article class="blog_item">
                   <div class="blog_details">
                    <table>
                     <tr>
                      <td>작성자:${rvo.pbr_name }</td>
                     </tr>
                     <tr>
                      <td>작성일:${rvo.dbday }</td>
                     </tr>
                     <tr>
                      <td>내용:${rvo.pbr_msg }</td>
                     </tr>
                    </table>            
                   </div>
                 </article>
                  </c:forEach> 
         
        
	</div>
	</div> 
                   
                   
                   
                   
                
                 <div class="col-lg-4">
                    <div class="blog_right_sidebar">            
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">인근 여행지 추천</h3>
                            
                            <c:forEach var="rvo" items="${rList }">
     							 <span>작성자:${rvo.pbr_name }</span>
     							 <span>작성일:${rvo.dbday }</span>
     							 <span>작성내용:${rvo.pbr_msg }</span>
     							 </c:forEach> 
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
                            
                            </c:forEach>  --%>
  
                        </aside>
                	</div>
                </div> <!-- col-lg-4 end -->
            </div> <!-- row-end -->
        </div>
    </section>
</body>
</html>