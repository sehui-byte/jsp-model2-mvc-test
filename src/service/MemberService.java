package service;

import java.util.ArrayList;

import member.db.MemberVO;

public interface MemberService {
	public ArrayList<MemberVO> memSelectAll();
	public ArrayList<MemberVO> memSelect(MemberVO mvo);
	public boolean memInsert(MemberVO mvo);
	public boolean memUpdate(MemberVO mvo);
	public boolean memDelete(MemberVO mvo);
	
	public boolean idCheck(MemberVO mvo);//아이디 중복체크
	public boolean loginCheck(MemberVO mvo);//로그인 체크
}
