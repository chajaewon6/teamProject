package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class MemberDAO {
	   private Connection conn;
	   private PreparedStatement ps;
	  
	   private static MemberDAO dao;
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
	   public static MemberDAO newInstance()
	   {
		   if(dao==null)
			   dao=new MemberDAO();
		   
		   return dao;
	   }
		
	   
	   
}



























