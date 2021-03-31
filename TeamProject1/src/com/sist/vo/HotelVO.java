package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HotelVO {
	private int no,cno;
	private String poster,star,title,grade,addr,content,link,category,price;
}
/*
NO					NUMBER	No		1	
POSTER	VARCHAR2(260 BYTE)	No		2	
STAR	VARCHAR2(20 BYTE)	No		3	
TITLE	VARCHAR2(500 BYTE)	No		4	
GRADE	VARCHAR2(100 BYTE)	Yes		5	
ADDR	VARCHAR2(300 BYTE)	No		6	
CONTENT	VARCHAR2(1000 BYTE)	No		7	
LINK	VARCHAR2(3000 BYTE)	No		8	
CATEGORY	VARCHAR2(100 BYTE)	No		9	
CNO	NUMBER	Yes		10	
PRICE	VARCHAR2(100 BYTE)	Yes		11	
*/