package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;


@Controller
public class MypageModel {

		@RequestMapping("mypage/mypage_main.do")
		public String mypage_main(HttpServletRequest request,HttpServletResponse response) {
			 HttpSession session=request.getSession();
			 String id=(String)session.getAttribute("id");
			
			
			request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
			return "../main/main.jsp";
		}
		
		//마이페이지에 출력- 여행
		
		
		  //마이페이지에 출력 - 호텔
		/*
		  @RequestMapping("mypage_hotel/jjim.do")
		  public String mypage_hotel_jjim(HttpServletRequest request,HttpServletResponse response)
		  {
			  HttpSession session=request.getSession();
			  String id=(String)session.getAttribute("id");
			  // DB연동 
			  HotelDAO dao=HotelDAO.newInstance();
			  // 1. 찜하기 목록
			  List<HotelJjimVO> hjList=dao.hotelJjimListData(id);
			  for(HotelJjimVO vo:hjList)
			  {
				  HotelVO hvo=dao.HotelDetailData(vo.getCno());
				  String poster=hvo.getPoster();
				  hvo.setPoster(poster);
				  hjList.add(hvo);
			  }
			  request.setAttribute("hList", hList);
			  request.setAttribute("hjList", hjList);
			  // 2. 예약 목록 
			  List<ReserveVO> rList=dao.mypage_data(id);
			  request.setAttribute("rList", rList);
			  request.setAttribute("main_jsp", "../mypage/mypage.jsp");
			  return "../main/main.jsp";
		  }*/
		 
}
