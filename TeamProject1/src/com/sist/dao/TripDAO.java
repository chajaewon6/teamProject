package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*; // lookup 

import com.sist.vo.*;
public class TripDAO {
	// 연결 객체 
	private Connection conn;
	private PreparedStatement ps;
	// 미리 생성된 Connection객체 읽기
	private static TripDAO dao;
	public void getConnection()
	{
		try
		{
			// JNDI초기화 : 탐색기를 연다
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
			// 이 과정이 connection pull 
		} catch (Exception ex) {
			
		}
	}
	// 사용후에 반환
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception ex) {}
	}
	// dao객체를 클라이언트당 1개씩만 사용 => 싱글턴 / 메모리 공간 하나만 써야하기 때문에 반드시 static
		public static TripDAO newInstance()
		{
			if(dao==null) // 없으면 생성
				dao=new TripDAO();
			// 있으면 있는거 사용
			return dao;
		}
	public List<TripVO> tripMainData()
	{
		List<TripVO> list=new ArrayList<TripVO>();
		try
		{
			getConnection();
			for(int i=1; i<=9; i++)
			{
				String sql="SELECT no, cno, poster, title, addr,rownum "
						+"FROM (SELECT no, cno, poster, title, addr "
						+"FROM tripdetail WHERE cno="+i+") "
						+"WHERE rownum=1 "
						+"ORDER BY no ASC";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					TripVO vo=new TripVO();
					vo.setNo(rs.getInt(1));
					vo.setCno(rs.getInt(2));
					vo.setPoster(rs.getString(3));
					vo.setTitle(rs.getString(4));
					vo.setAddr(rs.getString(5));
					list.add(vo);
				}
				rs.close();
				ps.close();
			}
			
			
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return list;
	}
	
	
	
	
	// 상세보기 목록 출력 DB
	public List<TripVO> tripListData(int page) 
	   {
		   List<TripVO> list=new ArrayList<TripVO>();
		 
		   try
		   {
			   getConnection();
			   String sql="SELECT no,poster,title,content,num "
					   +"FROM (SELECT no,poster,title,content,rownum as num "
					   +"FROM (SELECT no,poster,title,content "
					   +"FROM tripdetail ORDER BY no ASC)) "
					   +"WHERE num BETWEEN ? AND ? ";
			   ps=conn.prepareStatement(sql);
			   int rowSize=8;   
			   int start=(rowSize*page)-(rowSize-1);
			   int end=rowSize*page;  // 
			   ps.setInt(1, start);
			   ps.setInt(2, end);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   TripVO vo=new TripVO();
				   
				   list.add(vo);
			   }
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return list;
	   }
	
	// 총갯수
	   public int tripCount(int cno) 
	   {
		   int count=0;
		   try
		   {
			   getConnection(); 
			   String sql="SELECT COUNT(*) FROM tripdetail "
			   		+ "WHERE cno=?";
			   ps=conn.prepareStatement(sql); //SQL문 실행
			   ps.setInt(1, cno);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   count=rs.getInt(1);
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return count;
	   }
		

		// 쿠키 출력
	public TripVO tripCookieData(int no)
	{
			TripVO vo=new TripVO();
		try
		{
			getConnection();
			String sql="SELECT no, cno, poster "
					+"FROM tripdetail "
					+"WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setCno(rs.getInt(2));
			vo.setPoster(rs.getString(3));
			rs.close();
		} 
		catch (Exception ex) 
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return vo;
	}

}

















