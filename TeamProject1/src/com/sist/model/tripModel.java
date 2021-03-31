package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.TripDetailDAO;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class tripModel {
  @RequestMapping("trip/trip_detail.do")
  public String trip_detail(HttpServletRequest request,HttpServletResponse response)
	{
	 	String cno=request.getParameter("cno");
	 	// DAO 연결
	 	TripDetailDAO dao=TripDetailDAO.newInstance();
	 	List<TripVO> list=dao.tripDetailData(Integer.parseInt(cno));
	 	
	 	request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../trip/trip_detail.jsp"); 
		return "../main/main.jsp"; 
	}
  
}
