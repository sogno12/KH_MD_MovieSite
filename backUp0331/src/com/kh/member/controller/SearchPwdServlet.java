package com.kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class SearchPwdServlet
 */
@WebServlet("/findPwd.me")
public class SearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String pId = request.getParameter("pId");
		String pName = request.getParameter("pName");
		String pPhone = request.getParameter("pPhone");
		
		Member findPwdMem = new MemberService().findPwd(pId, pName, pPhone);
		
		if(findPwdMem != null) {
			
			request.setAttribute("pId", findPwdMem.getId());
			String id = findPwdMem.getId();
			
			request.getRequestDispatcher("views/member/changePwdForm.jsp").forward(request, response);
		
			

		}else {
			String message = "정보가 일치하지 않습니다. 다시 확인해 주세요";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("history.back(-1);");
			out.println("</script>");
			
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

