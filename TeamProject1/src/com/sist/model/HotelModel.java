package com.sist.model;

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
	/*@RequestMapping("hotel/list.do")
	public String hotel_list(HttpServletRequest request,HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		if(cno==null)
			cno="1";
		// DAO연결
		HotelDAO dao=HotelDAO.newInstance(); // 오라클 연동
		List<HotelVO> hList=dao.HotelListData(Integer.parseInt(cno));
		HotelCategoryVO hvo=dao.HotelInfoData(Integer.parseInt(cno));
		request.setAttribute("hList", hList);
		request.setAttribute("hvo", hvo);
		request.setAttribute("main_jsp", "../hotel/list.jsp");
		return "../main/main.jsp";
	}*/
	/*@RequestMapping("hotel/list_before.do")
	  public String list_before(HttpServletRequest request,HttpServletResponse response)
	  {
		  String cno=request.getParameter("cno");
		 
		  return "redirect:../food/food_detail.do?cno="+cno;
	  }*/
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
		//List<HotelVO> rList=dao.HotelData(Integer.parseInt(cno));
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
		//request.setAttribute("rList", rList);
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
}
/*
String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		RecipeDAO dao=RecipeDAO.newInstce();
		List<RecipeVO> rList=dao.recipeListData(curpage);
		int count=dao.recipeCount();
		int totalpage=(int)(Math.ceil(count/12.0));
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("count", count);
		request.setAttribute("rList", rList);
		
		request.setAttribute("block", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("main_jsp", "../recipe/recipe_list.jsp");
		return "../main/main.jsp";
*/