package com.sist.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MainImageDAO;
import com.sist.dao.TripDAO;
import com.sist.vo.*;
import java.util.*;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_home(HttpServletRequest request, HttpServletResponse response)
	{
		MainImageDAO dao=new MainImageDAO();
		List<MainImageVO> mList=dao.MainImageListData();
		
		request.setAttribute("mList", mList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
	
	/*
	 * @RequestMapping("trip/trip_list.do") public String
	 * main_triplist(HttpServletRequest request, HttpServletResponse response) {
	 * String cno=request.getParameter("cno"); MainImageDAO dao=new MainImageDAO();
	 * List<MainImageVO> mList=dao.MainImageListData();
	 * 
	 * request.setAttribute("mList", mList); request.setAttribute("main_jsp",
	 * "../trip/trip_list.jsp"); return "redirect:../trip/trip_detail.do?cno="+cno;
	 * }
	 */
	
}