package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* <프런트 컨트롤 디자인 패턴>
 * FrontController : 뷰에서 오는 모든 요청을 하나의 대표 컨트롤로거 처리하는 방식.
 * 수많은 클라이언트의 요청 응답시 계속적으로 객체를 생성하지 않아 자원 활용에 좋다.
 * 클라이언트 요청이 어떤것인지 판별하여 그 요청에 맞는 Controller로 이동시켜준다.
 * */

//서블릿 매핑 : 해당 서블릿이 어떤 url을 처리할지에 대한 매핑정보 등록하는 것.
//"/.do" url이 오면 이 컨트롤러가 전부 처리
//이렇게 특정 확장자(.do) url요청을 해당 컨트롤러 서블릿이 처리하도록 하기위해선 web.xml에 <servlet-mapping>정보를 추가해줘야한다
//@WebServlet("*.do")
public class MemberFrontController extends HttpServlet {
	
	//초기화작업 : 한글처리
	//service : 클라이언트가 요청할 때마다 해당 path의 controller로 이동시켜주는 길잡이 역할

	private static final long serialVersionUID = 1L;
	
	String charset = null;
	HashMap<String, Controller> list = null;//서브컨트롤러를 관리하는 객체
	
	//한글처리와 list put
	public void init(ServletConfig sc) throws ServletException{
		//charset은 euc-kr로 설정
		//web.xml에 <init-param>존재
		charset = sc.getInitParameter("charset");
		
		list = new HashMap<String, Controller>();
		list.put("/member/memberInsert.do", new MemberInsertController());
		list.put("/member/memberIdCheck.do", new MemberIdCheckController());
		list.put("/member/memberUpdate.do", new MemberUpdateController());
		list.put("/member/login.do", new MemberLoginController());
		list.put("/member/logout.do", new MemberLogoutController());
	}
	
	//클라이언트가 요청할 때마다 해당 path의 controller로 이동시켜준다
	public void service(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding(charset);
		response.setContentType("text/html; charset=euc-kr");
		 
		String url = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = url.substring(contextPath.length());
		
		System.out.println("url >> " + url);
		System.out.println("contextPath >> " + contextPath);
		System.out.println("path >> " + path);
		
		Controller subController = list.get(path);
		
		try {
			subController.execute(request, response);
			
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			System.out.println("service error >> " + e.getMessage());
		}
	}
}
