package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
 *  NO       NOT NULL NUMBER         
	IMG_NAME          VARCHAR2(30)   
	RINK              VARCHAR2(4000) 
 * 
 */

@Getter
@Setter

public class MainImageVO {
	private int no;
	private String img_name,rink;
}
