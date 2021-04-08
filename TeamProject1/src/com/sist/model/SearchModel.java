package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.SearchDAO;
import com.sist.vo.SearchVO;

@Controller
public class SearchModel {
	
	@RequestMapping("main/search_result.do")
	  public String search_result(HttpServletRequest request,HttpServletResponse response)
	  {
		  System.out.println("OK");
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex){}
		  String title=request.getParameter("title");
		  System.out.println(title);
		  SearchDAO dao=SearchDAO.newInstance();
		  List<SearchVO> list=dao.SearchFindData(title);
		  request.setAttribute("list", list);
		  
		  return "../main/search_result.jsp";
	  }
	@RequestMapping("main/search.do")
	public String search(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../main/search.jsp");
		return "../main/main.jsp";
	}
}
