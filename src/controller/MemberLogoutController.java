package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		session.invalidate();//세션 제거
		
		PrintWriter out = response.getWriter();
//		out.println("<script>alert('로그아웃 되었습니다.');");
//		out.println("</script>");
//		out.flush();
		
		RequestDispatcher rd = request.getRequestDispatcher("/common/home.jsp");
		rd.forward(request, response);
		
		
	}
}
