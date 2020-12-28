package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.db.MemberVO;
import service.MemberService;
import service.MemberServiceImpl;

public class MemberIdCheckController implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MemberService service = MemberServiceImpl.getInstance();
		MemberVO mvo = new MemberVO();
		mvo.setM_ID(request.getParameter("id"));
		
		boolean isIdDuplicated = service.IdCheck(mvo);
		System.out.println("아이디 중복 >> " + isIdDuplicated);
		
		PrintWriter out = response.getWriter();
		if(isIdDuplicated)
			out.println("false"); //이미 있는 아이디
		else
			out.println("true");
		
	}

}
