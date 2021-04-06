package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.dao.TripDAO;

import com.sist.vo.TripCategoryVO;
import com.sist.vo.TripJjimVO;
import com.sist.vo.TripVO;

@Controller
public class TripModel {	
	
	
  @RequestMapping("trip/trip_list.do")
  public String trip_list(HttpServletRequest request,HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
			page="1";
	  String cno=request.getParameter("cno");
	   if(page==null)
	      page="1";
	   int curpage=Integer.parseInt(page); //현재 페이지
	   int cno1=Integer.parseInt(cno);
	   TripDAO dao=TripDAO.newInstance();
	   List<TripVO> tList=dao.tripListData(cno1,curpage);
	   
	   TripCategoryVO tvo=dao.TripInfoData(cno1);
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
	   request.setAttribute("tList", tList);
	   
	   request.setAttribute("tvo", tvo);
	   request.setAttribute("block", BLOCK); //여기서부턴 페이지관련 보내기
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("cno", cno);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("main_jsp", "../trip/trip_list.jsp");
	   return "../main/main.jsp"; 
  }
  
  
  @RequestMapping("trip/detail_before.do")
  public String detail_before(HttpServletRequest request,HttpServletResponse response)
  {
     String no=request.getParameter("no");
     System.out.println(no);
     Cookie cookie=new Cookie("m"+no, no);// 문자열만 저장이 가능 
     cookie.setMaxAge(60*60);
     cookie.setPath("/");
     response.addCookie(cookie);
     return "redirect:../trip/trip_detail.do?no="+no;
  }
  
  
  
  
  @RequestMapping("trip/trip_detail.do")
  public String trip_detail(HttpServletRequest request,HttpServletResponse response)
  {
	  String no=request.getParameter("no"); //no=게시물 번호
	  // DAO연결 
	  TripDAO dao=TripDAO.newInstance();
	  TripVO tvo=dao.TripDetailData(Integer.parseInt(no));
	  
	  String s=tvo.getAddr();
	  s=s.substring(s.indexOf(" "), s.lastIndexOf("("));
	  tvo.setAddress(s);
	 
	  
	  //List<TripVO> Llist=dao.TripLocationData(vo);
	  //List<FoodReplyVO> rList=dao.foodReplyReadData(Integer.parseInt(no));
	  //request.setAttribute("rList", rList);
	  //request.setAttribute("Llist", Llist);
	  
	  request.setAttribute("tvo", tvo);
	  request.setAttribute("main_jsp", "../trip/trip_detail.jsp");
	  
	  //HttpSession session=request.getSession();
	  //String id=(String)session.getAttribute("id"); 
	  //int count=dao.foodJjimCheck(Integer.parseInt(no), id);
	  //request.setAttribute("count", count);
	  return "../main/main.jsp";
  }
  
  
  
  // 쿠키
  @RequestMapping("main/main.do")
  public String main_home(HttpServletRequest request,HttpServletResponse response)
  {
	  // 쿠키 
	  List<TripVO> fList=new ArrayList<TripVO>();
	  
	  TripDAO dao=TripDAO.newInstance();
	  
	  Cookie[] cookies=request.getCookies();
	  if(cookies!=null)
	  {
		  for(int i=cookies.length-1;i>=0;i--)
		  {
			  if(cookies[i].getName().startsWith("m"))
			  {
				  cookies[i].setPath("/");
				  System.out.println(cookies[i].getName());
				  String no=cookies[i].getValue();
				  TripVO vo=dao.tripCookieData(Integer.parseInt(no));
				  fList.add(vo);
			  }
		  }
	  }
	  request.setAttribute("fList", fList);
	  List<TripCategoryVO> cList=dao.tripCategoryData();
	  request.setAttribute("cList", cList);
	  request.setAttribute("main_jsp", "../trip/trip_detail.jsp");
	  return "../main/main.jsp";
  }
 
  
  @RequestMapping("trip/location.do")
  public String trip_location(HttpServletRequest request,HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../trip/location.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("trip/location_result.do")
  public String trip_location_result(HttpServletRequest request,HttpServletResponse response)
  {
	  String[] guList_1 = { "전체", "강서구", "양천구", "구로구", "마포구", "영등포구", "금천구",
			    "은평구", "서대문구", "동작구", "관악구", "종로구", "중구", "용산구", "서초구", "강북구",
			    "성북구", "도봉구", "동대문구", "성동구", "강남구", "노원구", "중랑구", "광진구", "송파구",
			    "강동구" };
	  String no=request.getParameter("no");
	  String gu=guList_1[Integer.parseInt(no)];
	  System.out.println(gu);
	  TripDAO dao=TripDAO.newInstance();
	  List<TripVO> list=dao.tripLocationFind(gu);
	
	  request.setAttribute("list", list);
	  return "../trip/location_result.jsp";
  }
  //찜하기
  @RequestMapping("trip/jjim.do")
  public String trip_jjim(HttpServletRequest request,HttpServletResponse response) {
	  String no=request.getParameter("no");
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  
	  TripDAO dao=TripDAO.newInstance();
	  dao.TripJjimInsert(Integer.parseInt(no), id);
	  return "redirect:../trip/trip_detail.do?no="+no;
  }
  
  //마이페이지 설정
  @RequestMapping("trip/mypage.do")
  public String trip_mypage(HttpServletRequest request,HttpServletResponse response) {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  TripDAO dao=TripDAO.newInstance();
	  //찜하기 목록
	  List<TripJjimVO> jList=dao.TripJjimListData(id);
	  List<TripVO> fList=new ArrayList<TripVO>();
	  for(TripJjimVO vo:jList) {
		  TripVO fvo=dao.TripDetailData(vo.getCno());
		  String poster=fvo.getPoster();
		  poster=poster.substring(0,poster.indexOf("^"));
		  fvo.setPoster(poster);
		  fList.add(fvo);
	  }
	  request.setAttribute("fList", fList);
	  request.setAttribute("jList", jList);
	  return "../main/main.jsp";
  }
  
  
}










