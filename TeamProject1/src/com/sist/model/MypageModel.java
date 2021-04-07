package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.HotelDAO;
import com.sist.vo.HotelJjimVO;
import com.sist.vo.HotelVO;
import com.sist.vo.ReserveVO;

@Controller
public class MypageModel {

		@RequestMapping("mypage/mypage_main.do")
		public String mypage_main(HttpServletRequest request,HttpServletResponse response) {
				request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
			return "../main/main.jsp";
		}
		
		  //마이페이지
		  @RequestMapping("mypage/mypage.do")
		  public String mypage_mypage(HttpServletRequest request,HttpServletResponse response)
		  {
			  HttpSession session=request.getSession();
			  String id=(String)session.getAttribute("id");
			  // DB연동 
			  HotelDAO dao=HotelDAO.newInstance();
			  // 1. 찜하기 목록
			  List<HotelJjimVO> hjList=dao.hotelJjimListData(id);
			  List<HotelVO> hList=new ArrayList<HotelVO>();
			  for(HotelJjimVO vo:hjList)
			  {
				  HotelVO hvo=dao.HotelDetailData(vo.getCno());
				  String poster=hvo.getPoster();
				  poster=poster.substring(0,poster.indexOf("^"));
				  hvo.setPoster(poster);
				  hList.add(hvo);
			  }
			  request.setAttribute("hList", hList);
			  request.setAttribute("hjList", hjList);
			  // 2. 예약 목록 
			  List<ReserveVO> rList=dao.mypage_data(id);
			  request.setAttribute("rList", rList);
			  request.setAttribute("main_jsp", "../mypage/mypage.jsp");
			  return "../main/main.jsp";
		  }
}
