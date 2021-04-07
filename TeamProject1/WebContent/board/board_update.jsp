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
             <link rel="stylesheet" href="../css/board_upload.css">
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
.border {
	border:1px; solid gray;
} 
.text{
	font-size:10px;
}
.can {
	height: 50px;
}
.photoFrame{
  width: 500px;
  height: 500px;
}
.photoFrame:hover{
cursor: pointer;
 }
 </style>
  </head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript"> 
</script>
 <script>
  var fileInput = document.getElementById("fileInput");
  //값이 변경될때 호출 되는 이벤트 리스너
  fileInput.addEventListener('change',function(e){
    var file = e.target.files[0]; //선택된 파일
    var reader = new FileReader();
    reader.readAsDataURL(file); //파일을 읽는 메서드 

    reader.onload = function(){
      var photoFrame = document.createElement("div");
      photoFrame.style = `background : url(${reader.result}); background-size : cover`;
      photoFrame.className = "photoFrame";
      document.getElementById("pictures").appendChild(photoFrame);
      e.target.value = "";

      photoFrame.addEventListener("click",function(){
        document.getElementById("pictures").removeChild(photoFrame);
      })
    }
  })
</script>
<body>
  <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-0 mb-lg-0">
                    <div class="blog_left_sidebar">
                    
                    
                        <article class="blog_item">
                            <div class="blog_item_img">
                             <!-- 사진 올리기 -->   
                      <!-- <div id="mainApp"></div>
			<div class="centerText"><a href="http://www.hartzis.me/react-image-upload/" target="_blank">blog post</a></div> -->
							
						    
					
		 <form method=post action="../board/board_update_ok.do"
	     	enctype="multipart/form-data">
            <div class="blog_details">
           		<h2>글쓰기</h2>
		        	<table>
		            <tr>
		                <th width=10% class="text">제목</th>
		                <td class="border"><input type=text name=title id="penulis" autocomplete="off" size=50 placeholder="${vo.pb_picTitle }"></td>
		            </tr>
		            
		            <tr>
		                <th width=10%  class="text">내용</th>
		                <td class="border"><textarea name=content id="berita" cols="80" rows="10" autocomplete="off" placeholder="${vo.pb_picContent }"></textarea></td>
		            </tr>
		            <tr>
		                <th width=10%  class="text">태그</th>
		                <td class="border"><input type=text name=tag id="judul" autocomplete="off" placeholder="${vo.pb_picTag }"></td>
		            </tr>
		            <tr>
		                <th width=10%  class="text">장소</th>
		                
		                <td><select name=loc class="loc">
		                 <option id="loc1">광화문</option>
		                 <option id="loc2">명동</option>
		                 <option id="loc3">동대문</option>
		                 <option id="loc4">홍대</option>
		                 <option id="loc5">여의도</option>
		                 <option id="loc6">이태원</option>
		                 <option id="loc7">강남</option>
		                 <option id="loc8">잠실</option>
		                 <option id="loc9">기타</option>
		                </select></td>
		            </tr>
		            
		            <tr>
		             <th width=10% class="text">이미지 첨부</th>
		             <td>
		              <input type=file name=upload size=20>
		              <div id="pictures"> </div>
		             </td>
		            </tr>
		            <!-- <tr>
		                <td class="text">사진</td>
		                <td class="border"><input type="text" name="pic" id="judul"></td>
		            </tr> -->
		        </table>
		        <div style="height:50px"></div>
		        <input type=hidden name=no value="${no }">
		         <button class="button -dark center boardUp" style="float:right">수정하기</button>
		         <input type="button" value="취소" onclick="javascript:history.back()">
		        </div> <!-- blog_details -->      
    			</form>
    			
                                
                              
                                <div style="height:10px"></div>
          				</div>
    				</article>
				</div> 
              </div>
            </div> <!-- row-end -->
        </div>
    </section>
   
    <script src='https://cdnjs.cloudflare.com/ajax/libs/react/15.4.2/react.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/react/15.4.2/react-dom.min.js'></script><script  src="../js/board_upload.js"></script>
</body>
</html>