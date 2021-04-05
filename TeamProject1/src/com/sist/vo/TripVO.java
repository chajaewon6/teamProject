package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * 
 * 			NO         NOT NULL NUMBER(6)      
			CNO        NOT NULL NUMBER(4)      
			CATEGOTY   NOT NULL VARCHAR2(50)   
			TITLE      NOT NULL VARCHAR2(200)  
			REGDATE             VARCHAR2(200)  
			POSTER     NOT NULL VARCHAR2(3000) 
			CONTENT             CLOB           
			ADDR                VARCHAR2(300)  
			SUBWAYINFO          VARCHAR2(200)  
			TAG                 VARCHAR2(500) 
 */
@Getter
@Setter
public class TripVO {
	private int no, cno;
	private String poster, title, addr, category, regdate, content, subwayinfo, tag, address, sub;
}
