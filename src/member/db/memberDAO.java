package member.db;

import java.util.ArrayList;

public interface MemberDAO {
	
	ArrayList<MemberVO> memSelectAll();
	ArrayList<MemberVO> memSelect(MemberVO mvo);
	boolean memInsert(MemberVO mvo);//회원가입
	boolean memUpdate(MemberVO mvo);//회원정보수정
	boolean memDelete(MemberVO mvo);//회원탈퇴
	boolean idCheck(MemberVO mvo); //아이디 조회 (아이디 중복체크)
	boolean loginCheck(MemberVO mvo);//로그인 체크 (아이디,비번 체크)
	boolean pwUpdate(MemberVO _kmvo); //비밀번호 수정
	String memChaebun();//m_num (chaebun)

}
