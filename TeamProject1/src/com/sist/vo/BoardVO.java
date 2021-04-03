package com.sist.vo;

import lombok.Getter;
import lombok.Setter;
import java.util.*;

/*
 * 	PB_NO         NOT NULL NUMBER         
	PB_PICTITLE   NOT NULL VARCHAR2(200)  
	PB_PICDATE             DATE           
	PB_PICCONTENT NOT NULL VARCHAR2(1000) 
	PB_PICLOC     NOT NULL VARCHAR2(100)  
	PB_PICHIT              NUMBER         
	PB_PICHEART            NUMBER         
	PB_PICTAG              VARCHAR2(100)  
	USER_ID       NOT NULL VARCHAR2(20)   
	MNO           NOT NULL NUMBER         
	PB_PIC                 VARCHAR2(4000) 
 * 
 */
@Getter
@Setter
public class BoardVO {
	private int pb_no, pb_picHit, pb_picHeart, mno;
	private String pic_picTitle, pb_picContent, pb_picLoc, pb_picTag, pb_pic, user_id;
	private Date pb_picDate;
}
