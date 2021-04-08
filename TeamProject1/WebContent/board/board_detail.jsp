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
.comment-block{
	width:800px;
} 
 
 </style>
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
	$('.boardDel').click(function(){
		let no=$(this).attr("data-no");
		location.href="../board/board_delete.do?no="+no;
	})
	$('.boardUp').click(function(){
		let no=$(this).attr("data-no");
		location.href="../board/board_update.do?no="+no;
	})
	
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
                                <img class="card-img rounded-0" src="../upload/${vo.pb_pic }" alt="">
                              
                            </div>

                            <div class="blog_details">
                                
                                    <h1 style="color:orange">${vo.pb_picTitle }</h1>
                                    <ul class="blog-info-link">
                                   
                                </ul>
                                <strong style="font-size:15pt">한줄 소개</strong>
                                <p>${vo.pb_picContent }</p>
                                <div style="color:gray;font-size:15px;float:left">조회수:&nbsp;</div> 
                                <div style="color:pink;font-size:15px;float:left">${vo.pb_picHit }</div><br>
                                
                                <c:if test="${sessionScope.id==vo.user_id }">
                                <button class="button -dark center boardUp" style="float:right" data-no="${no}">수정하기</button>
                                <button class="button -dark center boardDel" style="float:right" data-no="${no }">삭제하기</button>
                                </c:if>
                                <div style="height:10px"></div>
                                     <!-- <div id="map" style="width:100%;height:500px;"></div> -->
                                     
                                     
     							 
                					</div>
                                 </article>
                                 
         <!-- 댓글 영역 -->
         
          <div class="row">
          <!-- 댓글 쓰기 -->
         <!--  <h4>댓글 달기</h4><br> -->
          <div class="comments">
           <c:if test="${sessionScope.id!=null }"> 
           
		<div class="comment-wrap">
		<form action="../board/board_reply_insert.do" method=post>
				<div class="comment-block">
						<textarea name="msg" id="id" cols="100" rows="3" placeholder="Add comment..."></textarea>
						<input type="hidden" name=pno value="${no }">
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
						<p class="comment-text">${rvo.pbr_msg }</p>
						<p class="comment-text" style="font-size:10px;">작성자:&nbsp;${rvo.pbr_name }</p>
						<div class="bottom-comment">
								<div class="comment-date">${rvo.dbday }</div>
								<!-- 수정, 삭제 -->
								<c:if test="${sessionScope.id==rvo.pbr_id }">
								<ul class="comment-actions">
									<li class="complain updateBtn" data-no="${rvo.pbr_no }">수정</li>
								    <li class="reply delBtn" data-no="${rvo.pbr_no }" data-pno="${no }">삭제</li>
								</ul>
								
								
								
								<div class="comment-wrap updateli" style="display:none" id="m${rvo.pbr_no }">
								<form action="../board/board_reply_update.do" method="post">
								<div class="comment-block">
								<textarea name="msg" id="id" cols="50" rows="3" placeholder="${rvo.pbr_msg }"></textarea>
									<input type="hidden" name=pno value="${no }">
									 <input type="hidden" name=no value="${rvo.pbr_no }">
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
			
			
				</div> 
              <div class="col-lg-4">
                    <div class="blog_right_sidebar text-center">
                        
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">조회수 top10 게시글</h3>
                            <table>
                           <%--  <c:forEach var="tvo" items="${fList }"  end="4"> --%>
                            <tr>
                             <a href="../trip/detail_before.do?no=${tvo.no }">
                              <!-- div class="media post_item"> -->
                               <img src="${tvo.poster }" alt="post" style="width:160px;height:115px">
                               <%-- <h4>${tvo.title }</h4> --%>
                               <p style="font-size:10pt;margin:0px auto">${tvo.title }</p>
                               <br>
                              <!-- <div class="media-body">
                                <a href="single-blog.html"></a>
                              </div> -->  
                             </div>
                            </a>
                            </tr>
                            <%-- </c:forEach> --%>
  							</table>
                        </aside>
                      
                      </div>
                </div>
            </div> <!-- row-end -->
        </div>
    </section>
</body>
</html>