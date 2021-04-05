package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HotelReplyVO {
	private int no;
	private int cno;
	private String id;
	private String name;
	private String msg;
	private Date regdate;
	private String dbday;
}
