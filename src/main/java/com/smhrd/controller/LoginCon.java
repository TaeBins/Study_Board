package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;


public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Member vo = new Member(id,pw);
		MemberDAO dao = new MemberDAO();
		Member loginVO = dao.login(vo);
		
		//로그인 성공시에만 세션 성공 
		if(loginVO!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginVO",loginVO );
		}
		//로그인 성공/실패 상관없이 무조건 메인으로 이동 
		response.sendRedirect("main.jsp");
	}

}
