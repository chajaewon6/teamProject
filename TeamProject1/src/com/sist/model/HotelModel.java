package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
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
	public String hotel_page(HttpServletRequest request,HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		if(cno==null)
			cno="1";
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		System.out.println(page);
		int curpage=Integer.parseInt(page);
		int cno1=Integer.parseInt(cno);
		HotelDAO dao=HotelDAO.newInstance();
		List<HotelVO> hList=dao.HotelListData(cno1,curpage);
		
		HotelCategoryVO hvo=dao.HotelInfoData(cno1);
		int count=dao.HotelCount(cno1);
		int totalpage=(int)(Math.ceil(count/12.0));
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("cno", cno);
		request.setAttribute("count", count);
		
		request.setAttribute("hList", hList);
		request.setAttribute("hvo", hvo);
		request.setAttribute("block", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("main_jsp", "../hotel/list.jsp");
		return "../main/main.jsp";
	}
/*
	@RequestMapping("hotel/detail_before.do")
	  public String detail_before(HttpServletRequest request,HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  System.out.println(no);
		  Cookie cookie=new Cookie("m"+no, no);// 문자열만 저장이 가능 
		  cookie.setMaxAge(60*60);
		  cookie.setPath("/");
		  response.addCookie(cookie);
		  return "redirect:../hotel/detail.do?no="+no;
	  }
	*/
	@RequestMapping("hotel/detail.do")
	  public String hotel_detail(HttpServletRequest request,HttpServletResponse response)
	  {
		List<HotelCategoryVO> fList=new ArrayList<HotelCategoryVO>();
		HotelDAO dao=HotelDAO.newInstance();
		String no=request.getParameter("no");
		  System.out.println(no);
		  Cookie cookie=new Cookie("m"+no, no);// 문자열만 저장이 가능 
		  cookie.setMaxAge(60*60);
		  cookie.setPath("/");
		  Cookie[] cookies=request.getCookies();
		  if(cookies!=null)
		  {
			  for(int i=cookies.length-1;i>=0;i--)
			  {
				  if(cookies[i].getName().startsWith("m"))
				  {
					  cookies[i].setPath("/");
					  //System.out.println(cookies[i].getName());
					  String no1=cookies[i].getValue();
					  HotelCategoryVO vo=dao.HotelCookiePrintData(Integer.parseInt(no1));
					  fList.add(vo);
				  }
			  }
		  }
		  // DAO연결 
		  request.setAttribute("fList", fList);
		  HotelVO vo=dao.HotelDetailData(Integer.parseInt(no));
		  response.addCookie(cookie);
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../hotel/detail.jsp");
		  return "../main/main.jsp";
	  }
	
	
}
