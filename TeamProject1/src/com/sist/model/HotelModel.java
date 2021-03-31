package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.HotelDAO;
import com.sist.vo.HotelCategoryVO;
import com.sist.vo.HotelVO;


@Controller
public class HotelModel {
	@RequestMapping("hotel/list.do")
	public String hotel_list(HttpServletRequest request,HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		// DAO연결
		HotelDAO dao=HotelDAO.newInstance(); // 오라클 연동
		List<HotelVO> list=dao.HotelData(Integer.parseInt(cno));
		HotelCategoryVO vo=dao.HotelInfoData(Integer.parseInt(cno));
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../hotel/list.jsp");
		return "../main/main.jsp";
	}
}
