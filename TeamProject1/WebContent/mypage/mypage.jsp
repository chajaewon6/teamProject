<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/mypage.css">
 <link rel="stylesheet" href="../css/profile.css">
<style type="text/css">

#trip-text{
	margin-bottom: 50px;
	font-size:25px;
}

.text{
	margin-top:20px;
}

.profile{
	width:100%;
	height:130px;
}

</style>
</head>
<body>

	
	<!-- 새로운 프로필 카드 -->
	
	<div class="container">

		<div class="profile">

			<div class="profile-image">

				<img src="https://images.unsplash.com/photo-1513721032312-6a18a42c8763?w=152&h=152&fit=crop&crop=faces" alt="">

			</div>
		
			<div class="profile-user-settings">

				<h2 class="profile-user-name">${id }님 반갑습니다</h2>

				<button class="btn profile-edit-btn">프로필 수정</button>

				<button class="btn profile-edit-btn">이미지 변경</button>

			</div>

			<div class="profile-stats">

				<ul>
					<li><span class="profile-stat-count">164</span> 관심 목록</li>
					<li><span class="profile-stat-count">188</span> 나의 여행 사진</li>
					<li><span class="profile-stat-count">206</span> 예매 목록</li>
				</ul>

			</div>

			<div class="profile-bio">

				<p><span class="profile-real-name">Jane Doe</span>자기소개글 출력📷✈️🏕️</p>

			</div>

		</div>
		<!-- End of profile section -->

        <!-- Favourite Places Start -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                
                <div style="height:600px;width:100%;margin:0px auto;overflow-x:auto">
                <c:forEach var="hvo" items="${hList }" varStatus="s">
                <div class="row">
                    <div class="col-lg-12">
                        <div id="trip-text">
                        	<h2>가고 싶은 호텔🌇</h2>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${hvo.poster }" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <h3><a href="#">${hvo.title }</a></h3>
                                    <p class="dolor">${hvo.price }/일</p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                 	<li>${hvo.addr }</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                   </div>
                   </c:forEach>
                   </div>
                   
                   <div class="row">
                    <div class="col-lg-12">
                        <div id="trip-text">
                        	<h3>가고싶은 여행지✈️</h3>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="../img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>번호</span> </span>
                                    <h3><a href="#">제목</a></h3>
                                    <p class="dolor">가격 <span>인원</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>날짜</li>
                                        <li><i class="fas fa-map-marker-alt"></i>주소</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                   </div>
                   
                     
                    <div class="row">
                    <div class="col-lg-12">
                        <div id="trip-text">
                        	<h3>가고 싶은 호텔🌇</h3>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="../img/service/services1.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>번호</span> </span>
                                    <h3><a href="#">제목</a></h3>
                                    <p class="dolor">가격 <span>인원</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>날짜</li>
                                        <li><i class="fas fa-map-marker-alt"></i>주소</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                   </div>
                    
                    
                   <div style="height:600px;width:100%;margin:0px auto;overflow-x:auto">
                   <!-- 
						 	private int no;
						   private String id;
						   private String title;
						   private String inday;
						   private String intime;
						   private String outday;
						   private String outtime;
						   private String inwon;
						   private String room;
						   private int state;
						   private Date regdate;
						   private String dbday;
                    -->
                    <h2 class="sectiontitle">예약 목록</h2>
					  <div style="height:300px;width:600px;overflow-y:auto">
					  <table class="table">
					    <tr>
					     <th>예약번호</th>
					     <th>업체명</th>
					     <th>체크인날짜</th>
					     <th>체크인시간</th>
					     <th>체크아웃날짜</th>
					     <th>체크아웃시간</th>
					     <th>인원</th>
					     <th>상태</th>
					    </tr>
					    <c:forEach var="rvo" items="${rList }" varStatus="s">
					       <tr>
					     <td>${rvo.no }</td>
					     <td>${rvo.title }</td>
					     <td>${rvo.inday }</td>
					     <td>${rvo.intime }</td>
					     <td>${rvo.outday }</td>
					     <td>${rvo.outtime }</td>
					     <td>${rvo.inwon }</td>
					     <td>${vo.state==0?"예약대기":"예약완료"}</td>
					    </tr>
					    </c:forEach>
					   </table>
					  </div>
                   
                  </div> 
                   
                   </div>
                    
                </div>
            </div>
        
        <!-- Favourite Places End -->

        <!-- Pagination-area Start -->
        <!--  <div class="pagination-area pb-100 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="single-wrap d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-start">
                                  <li class="page-item"><a class="page-link" href="#"><span class="flaticon-arrow roted left-arrow"></span></a></li>
                                    <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                                  <li class="page-item"><a class="page-link" href="#"><span class="flaticon-arrow right-arrow"></span></a></li>
                                </ul>
                              </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>-->
        <!-- Pagination-area End -->
    
      
</body>
</html>