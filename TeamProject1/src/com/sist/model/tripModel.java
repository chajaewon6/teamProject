package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class tripModel {
  @RequestMapping("trip/trip_list.do")
  public String trip_list(HttpServletRequest request,HttpServletResponse response)
  {
	   String cno=request.getParameter("cno");
	   if(cno==null)
		   cno="1";
	   TripDAO dao=TripDAO.newInstance();
	   List<TripVO> tlist=dao.tripListData(Integer.parseInt(cno));
	   
	   request.setAttribute("list", tlist);
	   request.setAttribute("main_jsp", "../trip/trip_list.jsp");
	   return "../main/main.jsp"; 
  }
  
}
