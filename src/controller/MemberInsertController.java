package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.db.MemberVO;
import service.MemberService;
import service.MemberServiceImpl;

public class MemberInsertController implements Controller {
	/* 
	 * M_NUM, M_ID, M_PW, M_NAME;
	 M_EMAIL,M_GENDER //남자(M), 여자(F), 비공개(N)
	M_AUTH //권한 : 관리자(admin), 강사(teacher), 학생(student), 반장(leader)
	M_HP; //01012341234
	M_BIRTH;
	M_ZIPCODE; //우편번호 M_ADDR; //도로명주소 M_ADDRDETAIL; //도로명주소 상세주소 M_GIBUN; //지번주소 M_HOBBY; //취미는 " " 로 구분
	M_INFO;//자기소개 M_PHOTO; (첨부파일 MultipartRequest)
	M_INSERTDATE,M_UPDATEDATE ,M_DELETEYN;
	 */

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String savePath = request.getRealPath("memberUpload");//파일저장할 폴더명
		int maxPostSize = 10*1024*1024; //10MB까지 허용
		String encoding = "euc-kr";
		//enctype이 "multipart/form-data"이면 request가 아닌 MultipartRequest로 가져온다.
		MultipartRequest mr = new MultipartRequest(request, savePath ,maxPostSize,encoding,new DefaultFileRenamePolicy());
		
		//1. 파라미터 추출 (name으로 가져온다)
		String name = mr.getParameter("name");
		String email = mr.getParameter("email");
		String id = mr.getParameter("id");
		String pw = mr.getParameter("password");
		String birthDate = mr.getParameter("birthDate");
		String phoneNumber = mr.getParameter("phoneNumber");
		String zipcode = mr.getParameter("zipcode");
		String address = mr.getParameter("address");
		String zibun = mr.getParameter("zibun");
		String addressDetail = mr.getParameter("addressDetail");
		//extraAddress
		String gender = mr.getParameter("gender");

		String hobby = "";
		String h[] = mr.getParameterValues("hobby");
		if(h != null) {
			for(int i=0; i<h.length;i++)
				hobby += h[i] + " ";
		}
		
		String info = mr.getParameter("info");

		//프로필 사진 파일 업로드
		Enumeration<String> files = mr.getFileNames();
		String fileName = files.nextElement();//photo
		String fName = mr.getFilesystemName(fileName);//원래 파일명
		String fileFullPath = savePath + "\\" + fName;
		System.out.println("fileFullPath >> " + fileFullPath);

		//2. 유효성 체크
		//JQuery validate를 이용하여 한다

		//3. VO객체에 데이터 바인딩
		MemberVO mvo = new MemberVO();
		mvo.setM_NAME(name);
		mvo.setM_ID(id);
		mvo.setM_EMAIL(email);
		mvo.setM_PW(pw);
		mvo.setM_BIRTH(birthDate);
		mvo.setM_HP(phoneNumber);
		mvo.setM_ZIPCODE(zipcode);
		mvo.setM_ADDR(address);
		mvo.setM_GIBUN(zibun);
		mvo.setM_ADDRDETAIL(addressDetail);
		mvo.setM_GENDER(gender);
		mvo.setM_HOBBY(hobby);
		mvo.setM_INFO(info);
		mvo.setM_PHOTO(fileFullPath);//db에는 파일 경로를 저장

		//4. Service 객체의 데이터 바인딩
		MemberService service = MemberServiceImpl.getInstance();
		boolean result = service.MemInsert(mvo);
		System.out.println("service.MemInsert(mvo) >> " + result);

		if(result) {
			//5. View 페이지로 이동
			request.setAttribute("id",id);
			RequestDispatcher rd= request.getRequestDispatcher("/common/home.jsp");
			rd.forward(request, response);
			
		}
		else {
			PrintWriter out = response.getWriter();
			out.println("<script>");					
			out.println("location.href='/modeltwo/member/joinForm.jsp'");
			out.println("</script>");
		}
	}
}
