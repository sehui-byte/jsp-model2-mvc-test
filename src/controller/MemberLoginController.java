package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberVO;
import service.MemberService;
import service.MemberServiceImpl;

public class MemberLoginController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		RequestDispatcher rd = null;
		
		//1.파라미터 추출 (name으로 가져온다)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String idChk = request.getParameter("idChk");
		String pwChk = request.getParameter("pwChk");
		
		System.out.println("id >> " + id);
		System.out.println("pw >> " + pw);
		
		//2.유효성 검사
		//공백체크
		if(id == null || pw == null) {
			out.println("<script>alert('아이디 또는 비밀번호를 입력해주세요.'); history.go(-1)</script>");
			return;
		}
		
		//3.데이터 바인딩
		MemberVO mvo = new MemberVO();
		mvo.setM_ID(id);
		mvo.setM_PW(pw);
		
		//4. 서비스 호출
		MemberService service = MemberServiceImpl.getInstance();
		
		if(service.loginCheck(mvo)) {
			//세션부여
			HttpSession session = request.getSession();
			session.setAttribute("id", mvo.getM_ID());
			
			//"아이디 저장"일 경우 쿠키 부여
			if(idChk != null) {
				Cookie idCookie = new Cookie("id",mvo.getM_ID());
				//쿠키 유효기간 설정 (0으로 지정하면 쿠키 삭제됨)
				//음수로 지정하면 브라우저 종료시 쿠키 삭제됨
				//단위: 초단위
				idCookie.setMaxAge(60);//1분
				response.addCookie(idCookie);
			}
			
			rd = request.getRequestDispatcher("/common/home.jsp");
			rd.forward(request, response);
		}
		else {
			out.println("<script>alert('아이디 또는 비밀번호를 잘못 입력하셨습니다.'); history.go(-1)</script>");
			out.close();
		}
	}

}
