package com.sist.model;

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
		 try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String title=request.getParameter("title");
		  String poster=request.getParameter("poster");
		  String inday=request.getParameter("inday");
		  String outday=request.getParameter("outday");
		  String intime=request.getParameter("intime");
		  String outtime=request.getParameter("outtime");
		  String inwon=request.getParameter("inwon");
		  String room=request.getParameter("room");
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  ReserveVO vo=new ReserveVO();
		  vo.setId(id);
		  vo.setPoster(poster);
		  vo.setTitle(title);
		  vo.setInday(inday);
		  vo.setOutday(outday);
		  vo.setIntime(intime);
		  vo.setOuttime(outtime);
		  vo.setInwon(inwon);
		  vo.setRoom(room);
		  
		  HotelDAO dao=HotelDAO.newInstance();
		  dao.HotelReserveSave(vo);
		  
		request.setAttribute("main_jsp", "../mypage/admin.jsp");
		return "../main/main.jsp";
	}
}
