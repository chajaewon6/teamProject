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
	  String page=request.getParameter("page");
	  String cno=request.getParameter("cno");
	   if(page==null)
	      page="1";
	   int curpage=Integer.parseInt(page); //현재 페이지
	   int cno1=Integer.parseInt(cno);
	   TripDAO dao=TripDAO.newInstance();
	   List<TripVO> rList=dao.tripListData(cno1,curpage); // 그림 파일 배열로 가져올거라 rList 씀
	   int count=dao.tripCount(cno1); //총갯수 가져옴
	   int totalpage=(int)(Math.ceil(count/8.0)); // 12개씩 출력이니까 
	   
	   final int BLOCK=10;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   // 1~10 => 1  10-1/10=>0 9/10  0.9인데 int는 소수점버리니까 0
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 10개단위
	   // 1~10 =>10 
	   // 11~10 => 11~20
	   
	   if(endPage>totalpage)     //102일 때 10개 출력이 아닌 [101],[102]만 출력하기위한 코드
		   endPage=totalpage;
	   
	   request.setAttribute("count",count);
	   request.setAttribute("rList", rList);
	   
	   request.setAttribute("block", BLOCK); //여기서부턴 페이지관련 보내기
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("cno", cno);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("main_jsp", "../trip/trip_list.jsp");
	   return "../main/main.jsp"; 
  }
  
  
  
  
}
