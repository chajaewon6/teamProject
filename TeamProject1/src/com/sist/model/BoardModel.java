package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
import java.io.*;
import java.net.http.HttpResponse;
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
			String path="C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\TeamProject1\\upload\\";
			int size=1024*1024*100;
			String enctype="UTF-8";
			// 업로드
			MultipartRequest mr=new MultipartRequest(request, path, size, enctype,
					new DefaultFileRenamePolicy());
			// 데이터 받기
			
			String content=mr.getParameter("content");
			String title=mr.getParameter("title");
			String tag=mr.getParameter("tag");
			String loc=mr.getParameter("loc");
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			String name=(String)session.getAttribute("name");
			
			
			
			BoardVO vo=new BoardVO();
			vo.setPb_picContent(content);
			vo.setPb_picTitle(title);
			vo.setPb_picTag(tag);
			vo.setUser_id(id);
			vo.setUser_name(name);
			vo.setPb_picLoc(loc);
			
			String filename=mr.getOriginalFileName("upload");
			if(filename==null)
			{
				vo.setFilename("");
				vo.setFilesize(0);
			}
			else
			{
				File file=new File(path+filename);
				vo.setFilename(filename);
				vo.setFilesize((int)file.length());
				
			}
			String pic=filename;
			vo.setPb_pic(pic);
			BoardDAO dao=BoardDAO.newInstance();
			dao.boardInsertData(vo);
			
		} catch (Exception e) {}
		return "redirect:../board/board_main.do";
	}
	
	@RequestMapping("board/board_delete.do")
	public String board_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		dao.boardDeleteData(Integer.parseInt(no));
		return "redirect:../board/board_main.do";
	}
	// 수정 화면
	@RequestMapping("board/board_update.do")
	public String board_update(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.boardDetailData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("no", no);
		request.setAttribute("main_jsp", "../board/board_update.jsp");
		return "../main/main.jsp";
	}
	// 수정 처리
	 @RequestMapping("board/board_update_ok.do") 
	 public String board_update_ok(HttpServletRequest request, HttpServletResponse response)
	 {
		 String url="";
		 try
		 {
			 request.setCharacterEncoding("UTF-8");
				String path="C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\TeamProject1\\upload\\";
				int size=1024*1024*100;
				String enctype="UTF-8";
				// 업로드
				MultipartRequest mr=new MultipartRequest(request, path, size, enctype,
						new DefaultFileRenamePolicy());
				// 데이터 받기
				
				String content=mr.getParameter("content");
				String title=mr.getParameter("title");
				String tag=mr.getParameter("tag");
				String loc=mr.getParameter("loc");
				HttpSession session=request.getSession();
				String id=(String)session.getAttribute("id");
				String name=(String)session.getAttribute("name");
				String no=mr.getParameter("no");
				/*
				 * ps.setString(1, vo.getPb_picTitle());
					ps.setString(2, vo.getPb_picContent());
					ps.setString(3, vo.getPb_picTag());
					ps.setInt(4, vo.getPb_no());
				 * 
				 */
				BoardVO vo=new BoardVO();
				vo.setPb_picContent(content);
				vo.setPb_picTitle(title);
				vo.setPb_picTag(tag);
				vo.setUser_id(id);
				vo.setUser_name(name);
				vo.setPb_picLoc(loc);
				vo.setPb_no(Integer.parseInt(no));
				
				String filename=mr.getOriginalFileName("upload");
				if(filename==null)
				{
					vo.setFilename("");
					vo.setFilesize(0);
				}
				else
				{
					File file=new File(path+filename);
					vo.setFilename(filename);
					vo.setFilesize((int)file.length());
					
				}
				String pic=filename;
				vo.setPb_pic(pic);
				BoardDAO dao=BoardDAO.newInstance();
				dao.boardUpdateData(vo);
				url="redirect:../board/board_detail.do?no="+no;
		 }catch(Exception ex) {}
		
		
		 return url;
	 }
}















