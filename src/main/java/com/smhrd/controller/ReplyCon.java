package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.Reply;
import com.smhrd.model.ReplyDAO;

@WebServlet("/ReplyCon")
public class ReplyCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int boardNum = Integer.parseInt(request.getParameter("num"));
		String reply = request.getParameter("reply");

		HttpSession session = request.getSession();
		Member vo = (Member)session.getAttribute("loginVO");
		String id = vo.getId();
		
		Reply rep = new Reply(boardNum, reply, id);
		
		ReplyDAO dao = new ReplyDAO();
		int cnt = dao.insertReply(rep);
		
		PrintWriter out = response.getWriter();
		if(cnt > 0) {
			System.out.println("성공");
			out.print("success");
		}else {
			System.out.println("실패");
			out.print("fail");
		}
	}

}
