package com.sist.dao;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.*;
import com.sist.vo.*;
public class BoardDAO {
	// 연결 객체
		private Connection conn;
		// SQL문장 전송
		private PreparedStatement ps;
		// 미리 생성된 Connection 객체 읽기
		private static BoardDAO dao;
		public void getConnection()
		{
			try
			{
				// JNDI초기화 : 탐색기를 연다
				Context init=new InitialContext();
				Context c=(Context)init.lookup("java://comp/env");
				DataSource ds=(DataSource)c.lookup("jdbc/oracle");
				conn=ds.getConnection();
			}catch(Exception ex) {}
		}
		// 사용후에 반환
		public void disConnection()
		{
			try
			{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception ex) {}
		}
		// DAO 객체를 클라이언트당 1개씩만 사용 => 싱글턴
		public static BoardDAO newInstance()
		{
			if(dao==null)
				dao=new BoardDAO();
			
			return dao;	
		}
		
		// 메인 띄우기 
		public List<BoardVO> boardMainData(int page)
		{
			List<BoardVO> mList=new ArrayList<BoardVO>();
			try
			{
				getConnection();
				
				String sql="SELECT pb_no, pb_pictitle, pb_picdate, pb_piccontent, pb_picLoc, pb_picHit, pb_picHeart,pb_picTag, user_id, mno, pb_pic, num "
						+"FROM (SELECT pb_no, pb_pictitle, pb_picdate, pb_piccontent, pb_picLoc, pb_picHit, pb_picHeart, pb_picTag, user_id, mno, pb_pic, rownum as num " 
						+"FROM (SELECT pb_no, pb_pictitle, pb_picdate, pb_piccontent, pb_picLoc, pb_picHit, pb_picHeart, pb_picTag, user_id, mno, pb_pic "
						+"FROM picBoard)) "
						+"WHERE num BETWEEN ? AND ?";
				ps=conn.prepareStatement(sql);
				int rowSize=3;
				int start =(page*rowSize)-(rowSize-1);
				int end=page*rowSize;
				ps.setInt(1, start);
				ps.setInt(2, end);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					BoardVO vo=new BoardVO();
					vo.setPb_no(rs.getInt(1));
					vo.setPb_picTitle(rs.getString(2));
					vo.setPb_picDate(rs.getDate(3));
					vo.setPb_picContent(rs.getString(4));
					vo.setPb_picLoc(rs.getString(5));
					vo.setPb_picHit(rs.getInt(6));
					vo.setPb_picHeart(rs.getInt(7));
					vo.setPb_picTag(rs.getString(8));
					vo.setUser_id(rs.getString(9));
					vo.setMno(rs.getInt(10));
					vo.setPb_pic(rs.getString(11));
					
					mList.add(vo);
				}
				rs.close();
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
			finally
			{
				disConnection();
			}
			return mList;
		}
		// 총페이지 구하기
		public int boardCount()
		{
			int count =0;
			try
			{
				getConnection();
				String sql="SELECT COUNT(*) FROM picBoard ";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				count=rs.getInt(1);
				
			}
			catch (Exception ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				disConnection();
			}
			return count;
		}
		// 디테일 데이터
		public BoardVO boardDetailData(int no)
		{
			BoardVO vo=new BoardVO();
			try
			{
				getConnection();
				
				// 조회수 증가
				String sql="UPDATE picboard SET "
						+"pb_picHit=pb_pichit+1 "
						+"WHERE pb_no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
				
				/*
				 * 	PB_NO         NOT NULL NUMBER         
					PB_PICTITLE   NOT NULL VARCHAR2(200)  
					PB_PICDATE             DATE           
					PB_PICCONTENT NOT NULL VARCHAR2(1000) 
					PB_PICLOC     NOT NULL VARCHAR2(100)  
					PB_PICHIT              NUMBER         
					PB_PICHEART            NUMBER         
					PB_PICTAG              VARCHAR2(100)  
					USER_ID       NOT NULL VARCHAR2(20)   
					MNO           NOT NULL NUMBER         
					PB_PIC                 VARCHAR2(4000) 
				 * 
				 */
				sql="SELECT pb_pictitle, pb_picdate, pb_piccontent, pb_picloc, pb_pichit, pb_picheart, pb_pictag, user_id, mno, pb_pic "
						+"FROM picboard "
						+"WHERE pb_no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ResultSet rs=ps.executeQuery();
				rs.next();
				vo.setPb_picTitle(rs.getString(1));
				vo.setPb_picDate(rs.getDate(2));
				vo.setPb_picContent(rs.getString(3));
				vo.setPb_picLoc(rs.getString(4));
				vo.setPb_picHit(rs.getInt(5));
				vo.setPb_picHeart(rs.getInt(6));
				vo.setPb_picTag(rs.getString(7));
				vo.setUser_id(rs.getString(8));
				vo.setMno(rs.getInt(9));
				vo.setPb_pic(rs.getString(10));
				
				
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
			finally
			{
				disConnection();
			}
			return vo;
		}
		// 댓글 읽기
		public List<BoardReplyVO> boardReplyReadData(int pb_no)
		{
			/*
			 *  PBR_NO      NOT NULL NUMBER         
				PBR_ID      NOT NULL VARCHAR2(20)   
				PBR_NAME    NOT NULL VARCHAR2(30)   
				PBR_MSG     NOT NULL VARCHAR2(1000) 
				PBR_REGDATE          DATE           
				PB_NO       NOT NULL NUMBER   
			 */
			List<BoardReplyVO> list=new ArrayList<BoardReplyVO>();
			try
			{
				getConnection();
				String sql="SELECT pbr_no, pbr_id, pbr_name, pbr_msg, TO_CHAR(pbr_regdate,'YYYY-MM-DD HH24:MI:SS') "
						+"FROM picboardreply "
						+"WHERE pb_no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, pb_no);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					BoardReplyVO vo=new BoardReplyVO();
					vo.setPbr_no(rs.getInt(1));
					vo.setPbr_id(rs.getString(2));
					vo.setPbr_name(rs.getString(3));
					vo.setPbr_msg(rs.getString(4));
					vo.setDbday(rs.getString(5));
					
					list.add(vo);
				}
				
			} 
			catch (Exception ex) 
			{
				
			}
			finally
			{
				disConnection();
			}
			return list;
		}
		// 댓글 쓰기
		public void replyInsertData(BoardReplyVO vo)
		{
			try
			{
				getConnection();
				/*
				 * 	PBR_NO      NOT NULL NUMBER         
					PBR_ID      NOT NULL VARCHAR2(20)   
					PBR_NAME    NOT NULL VARCHAR2(30)   
					PBR_MSG     NOT NULL VARCHAR2(1000) 
					PBR_REGDATE          DATE           
					PB_NO       NOT NULL NUMBER  

				 */
				String sql="INSERT INTO picboardreply VALUES(pbr_no_seq.nextval,?,?,?,SYSDATE,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getPbr_id());
				ps.setString(2, vo.getPbr_name());
				ps.setString(3, vo.getPbr_msg());
				ps.setInt(4, vo.getPb_no());
				ps.executeUpdate();
			} 
			catch (Exception ex) {
				ex.printStackTrace();
			}
			finally
			{
				disConnection();
			}
		}
		// 댓글 삭제
		public void replyDeleteData(int pbr_no)
		{
			try
			{
				getConnection();
				String sql="DELETE FROM picboardreply WHERE pbr_no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, pbr_no);
				ps.executeUpdate();
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			finally
			{
				disConnection();
			}
		}
		// 댓글 수정
		public void replyUpdateData (BoardReplyVO vo)
		{
			try
			{
				getConnection();
				String sql="UPDATE picboardreply SET "
						+"msg=? "
						+"WHERE pbr_no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getPbr_msg());
				ps.setInt(2, vo.getPbr_no());
				
				ps.executeUpdate();
			} 
			catch (Exception ex) {
				ex.printStackTrace();
			}
			finally
			{
				disConnection();
			}
		}
}















