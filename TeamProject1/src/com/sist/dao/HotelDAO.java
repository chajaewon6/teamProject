
package com.sist.dao;

import java.util.*;
import javax.sql.*;

import com.sist.vo.HotelCategoryVO;
import com.sist.vo.HotelJjimVO;
import com.sist.vo.HotelReplyVO;
import com.sist.vo.HotelVO;
import com.sist.vo.ReserveVO;

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
	/*
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
	  */
	// Category Data
	
	public List<HotelCategoryVO> HotelData(int cno)
	{
		List<HotelCategoryVO> list=new ArrayList<HotelCategoryVO>();
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
	
	public List<HotelVO> HotelListData(int cno,int page){
        List<HotelVO> list=new ArrayList<HotelVO>();
        try {
           getConnection();
           String sql="SELECT no,poster,title,star,NVL(grade,'정보 없음'),addr,category,price,num "
                   + "FROM(SELECT no,poster,title,star,grade,addr,category,price,rownum as num "
                   + "FROM(SELECT no,poster,title,star,grade,addr,category,price "
                   + "FROM hotel_detail WHERE cno=? ORDER BY no ASC)) "
                   + "WHERE num BETWEEN ? AND ?";
          /* String sql="SELECT no,poster,title,star,grade,addr,category,price,num "
                 + "FROM(SELECT no,poster,title,star,grade,addr,category,price,rownum as num "
                 + "FROM(SELECT no,poster,title,star,grade,addr,category,price "
                 + "FROM hotel_detail WHERE cno=? ORDER BY no ASC)) "
                 + "WHERE num BETWEEN ? AND ?";*/
           ps=conn.prepareStatement(sql);
           int rowSize=12;
           int start=(rowSize*page)-(rowSize-1);
           int end=rowSize*page;
           ps.setInt(1, cno);
           ps.setInt(2, start);
           ps.setInt(3, end);
           ResultSet rs=ps.executeQuery();
           while(rs.next()) {
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
        }catch(Exception ex) {
           ex.printStackTrace();
        }finally {
           disConnection();
        }
        return list;
     }
	
	public int HotelCount(int cno) {
        int count=0;
        try {
           getConnection();
           String sql="SELECT COUNT(*) FROM hotel_detail WHERE cno=?";
        		     //+"WHERE cno=?";
           ps=conn.prepareStatement(sql);
           ps.setInt(1, cno);
           ResultSet rs=ps.executeQuery();
           rs.next();
           count=rs.getInt(1);
           rs.close();
        }catch(Exception ex) {
           ex.printStackTrace();
        }finally {
           disConnection();
        }
        return count;
     }
	public HotelVO HotelDetailData(int no)
	 {
		 HotelVO vo=new HotelVO();
		 try
		 {
			 getConnection();
			 String sql="SELECT no,poster,title,star,grade,addr,content,price "   
					   +"FROM hotel_detail "
					   +"WHERE no=?";
			 ps=conn.prepareStatement(sql);
			 ps.setInt(1, no);
			 // 결과값 받기
			 ResultSet rs=ps.executeQuery(); // row단위
			 rs.next();
			 vo.setNo(rs.getInt(1));
			 vo.setPoster(rs.getString(2));
			 vo.setTitle(rs.getString(3));
			 vo.setStar(rs.getString(4));
			 vo.setGrade(rs.getString(5));
			 vo.setAddr(rs.getString(6));
			 vo.setContent(rs.getString(7));
			 vo.setPrice(rs.getString(8));
			
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
	public HotelCategoryVO HotelCookiePrintData(int no)
	   {
		   HotelCategoryVO vo=new HotelCategoryVO();
		   try
		   {
			   getConnection();
			   String sql="SELECT no,poster,title,grade,price "
					     +"FROM hotel_detail "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   // 실행
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNo(rs.getInt(1));
			   vo.setPoster(rs.getString(2));
			   vo.setTitle(rs.getString(3));
			   vo.setGrade(rs.getString(4));
			   vo.setPrice(rs.getString(5));
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
	// 댓글 읽기
    public List<HotelReplyVO> HotelReplyReadData(int cno)
    {
   	 List<HotelReplyVO> list=new ArrayList<HotelReplyVO>();
   	 try
   	 {
   		 getConnection();
   		 String sql="SELECT no,id,name,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
   				   +"FROM hotel_reply "
   				   +"WHERE cno=?";
   		 ps=conn.prepareStatement(sql);
   		 ps.setInt(1, cno);
   		 ResultSet rs=ps.executeQuery();
   		 while(rs.next())
   		 {
   			 HotelReplyVO vo=new HotelReplyVO();
   			 vo.setNo(rs.getInt(1));
   			 vo.setId(rs.getString(2));
   			 vo.setName(rs.getString(3));
   			 vo.setMsg(rs.getString(4));
   			 vo.setDbday(rs.getString(5));
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
    // 댓글 올리기
    public void HotelReplyInsert(HotelReplyVO vo)
    {
	   	 try
	   	 {
	   		 getConnection();
	   		 String sql="INSERT INTO hotel_reply VALUES("
	   				   +"hr_no_seq.nextval,?,?,?,?,SYSDATE)";
	   		 ps=conn.prepareStatement(sql);
	   		 ps.setInt(1, vo.getCno());
	   		 ps.setString(2, vo.getId());
	   		 ps.setString(3, vo.getName());
	   		 ps.setString(4, vo.getMsg());
	   		 // 실행
	   		 ps.executeUpdate();
	   	 }catch(Exception ex)
	   	 {
	   		 ex.printStackTrace();
	   	 }
	   	 finally
	   	 {
	   		 disConnection();
	   	 }
    }
    // 댓글 수정
    public void HotelReplyUpdate(HotelReplyVO vo)
    {
   	 try
   	 {
   		 getConnection();
   		 String sql="UPDATE hotel_reply SET "
   				   +"msg=? "
   				   +"WHERE no=?";
   		 ps=conn.prepareStatement(sql);
   		 ps.setString(1, vo.getMsg());
   		 ps.setInt(2, vo.getNo());
   		 
   		 ps.executeUpdate();
   	 }catch(Exception ex)
   	 {
   		 ex.printStackTrace();
   	 }
   	 finally
   	 {
   		 disConnection();
   	 }
    }
    // 댓글 삭제
    public void HotelReplyDelete(int no)
    {
   	 try
   	 {
   		 getConnection();
   		 String sql="DELETE FROM hotel_reply "
   				   +"WHERE no=?";
   		 ps=conn.prepareStatement(sql);
   		 ps.setInt(1, no);
   		 ps.executeUpdate();
   	 }catch(Exception ex)
   	 {
   		 ex.printStackTrace();
   	 }
   	 finally
   	 {
   		 disConnection();
   	 }
    }
    // 찜하기
    public void HotelJjimInsert(int no,String id)
    {
   	 try
   	 {
   		 getConnection();
   		 String sql="INSERT INTO hotel_jjim VALUES("
   				   +"hj_no_seq.nextval,?,?)";
   	 ps=conn.prepareStatement(sql);
   	 ps.setString(1, id);
   	 ps.setInt(2, no);
   				 
   	 ps.executeUpdate();
   	 }catch(Exception ex) 
   	 {
   		ex.printStackTrace(); 
   	 }
   	 finally
   	 {
   		 disConnection();
   	 }
    }
    // 찜하기 체크
    public int HotelJjimCheck(int cno,String id)
    {
   	 int count=0;
   	 try
   	 {
   		 getConnection();
   		 String sql="SELECT COUNT(*) FROM hotel_jjim "
   				   +"WHERE cno=? AND id=?";
   		 ps=conn.prepareStatement(sql);
   		 ps.setInt(1, cno);
   		 ps.setString(2, id);
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
    
    //찜목록
    public List<HotelJjimVO> hotelJjimListData(String id)
    {
    	List<HotelJjimVO> list=new ArrayList<HotelJjimVO>();
    	try {
    		getConnection();
    		String sql="SELECT no,cno "
    				+ "FROM hotel_jjim "
    				+ "WHERE id=? ";
    		ps=conn.prepareStatement(sql);
    		ps.setString(1, id);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			HotelJjimVO vo=new HotelJjimVO();
    			vo.setNo(rs.getInt(1));
    			vo.setCno(rs.getInt(2));
    			list.add(vo);
    		}
    		rs.close();
    	}catch(Exception ex) {
    		ex.printStackTrace();
    	}finally{
    		disConnection();
    	}
    	
    	return list;
    }
 // hotel_reserve
    
    public List<HotelVO> HotelReserveAllData()
    {
   	 List<HotelVO> list=new ArrayList<HotelVO>();
   	 try
   	 {
   		 getConnection();
   		 String sql="SELECT no,title,poster,grade,price "
   				   +"FROM hotel_detail "
   				   +"ORDER BY no ASC";
   		 ps=conn.prepareStatement(sql);
   		 ResultSet rs=ps.executeQuery();
   		 while(rs.next())
   		 {
   			 HotelVO vo=new HotelVO();
   			 vo.setNo(rs.getInt(1));
   			 vo.setTitle(rs.getString(2));
   			 vo.setPoster(rs.getString(3));
   			 vo.setGrade(rs.getString(4));
   			 vo.setPrice(rs.getString(5));
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
    
    public String HotelReserveDate(int no)
    {
   	 String rday="";
   	 try
   	 {
   		 getConnection();
   		 String sql="SELECT rdays FROM hotel_detail "
   				   +"WHERE no=?";
   		 ps=conn.prepareStatement(sql);
   		 ps.setInt(1, no);
   		 ResultSet rs=ps.executeQuery();
   		 rs.next();
   		 rday=rs.getString(1);
   		 rs.close();
   	 }catch(Exception ex)
   	 {
   		 ex.printStackTrace();
   	 }
   	 finally
   	 {
   		 disConnection();
   	 }
   	 return rday;
    }
    
    public String HotelReserveInTimeData(int day)
    {
   	 String time="";
   	 try
   	 {
   		 getConnection();
   		 String sql="SELECT tno FROM rday "
   				   +"WHERE no=?";
   		 ps=conn.prepareStatement(sql);
   		 ps.setInt(1, day);
   		 ResultSet rs=ps.executeQuery();
   		 rs.next();
   		 time=rs.getString(1);
   		 rs.close();
   	 }catch(Exception ex)
   	 {
   		 ex.printStackTrace();
   	 }
   	 finally
   	 {
   		 disConnection();
   	 }
   	 return time;
    }
     
    public String HotelReserveInTime(int no)
    {
   	 String time="";
   	 try
   	 {
   		 getConnection();
   		 String sql="SELECT outtime FROM outtime "
   				   +"WHERE no=?";
   		 ps=conn.prepareStatement(sql);
   		 ps.setInt(1, no);
   		 ResultSet rs=ps.executeQuery();
   		 rs.next();
   		 time=rs.getString(1);
   		 rs.close();
   	 }catch(Exception ex)
   	 {
   		 ex.printStackTrace();
   	 }
   	 finally
   	 {
   		 disConnection();
   	 }
   	 return time;
    }
    public void HotelReserveSave(ReserveVO vo)
    {
   	 try
   	 {
   		 getConnection();
   		 String sql="INSERT INTO hotel_reserve VALUES("
   				   +"(SELECT NVL(MAX(no)+1,1) FROM hotel_reserve),?,?,?,?,?,?,?,?,"
   				   +"0,SYSDATE)";
   		 ps=conn.prepareStatement(sql);
   		 ps.setString(1, vo.getId());
   		 ps.setString(2, vo.getTitle());
   		 ps.setString(3, vo.getInday());
   		 ps.setString(4, vo.getIntime());
   		 ps.setString(5, vo.getOutday());
   		 ps.setString(6, vo.getOuttime());
   		 ps.setString(7, vo.getInwon());
   		 ps.setString(8, vo.getRoom());
   		 ps.executeUpdate();
   	 }catch(Exception ex)
   	 {
   		 ex.printStackTrace();
   	 }
   	 finally
   	 {
   		 disConnection();
   	 }
    }
    public void reserve_ok(int no)
    {
   	 try
   	 {
   		 getConnection();
   		 String sql="UPDATE hotel_reserve SET "
   				   +"state=1 "
   				   +"WHERE no=?";
   		 ps=conn.prepareStatement(sql);
   		 ps.setInt(1, no);
   		 ps.executeUpdate();
   	 }catch(Exception ex)
   	 {
   		 ex.printStackTrace();
   	 }
   	 finally
   	 {
   		 disConnection();
   	 }
    }
    
    public List<ReserveVO> mypage_data(String id)
    {
   	 List<ReserveVO> list=new ArrayList<ReserveVO>();
   	 try
   	 {
   		 getConnection();
   		 String sql="SELECT no,title,inday,intime,outday,outtime,inwon,room,state,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') "
   				   +"FROM hotel_reserve "
   				   +"WHERE id=? "
   				   +"ORDER BY no DESC";
   		 ps=conn.prepareStatement(sql);
   		 ps.setString(1, id);
   		 ResultSet rs=ps.executeQuery();
   		 while(rs.next())
   		 {
   			 ReserveVO vo=new ReserveVO();
   			 vo.setNo(rs.getInt(1));
   			 vo.setTitle(rs.getString(2));
   			 vo.setInday(rs.getString(3));
   			 vo.setIntime(rs.getString(4));
   			 vo.setOutday(rs.getString(5));
  			 vo.setOuttime(rs.getString(6));
   			 vo.setInwon(rs.getString(7));
   			 vo.setRoom(rs.getString(8));
   			 vo.setState(rs.getInt(9));
   			 vo.setDbday(rs.getString(10));
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