package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class MypageModel {

		@RequestMapping("mypage/mypage_main.do")
		public String mypage_main(HttpServletRequest request,HttpServletResponse response) {
				request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
			return "../main/main.jsp";
		}
}
