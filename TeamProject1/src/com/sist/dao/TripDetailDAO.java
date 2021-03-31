package com.sist.dao;

import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

import java.sql.*;
import com.sist.vo.TripVO;

public class TripDetailDAO {
	private Connection conn;
	   private PreparedStatement ps;
	
	   private static TripDetailDAO dao;
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
		   }catch(Exception ex){}
	   }
	   // DAO  객체를 클라이언트당 1개씩만 사용 => 싱글턴 
	   public static TripDetailDAO newInstance()
	   {
		   if(dao==null)
			   dao=new TripDetailDAO();
		   
		   return dao;
			   
	   }
	   
	   public List<TripVO> tripInfolData(int cno)
	   {
		   List<TripVO> list=new ArrayList<TripVO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT title,content "
					   +"FROM tripdetail "
					   +"WHERE cno=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, cno);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   TripVO vo=new TripVO();
				   vo.setTitle(rs.getString(1));
				   vo.setContent(rs.getString(2));
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
