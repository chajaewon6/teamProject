
package com.sist.dao;

import java.util.*;
import javax.sql.*;

import com.sist.vo.HotelCategoryVO;
import com.sist.vo.HotelVO;

import java.sql.*;
import javax.naming.*;
public class HotelDAO {
	// 연결 객체
	private Connection conn;
	// SQL문장 전송
	private PreparedStatement ps;
	// 미리 생성된 Connection 객체 읽기
	private static HotelDAO dao;
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
	public static HotelDAO newInstance()
	{
		if(dao==null)
			dao=new HotelDAO();
		
		return dao;	
	}
	// Category 읽기
	public List<HotelCategoryVO> HotelListData()
	  {
		  List<HotelCategoryVO> list=new ArrayList<HotelCategoryVO>();
		  try
		  {
			  getConnection();
			  // 인기순위(10) , 공지사항 5개...
			  String sql="SELECT no,poster,title,star,grade,addr,category,price "
					    +"FROM hotel_detail "
					    +"ORDER BY no ASC";
			  ps=conn.prepareStatement(sql);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  HotelCategoryVO vo=new HotelCategoryVO();
				  vo.setNo(rs.getInt(1));
				  vo.setPoster(rs.getString(2));
				  vo.setTitle(rs.getString(3));
				  vo.setStar(rs.getString(4));
				  vo.setGrade(rs.getString(5));
				  vo.setAddr(rs.getString(6));
				  vo.setCategory(rs.getString(7));
				  vo.setPrice(rs.getString(8));
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
	// Category Data
	
	public List<HotelVO> HotelData(int cno)
	{
		List<HotelVO> list=new ArrayList<HotelVO>();
		try
		{
			getConnection();
			String sql="SELECT no,poster,title,star,grade,addr,category,price "
					  +"FROM hotel_detail "
					  +"WHERE cno=? "
					  +"ORDER BY no ASC";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				HotelVO vo=new HotelVO();
				  vo.setNo(rs.getInt(1));
				  vo.setPoster(rs.getString(2));
				  vo.setTitle(rs.getString(3));
				  vo.setStar(rs.getString(4));
				  vo.setGrade(rs.getString(5));
				  vo.setAddr(rs.getString(6));
				  vo.setCategory(rs.getString(7));
				  vo.setPrice(rs.getString(8));
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
	
	public HotelCategoryVO HotelInfoData(int cno)
	{
		HotelCategoryVO vo=new HotelCategoryVO();
		try
		{
			getConnection();
			String sql="SELECT category "
					  +"FROM hotel_detail "
					  +"WHERE cno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setCategory(rs.getString(1));
			
			rs.close();
		}catch(Exception ex)
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