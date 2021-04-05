package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.dao.HotelDAO;

import com.sist.vo.HotelCategoryVO;
import com.sist.vo.HotelReplyVO;
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
		  List<HotelReplyVO> rList=dao.HotelReplyReadData(Integer.parseInt(no));
		  request.setAttribute("rList", rList);
		  request.setAttribute("fList", fList);
		  HotelVO vo=dao.HotelDetailData(Integer.parseInt(no));
		  response.addCookie(cookie);
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../hotel/detail.jsp");
		  
		  /*
		   *  HttpSession session=request.getSession();
			  String id=(String)session.getAttribute("id");
			  int count=dao.foodJjimCheck(Integer.parseInt(no), id);
			  request.setAttribute("count", count);
		   */
		  
		  return "../main/main.jsp";
	  }
	
	@RequestMapping("hotel/hotel_reply_insert.do")
	  public String hotel_reply_insert(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 댓글 데이터 받기
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String cno=request.getParameter("cno");
		  String msg=request.getParameter("msg");
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  String name=(String)session.getAttribute("name");
		  HotelReplyVO vo=new HotelReplyVO();
		  vo.setName(name);
		  vo.setMsg(msg);
		  vo.setId(id);
		  vo.setCno(Integer.parseInt(cno));
		  // DAO연결
		  HotelDAO dao=HotelDAO.newInstance();
		  dao.HotelReplyInsert(vo);
		  return "redirect:../hotel/detail.do?no="+cno;
	  }
	 // 댓글 삭제
	  @RequestMapping("hotel/hotel_reply_delete.do")
	  public String hotel_reply_delete(HttpServletRequest request,HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  String cno=request.getParameter("cno");
		  HotelDAO dao=HotelDAO.newInstance();
		  // DB연동
		  dao.HotelReplyDelete(Integer.parseInt(no));
		  return "redirect:../hotel/detail.do?no="+cno;
	  }
	  // 댓글 수정
	  @RequestMapping("hotel/hotel_reply_update.do")
	  public String hotel_reply_update(HttpServletRequest request,HttpServletResponse response)
	  {
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  String msg=request.getParameter("msg");
		  String no=request.getParameter("no");
		  String cno=request.getParameter("cno");
		  HotelReplyVO vo=new HotelReplyVO();
		  vo.setNo(Integer.parseInt(no));
		  vo.setMsg(msg);
		  
		  HotelDAO dao=HotelDAO.newInstance();
		  dao.HotelReplyUpdate(vo);
		  return "redirect:../hotel/detail.do?no="+cno;
	  }
	  // 찜하기
	  @RequestMapping("hotel/jjim.do")
	  public String food_jjim(HttpServletRequest request,HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  HotelDAO dao=HotelDAO.newInstance();
		  // 저장
		  dao.HotelJjimInsert(Integer.parseInt(no), id);
		  return "redirect:../food/food_detail.do?no="+no;
	  }
	
	
}
