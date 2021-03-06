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
	// 연결 객체
	   private Connection conn;
	   // SQL문장 전송 
	   private PreparedStatement ps;
	   // 미리 생성된 Connection객체 읽기
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
	   // 우편번호
	   public List<ZipcodeVO> postFindData(String dong)
	   {
		   List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
		   try
		   {
			   getConnection();
			   String sql="SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') "
					     +"FROM zipcode "
					     +"WHERE dong LIKE '%'||?||'%'";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, dong);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				   ZipcodeVO vo=new ZipcodeVO();
				   vo.setZipcode(rs.getString(1));
				   vo.setSido(rs.getString(2));
				   vo.setGugun(rs.getString(3));
				   vo.setDong(rs.getString(4));
				   vo.setBunji(rs.getString(5));
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
	   // 아이디 중복체크
	   public int idcheck(String id)
	   {
		   int count=0;
		   try
		   {
			   getConnection();
			   String sql="SELECT COUNT(*) FROM member "
					     +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, id);
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
	   // 회원가입
	   public void memberJoin(MemberVO vo) {
		   try {
			   getConnection();
			   String sql="INSERT INTO member VALUES(?,?,?,?,?,?,?,?,?,?,?,'n')";
			   ps=conn.prepareStatement(sql);
			   //?에 값 채우기
			   ps.setString(1, vo.getId());
			   ps.setString(2, vo.getPwd());
			   ps.setString(3, vo.getName());
			   ps.setString(4, vo.getSex());
			   ps.setString(5, vo.getBirthday());
			   
			   ps.setString(6, vo.getEmail());
			   ps.setString(7, vo.getPost());
			   ps.setString(8, vo.getAddr1());
			   ps.setString(9, vo.getAddr2());
			   ps.setString(10, vo.getTel());
			   
			   ps.setString(11, vo.getContent());
			   
			   ps.executeUpdate();
			   
			   
			   
		   }catch(Exception ex) { 
			   ex.printStackTrace();
		   } finally {	   
			   disConnection();	   
		   }
	   }
	   // 회원수정 
	   // 아이디 찾기
	   // 비밀번호 찾기 
	   
	   //로그인
	  public String isLogin(String id,String pwd) {
		  String result="";
		  try {
			  getConnection();
			  String sql="SELECT COUNT(*) FROM member "
			  		+ "WHERE id=?";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, id);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  int count=rs.getInt(1);
			  rs.close();
			  System.out.println(count);
			  //id가 존재하는 상태
			  if(count==0) {
				 result="NOID";
			  }else { //id가 존재하는 상태
				  sql="SELECT pwd,name,admin FROM member "
					  		+ "WHERE id=?";
					  ps=conn.prepareStatement(sql);
					  ps.setString(1, id);
					 rs=ps.executeQuery();
					 rs.next();
					 String db_pwd=rs.getString(1);
					 String name=rs.getString(2);
					 String admin=rs.getString(3);
					 rs.close();
					 
					 if(db_pwd.equals(pwd)) {
						 result=name+"|"+admin;
					 }
					 else {
						 result="NOPWD";
					 }
			  }		  
		  }catch(Exception ex) {
			  ex.printStackTrace();
			  
		  }finally {
			  disConnection();
		  }
		  return result;
	  }
	  //마이페이지에 전체정보 가져오기
	  public MemberVO memberAllData(String id) {
		  MemberVO vo=new MemberVO();
		  try{
			  getConnection();
			  String sql="SELECT id,pwd,name,sex,birthday,email,post,addr1,addr2,tel,content "
			  		+ "FROM member "
			  		+ "WHERE id=?";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, id);
			  ResultSet rs=ps.executeQuery();
			  rs.next();
			  vo.setId(rs.getString(1));
			  vo.setPwd(rs.getString(2));
			  vo.setName(rs.getString(3));
			  vo.setSex(rs.getString(4));
			  vo.setBirthday(rs.getString(5));
			  vo.setEmail(rs.getString(6));
			  vo.setPost(rs.getString(7));
			  vo.setAddr1(rs.getString(8));
			  vo.setAddr2(rs.getString(9));
			  vo.setTel(rs.getString(10));
			  vo.setContent(rs.getString(11));
			  
			rs.close();	  
			  
		  }catch(Exception ex) {
			  ex.printStackTrace();
		  }finally {
			  disConnection();
		  }
		  return vo;
		  
	  }
	  
	  //마이페이지 수정
	  public void mypageUpdateData(MemberVO vo) {
		  try {
			  getConnection();
			  String sql="UPDATE member SET "
			  		+ "pwd=?,post=?,addr1=?,addr2=?,tel=?,content=? "
					  +"WHERE id=?";
			  ps=conn.prepareStatement(sql);
			  ps.setString(1, vo.getPwd());
			  ps.setString(2, vo.getPost());
			  ps.setString(3, vo.getAddr1());
			  ps.setString(4, vo.getAddr2());
			  ps.setString(5, vo.getTel());
			  ps.setString(6, vo.getContent());
			  ps.setString(7, vo.getId());
			  
			  ps.executeUpdate();
			  
			  
		  }catch(Exception ex) {
			  ex.printStackTrace();
		  }finally {
			  disConnection();
		  }
		  
	  }
	  
	   
}
























