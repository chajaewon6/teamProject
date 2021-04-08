<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main-image
{
   background-image: url("https://www.travelmap.co.kr/contents/files/board/news/2020/12/editor_3824_1608277874_1608278606.png");
   background-size:cover;
   background-repeat:no-repeat;
   height: 18%;
   width:100%;
   
}
.single-place{
	height:40%;
	width:100%;
	
}
/* .video-area{
	height:18%;
	width:50%;
	margin:0px auto;
	
} */
.place-img{
	width:350px;
	height:250px;
	object-fit:cover;
} 
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
		$('#findBtn').click(function(){
		let title=$('#title').val();
		if(title.trim()=="")
		{
			$('#title').focus();
			return;
		}	
	$.ajax({
			type:'post',
			url:'../main/search_result.do',//post_result.do/dong/값
			data:{"title":title},
			success:function(result)
			{
				$('.print').html(result);
			}
		})
	})
})
</script>
</head>
<body>
<main>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
               <div class="main-image">
                <!-- <div class="single-slider hero-overly  slider-height d-flex align-items-center" data-background="../img/hero/h1_hero.jpg"> -->
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-9 col-lg-9 col-md-9">
                                <div class="hero__caption">
                                    <h1>Find <span>Next tour!</span> </h1>
                                    <p>여행을 떠나봐요!</p>
                                </div>
                            </div>
                        </div>
                        <!-- Search Box -->
                        <div class="row">
                            <div class="col-xl-12">
                                <!-- form -->
                                <form action="#" class="search-box">
                                    <div class="input-form mb-30">
                                        <input id="title" type="text" placeholder="어디로 떠나볼까요?">
                                    </div>
                                    
                                 			
                                       <div class="search-form mb-30">
                                       
                                        <a href="#" id="findBtn">찾기</a>
                                        
                                    </div> 
                                     
                                </form>   
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            

        <!-- Favourite Places Start -->
        <div class="favourite-place place-padding">
            <div class="container">
            <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>내가 가고싶은 서울방방곡곡</span>
                            <h2>검색 목록</h2>
                        </div>
                    </div>
                </div>
                <div class="print"></div>
            </div>
        </div>      
    </main>
</body>
</html>