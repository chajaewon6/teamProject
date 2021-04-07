package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int curpage=Integer.parseInt(page);
		List<BoardVO> mList=dao.boardMainData(curpage);
		
		
		// 토탈페이지
		int count=dao.boardCount();
		int totalPage=(int)(Math.ceil(count/3.0));
		
		// 페이지 나누기 
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=startPage + (BLOCK-1);;
		if(endPage>totalPage)
			endPage=totalPage;
		
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("curpage", curpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("mList", mList);
		request.setAttribute("main_jsp", "../board/board_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("board/board_detail.do")
	public String board_detail(HttpServletRequest request, HttpServletResponse response)
	{
		BoardDAO dao=BoardDAO.newInstance();
		String no=request.getParameter("no");
		
		BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
		List<BoardReplyVO> rList = dao.boardReplyReadData(Integer.parseInt(no));
		
		
		
		
		request.setAttribute("vo", vo);
		request.setAttribute("rList", rList);
		request.setAttribute("no", no);
		request.setAttribute("main_jsp", "../board/board_detail.jsp");
		return "../main/main.jsp";
	}
	// 댓글쓰기
	@RequestMapping("board/board_reply_insert.do")
	public String board_reply_update(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {}
		
		String pno=request.getParameter("pno");
		String msg=request.getParameter("msg");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		BoardReplyVO vo=new BoardReplyVO();
		
		// dao 연결
		BoardDAO dao=BoardDAO.newInstance();
		// insert 실행
		vo.setPb_no(Integer.parseInt(pno));
		vo.setPbr_msg(msg);
		vo.setPbr_id(id);
		vo.setPbr_name(name);
		dao.replyInsertData(vo);
		
		return "redirect:../board/board_detail.do?no="+pno;
	}
	// 댓글 삭제
	@RequestMapping("board/board_reply_delete.do")
	public String board_reply_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		String pno=request.getParameter("pno");
		BoardDAO dao=BoardDAO.newInstance();
		dao.replyDeleteData(Integer.parseInt(no));
		
		return "redirect:../board/board_detail.do?no="+pno;
	}
	// 댓글 수정
	@RequestMapping("board/board_reply_update.do")
	public String board_reply_insert(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String no=request.getParameter("no");
		String pno=request.getParameter("pno");
		String msg=request.getParameter("msg");
		BoardDAO dao=BoardDAO.newInstance();
		BoardReplyVO vo=new BoardReplyVO();
		vo.setPbr_msg(msg);
		vo.setPbr_no(Integer.parseInt(no));
		dao.replyUpdateData(vo);
		
		return "redirect:../board/board_detail.do?no="+pno;
	}
	// 게시글 쓰기
	@RequestMapping("board/board_insert.do")
	public String board_insert(HttpServletRequest request, HttpServletResponse response)
	{
		
		request.setAttribute("main_jsp", "../board/board_insert.jsp");
		return "../main/main.jsp";
	}
	// 게시글 올리기
	@RequestMapping("board/board_insert_ok.do")
	public String board_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String content=request.getParameter("content");
		String title=request.getParameter("title");
		String tag=request.getParameter("tag");
		String loc=request.getParameter("loc");
		String pic=request.getParameter("pic");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		/*
		 * ps.setString(1, vo.getPb_picTitle());
				ps.setString(2, vo.getPb_picContent());
				ps.setString(3, vo.getPb_picLoc());
				ps.setString(4, vo.getPb_picTag());
				ps.setString(5, vo.getUser_id());
				ps.setString(6, vo.getPb_pic());
				ps.setString(7, vo.getUser_name());
		 * 
		 */
		BoardVO vo=new BoardVO();
		vo.setPb_picContent(content);
		vo.setPb_picTitle(title);
		vo.setPb_picTag(tag);
		vo.setUser_id(id);
		vo.setUser_name(name);
		vo.setPb_pic(pic);
		vo.setPb_picLoc(loc);
		
		BoardDAO dao=BoardDAO.newInstance();
		dao.boardInsertData(vo);
		
		return "../board/board_main.do";
	}
	
	@RequestMapping("board/board_delete.do")
	public String board_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		dao.boardDeleteData(Integer.parseInt(no));
		
		
		return "redirect:../board/board_main.do";
	}
	
}















