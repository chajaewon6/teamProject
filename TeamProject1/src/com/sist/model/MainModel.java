package com.sist.model;

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
		request.setAttribute("mList", mList);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}