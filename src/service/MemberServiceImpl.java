package service;

import java.util.ArrayList;

import member.db.MemberDAO;
import member.db.MemberDAOImpl;
import member.db.MemberVO;

public class MemberServiceImpl implements MemberService{

	//싱글톤
	private static MemberService service = new MemberServiceImpl();
	private MemberServiceImpl() {}
	public static MemberService getInstance() {
		return service;
	}
	
	@Override
	public ArrayList<MemberVO> memSelectAll() {
		// TODO Auto-generated method stub
		MemberDAO mdao = new MemberDAOImpl();		
		ArrayList aList = mdao.memSelectAll();
		
		return aList;
	}

	@Override
	public ArrayList<MemberVO> memSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		MemberDAO mdao = new MemberDAOImpl();		
		ArrayList aList = mdao.memSelect(mvo);
		
		return aList;
	}

	@Override
	public boolean memInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		MemberDAO mdao = new MemberDAOImpl();		
		boolean bool = mdao.memInsert(mvo);
		
		return bool;
	}

	@Override
	public boolean memUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean memDelete(MemberVO mvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean idCheck(MemberVO mvo) {
		MemberDAO mdao = new MemberDAOImpl();	
		boolean bool = mdao.idCheck(mvo);
		
		return bool;
	}
	
	@Override
	public boolean loginCheck(MemberVO mvo) {
		MemberDAO mdao = new MemberDAOImpl();
		boolean bool = mdao.loginCheck(mvo);
		
		return bool;
	}

}
