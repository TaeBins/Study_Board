package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.Member;

public class BoardWriteCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 현재 로그인한 사용자의 ID(Session영역 안에 저장)
		HttpSession session = request.getSession();
		Member vo = (Member) session.getAttribute("loginVO");
		String id = vo.getId();

		String saveDir = request.getServletContext().getRealPath("img");
		// 15MB 제한
		int maxSize = 5 * 1024 * 1024;
		String encoding = "UTF-8";

		// form (multipart/form-data)
		String name, filename, address, content;
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		name = multi.getParameter("name");
		filename = URLEncoder.encode(multi.getFilesystemName("filename"), "UTF-8");
		address = multi.getParameter("address");
		content = multi.getParameter("content");

		Board b_vo = new Board(name, id, filename, content, address);
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.insertBoard(b_vo);

		if (cnt > 0) {
			System.out.println("삽입성공");
		} else {
			System.out.println("삽입실패");
		}
		response.sendRedirect("main.jsp");
//		RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
//		rd.forward(request, response);

	}

}
