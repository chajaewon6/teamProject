package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import com.sist.vo.*;

public class MainImageDAO {
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


//Category 읽기
	public List<MainImageVO> MainImageListData()
	  {
		  List<MainImageVO> list=new ArrayList<MainImageVO>();
		  try
		  {
			  getConnection();
			  String sql="SELECT no,img_name,rink,crink,content "
			  		+ "FROM main_trip_image "
			  		+ "ORDER BY no";
			  ps=conn.prepareStatement(sql);
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  MainImageVO vo=new MainImageVO();
				  vo.setNo(rs.getInt(1));
				  vo.setImg_name(rs.getString(2));
				  vo.setRink(rs.getString(3));
				  vo.setCrink(rs.getInt(4));
				  vo.setContent(rs.getString(5));
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
}
