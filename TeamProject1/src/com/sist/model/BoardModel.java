package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
@Controller
public class BoardModel {
	@RequestMapping("board/board_main.do")
	public String board_main (HttpServletRequest request, HttpServletResponse response)
	{
		// dao연결, 리스트에 담아두기, request에 담아서 보내기 
		BoardDAO dao=BoardDAO.newInstance();
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		List<BoardVO> mList=dao.boardMainData(Integer.parseInt(page));
		request.setAttribute("mList", mList);
		request.setAttribute("main_jsp", "../board/board_main.jsp");
		return "../main/main.jsp";
	}
	
}
