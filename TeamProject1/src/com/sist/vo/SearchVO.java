package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 * NO         NOT NULL NUMBER(6)      
CNO        NOT NULL NUMBER(4)      
CATEGORY   NOT NULL VARCHAR2(50)   
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
public class SearchVO {
	private int no;
	private int cno;
	private String category;
	private String title;
	private String regdate;
	private String poster;
	private String content;
	private String addr;
	private String subwayinfo;
	private String tag;
}
