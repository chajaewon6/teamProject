package com.sist.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.TripDAO;
import com.sist.vo.*;
import java.util.*;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_home(HttpServletRequest request, HttpServletResponse response)
	{
		TripDAO dao=TripDAO.newInstance();
		List<TripVO> mList=dao.tripMainData();
		
		
		/*
		 * // 쿠키 List<TripVO> ckList=new ArrayList<TripVO>(); Cookie[]
		 * cookies=request.getCookies(); if(cookies!=null) { for(int i=cookies.length;
		 * i<=0; i--) { if(cookies[i].getName().startsWith("m")) {
		 * cookies[i].setPath("/"); String no=cookies[i].getValue(); // dao연결해야함 TripVO
		 * vo=dao.tripCookieData(Integer.parseInt(no)); ckList.add(vo); } } }
		 * 
		 * request.setAttribute("ckList", ckList);
		 */

		
		request.setAttribute("mList", mList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
	
	
}