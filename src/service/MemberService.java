package service;

import java.util.ArrayList;

import member.db.MemberVO;

public interface MemberService {
	public ArrayList<MemberVO> MemSelectAll();
	public ArrayList<MemberVO> MemSelect(MemberVO mvo);
	public boolean MemInsert(MemberVO mvo);
	public boolean MemUpdate(MemberVO mvo);
	public boolean MemDelete(MemberVO mvo);
	
	//아이디 중복체크
	public boolean IdCheck(MemberVO mvo);
}
