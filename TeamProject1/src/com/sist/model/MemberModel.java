package com.sist.model;

import java.net.http.HttpResponse;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.HotelDAO;
import com.sist.dao.MemberDAO;
import com.sist.vo.HotelReplyVO;
import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

@Controller
public class MemberModel {
  @RequestMapping("member/join.do")
  public String member_join(HttpServletRequest request,HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../member/join.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("member/post_result.do")
  public String member_post(HttpServletRequest request,HttpServletResponse response)
  {
	  System.out.println("OK");
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex){}
	  String dong=request.getParameter("dong");
	  System.out.println(dong);
	  MemberDAO dao=MemberDAO.newInstance();
	  List<ZipcodeVO> list=dao.postFindData(dong);
	  request.setAttribute("list", list);
	  return "../member/post_result.jsp";
  }
  
  @RequestMapping("member/idcheck_result.do")
  public String idcheck(HttpServletRequest request,HttpServletResponse response)
  {
	  String id=request.getParameter("id");
	  MemberDAO dao=MemberDAO.newInstance();
	  int count=dao.idcheck(id);
	  request.setAttribute("count", count);
	  return "../member/idcheck_result.jsp";
  }
  
  @RequestMapping("member/join_ok.do")
  public String join_ok(HttpServletRequest request, HttpServletResponse response) {
	  /*
	   *ID       NOT NULL VARCHAR2(20)  
		PWD      NOT NULL VARCHAR2(10)  
		NAME     NOT NULL VARCHAR2(34)  
		SEX               VARCHAR2(10)  
		BIRTHDAY NOT NULL VARCHAR2(20)  
		EMAIL             VARCHAR2(100) 
		POST     NOT NULL VARCHAR2(10)  
		ADDR1    NOT NULL VARCHAR2(200) 
		ADDR2             VARCHAR2(200) 
		TEL               VARCHAR2(20)  
		CONTENT           CLOB          
		ADMIN             CHAR(1)  
	   * 
	   */
	  try {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
	  String name=request.getParameter("name");
	  String sex=request.getParameter("sex");
	  String birthday=request.getParameter("birthday");
	  String post=request.getParameter("post");
	  String addr1=request.getParameter("addr1");
	  String addr2=request.getParameter("addr2");
	  String tel=request.getParameter("tel");
	  String content=request.getParameter("content");
	  String email=request.getParameter("email");
	  
	  MemberVO vo=new MemberVO();
	  vo.setAddr1(addr1);
	  vo.setAddr2(addr2);
	  vo.setBirthday(birthday);
	  vo.setContent(content);
	  vo.setEmail(email);
	  vo.setId(id);
	  vo.setPost(post);
	  vo.setPwd(pwd);
	  vo.setTel(tel);
	  vo.setSex(sex);
	  vo.setName(name);
	  
	  //DAO전송
	  MemberDAO dao=MemberDAO.newInstance();
	  dao.memberJoin(vo);
	  return "redirect:../main/main.do";
	
  }
  //id,pwd확인, session저장
  @RequestMapping("member/login.do")
  public String member_login(HttpServletRequest request,HttpServletResponse response) {
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
	  System.out.println(id);
	  System.out.println(pwd);
	  MemberDAO dao=MemberDAO.newInstance();
	  String result=dao.isLogin(id, pwd);
	  System.out.println(result);
	  if(!(request.equals("NOID")||request.equals("NOPWD"))) {
		  StringTokenizer st=new StringTokenizer(result,"|");
		  String name=st.nextToken();
		  String admin=st.nextToken();
		  result="OK";
		  HttpSession session=request.getSession();
		  session.setAttribute("id", id);
		  session.setAttribute("name", name);
		  session.setAttribute("admin", admin);
	  }
	  request.setAttribute("result", result);
	  
	  return "../member/login_ok.jsp";
  }
 
  //로그아웃 (Session에 저장된 내용 해제)
  @RequestMapping("member/logout.do")
  public String memberLogout(HttpServletRequest request,HttpServletResponse response) {
	  HttpSession session=request.getSession();
	  session.invalidate();
	  return "redirect:../main/main.do";
  }
  
  //마이페이지 조회
  @RequestMapping("mypage/list.do")
  public String mypage_list(HttpServletRequest request,HttpServletResponse response) {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  
	  MemberDAO dao=MemberDAO.newInstance();
	  
	  MemberVO vo=dao.memberAllData();
	  
	  request.setAttribute("vo", vo);
	  request.setAttribute("pwd", vo.getPwd());
	   request.setAttribute("name", vo.getName());
	   request.setAttribute("birthday", vo.getBirthday());
	   request.setAttribute("email", vo.getEmail());
	   request.setAttribute("post", vo.getPost());
	   request.setAttribute("addr1", vo.getAddr1());
	   request.setAttribute("addr2", vo.getAddr2());
	   request.setAttribute("tel", vo.getTel());
	   request.setAttribute("content", vo.getContent());

	   
	   request.setAttribute("main_jsp", "../mypage/mypage.jsp");
	  return "../main/main.jsp";
  }
  
 // 마이페이지 수정
  @RequestMapping("mypage/mypage_update.do")
  public String mypage_update(HttpServletRequest request,HttpServletResponse response) {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  String pwd=(String)session.getAttribute("pwd");
	  String name=(String)session.getAttribute("name");
	  String sex=(String)session.getAttribute("sex");
	  String birthday=(String)session.getAttribute("birthday");
	  String email=(String)session.getAttribute("email");
	  String post=(String)session.getAttribute("post");
	  String addr1=(String)session.getAttribute("addr1");
	  String addr2=(String)session.getAttribute("addr2");
	  String tel=(String)session.getAttribute("tel");
	  String content=(String)session.getAttribute("content");	  
	  
	  request.setAttribute("id", id);
	  request.setAttribute("pwd", pwd);
	  request.setAttribute("name", name);
	  request.setAttribute("sex", sex);
	  request.setAttribute("birthday", birthday);
	  request.setAttribute("email", email);
	  request.setAttribute("post", post);
	  request.setAttribute("addr1", addr1);
	  request.setAttribute("addr2", addr2);
	  request.setAttribute("tel", tel);
	  request.setAttribute("content", content);
	  
	  return "../main/main.jsp";
  }
  
  
}









