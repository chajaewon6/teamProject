package com.sist.vo;
/*
 *  PBR_NO      NOT NULL NUMBER         
	PBR_ID      NOT NULL VARCHAR2(20)   
	PBR_NAME    NOT NULL VARCHAR2(30)   
	PBR_MSG     NOT NULL VARCHAR2(1000) 
	PBR_REGDATE          DATE           
	PB_NO       NOT NULL NUMBER   
 */
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class BoardReplyVO {
	private int pbr_no, pb_no;
	private String pbr_id, pbr_name, pbr_msg, dbday;
	private Date pbr_regdate;
}
