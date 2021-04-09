package com.sist.model;
import java.net.http.HttpResponse;
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

	@RequestMapping("mypage/mypage.do")
	public String mypage_main(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		// 호텔 찜 목록
		HotelDAO dao=HotelDAO.newInstance();
		
		List<HotelJjimVO> jList=dao.hotelJjimListData(id);
		List<HotelVO> hList=new ArrayList<HotelVO>();
		for(HotelJjimVO vo:jList)
		{
			HotelVO hvo=dao.HotelDetailData(vo.getCno());
			hList.add(hvo);
		}
		int hotelJcount=dao.hotelJjimCount(id);
		
		
		// 여행 찜목록
		TripDAO tdao=TripDAO.newInstance();
		
		List<TripJjimVO> tList=tdao.TripJjimListData(id);
		List<TripVO> trList=new ArrayList<TripVO>();
		for(TripJjimVO vo:tList)
		{
			TripVO tvo=tdao.TripDetailData(vo.getCno());
			trList.add(tvo);
		}
		int tripCount=tdao.tripJjimCount(id);
		
		// 호텔 예약 목록
		List<ReserveVO> rList=dao.mypage_data(id);
		int reserveCount=dao.reserveCount(id);
		
		
		request.setAttribute("rList", rList);
		request.setAttribute("reserveCount", reserveCount);
		request.setAttribute("tripCount", tripCount);
		request.setAttribute("hotelJcount", hotelJcount);
		request.setAttribute("jList", jList);
		request.setAttribute("hList", hList);
		request.setAttribute("tList", tList);
		request.setAttribute("trList", trList);
		
		request.setAttribute("id", id);
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	
	
	
}
