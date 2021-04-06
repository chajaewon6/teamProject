package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

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
import com.sist.vo.ReserveVO;




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
		  
		  
		     HttpSession session=request.getSession();
			  String id=(String)session.getAttribute("id");
			  int count=dao.HotelJjimCheck(Integer.parseInt(no), id);
			  request.setAttribute("count", count);
		   
		  
		  return "../main/main.jsp";
	  }
	// 댓글쓰기
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
	  public String hotel_jjim(HttpServletRequest request,HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  HotelDAO dao=HotelDAO.newInstance();
		  // 저장
		  dao.HotelJjimInsert(Integer.parseInt(no), id);
		  return "redirect:../hotel/detail.do?no="+no;
	  }
	  @RequestMapping("hotel/reserve.do")
	  public String hotel_reserve(HttpServletRequest request,HttpServletResponse response)
	  {
		  request.setAttribute("main_jsp", "../hotel/reserve.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("hotel/reserve_hoteldetail.do")
	  public String reserve_hoteldetail(HttpServletRequest request,HttpServletResponse response)
	  {
		  HotelDAO dao=HotelDAO.newInstance();
		  List<HotelVO> list=dao.HotelReserveAllData();
		  request.setAttribute("list", list);
		  return "../hotel/reserve_hoteldetail.jsp";
	  }
	  
	  @RequestMapping("hotel/date.do")
	  public String hotel_date(HttpServletRequest request,HttpServletResponse response)
	  {
		   String strYear=request.getParameter("year");
		   String strMonth=request.getParameter("month");
		   
		   String today=new SimpleDateFormat("yyyy-M-d").format(new Date());
		   StringTokenizer st=new StringTokenizer(today,"-");
		   
		   String sy=st.nextToken();
		   String sm=st.nextToken();
		   String sd=st.nextToken();
		   
		   if(strYear==null)
			   strYear=sy;
		   if(strMonth==null)
			   strMonth=sm;
		   
		   int year=Integer.parseInt(strYear);
		   int month=Integer.parseInt(strMonth);
		   int day=Integer.parseInt(sd);
		   
		   
		   String[] strWeek={"일","월","화","수","목","금","토"};
		   
		   int total=(year-1)*365
				    +(year-1)/4
				    -(year-1)/100
				    +(year-1)/400;
		   
		   int[] lastDay={31,28,31,30,31,30,
				          31,31,30,31,30,31};
		   
		   if((year%4==0 && year%100!=0)||(year%400==0))
			   lastDay[1]=29;
		   else
			   lastDay[1]=28;
			
		   for(int i=0;i<month-1;i++)
		   {
			   total+=lastDay[i];
		   }
		   
		   total++;
		   
		   int week=total%7;
		   
		   String no=request.getParameter("no");
		   HotelDAO dao=HotelDAO.newInstance();
		   String rday=dao.HotelReserveDate(Integer.parseInt(no));
		   /*
		    *    1,2,3,4,5,6,7,8,10
		    *    int[] arr=new int[10];
		    *    
		    *    arr[0]=11
		    *    arr[1]=21
		    *    arr[2]=31
		    *    --
		    *    arr[9]=10
		    *    
		    *    int[] arr={1,2,3,4,5,6,7}
		    *    int[] arr1={0,2,0,0,5,0,0}
		    *    
		    *    arr[i]==arr1[i] 2,5
		    */
		   
		   int[] days=new int[31];
		   if(rday!=null)
		   {
			   // 1,2,3,7,8,10...
			   StringTokenizer st1=new StringTokenizer(rday,",");
			   System.out.println(st1);
			   while(st1.hasMoreTokens())
			   {
				  int p=Integer.parseInt(st1.nextToken());// 31
				  if(p>=day)
				  {
				     days[p-1]=p;
				  }
			   }
		   }
		   request.setAttribute("days", days);
		   request.setAttribute("lastday", lastDay[month-1]);
		   request.setAttribute("week", week);
		   request.setAttribute("year", year);
		   request.setAttribute("month", month);
		   request.setAttribute("day", day);
		   request.setAttribute("strWeek", strWeek);
		   
		   return "../hotel/date.jsp";
	  }
	  @RequestMapping("hotel/intime.do")
	  public String hotel_intime(HttpServletRequest request,HttpServletResponse response) 
	  {
		  String day=request.getParameter("day");
		  // 시간을 읽어 온다 => 오라클 
		  HotelDAO dao=HotelDAO.newInstance();
		  String tno=dao.HotelReserveTimeData(Integer.parseInt(day));
		  // 1="09:00",2,3,9,11
		  List<String> list=new ArrayList<String>();
		  StringTokenizer st=new StringTokenizer(tno,",");
		  while(st.hasMoreTokens())
		  {
			  String t=st.nextToken();
			  int i=Integer.parseInt(t);
			  String time=dao.HotelReserveInTime(i);
			  list.add(time);
		  }
		  
		  request.setAttribute("list", list);
		  return "../hotel/intime.jsp";
	  }
	  @RequestMapping("hotel/outtime.do")
	  public String hotel_outtime(HttpServletRequest request,HttpServletResponse response) 
	  {
		  String day=request.getParameter("day");
		  // 시간을 읽어 온다 => 오라클 
		  HotelDAO dao=HotelDAO.newInstance();
		  String tno=dao.HotelReserveTimeData(Integer.parseInt(day));
		  // 1="09:00",2,3,9,11
		  List<String> list=new ArrayList<String>();
		  StringTokenizer st=new StringTokenizer(tno,",");
		  while(st.hasMoreTokens())
		  {
			  String t=st.nextToken();
			  int i=Integer.parseInt(t);
			  String time=dao.HotelReserveOutTime(i);
			  list.add(time);
		  }
		  
		  request.setAttribute("list", list);
		  return "../hotel/outtime.jsp";
	  }
	 
}
