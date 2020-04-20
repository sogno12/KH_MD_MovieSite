package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ChagePwdServlet
 */
@WebServlet("/changePwd.me")
public class ChangePwdServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId") ;
		String newPwd = request.getParameter("newPwd");
		
		
		
		int result = new MemberService().changePwd(memId, newPwd);

		if(result>0) {
			request.setAttribute("msg", "비밀번호 변경이 완료되었습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			view.forward(request, response);
		}else {
			request.setAttribute("msg", "비밀번호 변경에 실패하였습니다. 다시 확인해 주세요.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			view.forward(request, response);
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
