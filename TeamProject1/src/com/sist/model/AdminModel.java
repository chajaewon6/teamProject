package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.HotelDAO;
import com.sist.vo.ReserveVO;

@Controller
public class AdminModel {
	@RequestMapping("mypage/admin.do")
	public String admin_page(HttpServletRequest request, HttpServletResponse response)
	{
		 HotelDAO dao=HotelDAO.newInstance();
		 List<ReserveVO> list=dao.adminpage_data();
		  
		 request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../mypage/admin.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("hotel/reserve_ok.do")
	public String hotel_reserve_ok(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		HotelDAO dao=HotelDAO.newInstance();
		dao.reserve_ok(Integer.parseInt(no));
		
		return "redirect:../mypage/admin.do";
	}
}
