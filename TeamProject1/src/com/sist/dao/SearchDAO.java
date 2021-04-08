package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.SearchVO;

public class SearchDAO {
	private Connection conn;
	   // SQL문장 전송 
	   private PreparedStatement ps;
	   // 미리 생성된 Connection객체 읽기
	   private static SearchDAO dao;
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
	   public static SearchDAO newInstance()
	   {
		   if(dao==null)
			   dao=new SearchDAO();
		   
		   return dao;
			   
	   }
			public List<SearchVO> SearchFindData(String title)
			{
		   List<SearchVO> list=new ArrayList<SearchVO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT no,poster,title,category "
					     +"FROM tripdetail "
					     +"WHERE title LIKE '%'||?||'%'";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, title);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   SearchVO vo=new SearchVO();
				   vo.setNo(rs.getInt(1));
				   vo.setPoster(rs.getString(2));
				   vo.setTitle(rs.getString(3));
				   vo.setCategory(rs.getString(4));
				   
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
