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
  @RequestMapping("tripAll/trip_list.do")
  public String trip_detail(HttpServletRequest request,HttpServletResponse response)
  {
	   // 나눠진 페이지 받아 와야함
	   // list.do?page=  => ""(공백)   list.do => null  첫페이지는 null
	   // if(page.equals(""))         if(page==null)    이렇게 처리하는 방식이 두개가 다르다!
	  String cno=request.getParameter("cno");
	   String page=request.getParameter("page");
	   if(page==null)
	      page="1";
	   int curpage=Integer.parseInt(page); //현재 페이지
	   TripDAO dao=TripDAO.newInstance();
	   List<TripVO> List=dao.tripListData(curpage); // 그림 파일 배열로 가져올거라 rList 씀
	   int count=dao.tripCount(Integer.parseInt("cno")); //총갯수 가져옴
	   int totalpage=(int)(Math.ceil(count/8.0)); // 12개씩 출력이니까 
	   
	   final int BLOCK=5;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; 
	  
	   
	   if(endPage>totalpage)     
		   endPage=totalpage;
	   
	   request.setAttribute("count",count);
	   request.setAttribute("List", List);
	   
	   request.setAttribute("block", BLOCK);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("main_jsp", "../tripAll/trip_list.jsp");
	   return "../main/main.jsp"; 
  }
  
}
