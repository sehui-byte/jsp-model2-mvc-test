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
//최초 실행되는 JSP 페이지에서는 내용을 출력해봤자 의미가 없습니다. 
//만약 forward를 실행하기 전에 강제로 flush하여 출력 버퍼의 내용을 브라우저로 출력하게 되면 forawrd 실행이 실패하게 됩니다.
//		out.flush();
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/common/home.jsp");
		rd.forward(request, response);
		
	}
}
