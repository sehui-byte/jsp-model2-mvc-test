package member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ChaebunLogic;
import common.ConnProp;


public class MemberDAOImpl implements MemberDAO{
	
	public static String table = "MEMBER";
	public static String pk = "M_NUM";

	//전체 회원정보 조회
	@Override
	public ArrayList<MemberVO> memSelectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	//회원정보 조회
	@Override
	public ArrayList<MemberVO> memSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		return null;
	}

	//회원가입
	@Override
	public boolean memInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstm = null;
		int nCnt = 0;
		
		conn = ConnProp.getConnection();
		
		try {
			pstm = conn.prepareStatement(MemberSqlMap.insert());
			pstm.clearParameters();
			pstm.setString(1, memChaebun());//M_NUM
			pstm.setString(2, mvo.getM_ID());//M_ID
			pstm.setString(3, mvo.getM_PW());//M_PW
			pstm.setString(4, mvo.getM_NAME());//M_NAME
			pstm.setString(5, mvo.getM_EMAIL());//M_EMAIL
			pstm.setString(6, mvo.getM_GENDER());//M_GENDER
			pstm.setString(7, mvo.getM_HP());//M_HP
			pstm.setString(8, mvo.getM_BIRTH());//M_BIRTH
			pstm.setString(9, mvo.getM_ZIPCODE());//M_ZIPCODE
			pstm.setString(10,mvo.getM_ADDR());//M_ADDR
			pstm.setString(11, mvo.getM_ADDRDETAIL());//M_ADDRDETAIL
			pstm.setString(12, mvo.getM_GIBUN());//M_GIBUN
			pstm.setString(13, mvo.getM_HOBBY());//M_HOBBY
			pstm.setString(14, mvo.getM_INFO());//M_INFO
			pstm.setString(15, mvo.getM_PHOTO());//M_PHOTO

			nCnt = pstm.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("memInsert db error >> " + e.getMessage());
		}finally {
			ConnProp.connClose(conn, pstm);
		}
		
		if(nCnt > 0)
			return true;
		
		return false;
	}
	
	//회원정보 수정
	@Override
	public boolean memUpdate(MemberVO mvo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int nCnt = 0;
		
		conn = ConnProp.getConnection();
		
		try {
			pstm = conn.prepareStatement(MemberSqlMap.update());
			pstm.setString(1, mvo.getM_EMAIL());//M_EMAIL
			pstm.setString(2, mvo.getM_HP());//M_HP
			pstm.setString(3, mvo.getM_PW());//M_PW
			pstm.setString(4, mvo.getM_ZIPCODE());//M_ZIPCODE
			pstm.setString(5, mvo.getM_ADDR());//M_ADDR
			pstm.setString(6, mvo.getM_ADDRDETAIL());//M_ADDRDETAIL
			pstm.setString(7, mvo.getM_EMAIL());//M_GIBUN
			pstm.setString(8, mvo.getM_NAME());//M_NAME
			pstm.setString(9, mvo.getM_GENDER());//M_GENDER
			pstm.setString(10, mvo.getM_HOBBY());//M_HOBBY
			pstm.setString(11, mvo.getM_INFO());//M_INFO
		
			nCnt = pstm.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("memUpdate db error" + e.getMessage());
		}
		finally {
			ConnProp.connClose(conn, pstm);
		}
		
		if(nCnt > 0)
			return true;
		return false;
	}

	//회원탈퇴
	@Override
	public boolean memDelete(MemberVO mvo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int nCnt = 0;
		
		conn = ConnProp.getConnection();
		
		try {
			pstm = conn.prepareStatement(MemberSqlMap.delete());
			pstm.setString(1, mvo.getM_ID());//M_ID
			pstm.setString(2, mvo.getM_PW());//M_PW
			
			nCnt = pstm.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("memDelete db error" + e.getMessage());
		}
		finally {
			ConnProp.connClose(conn, pstm);
		}
		
		if(nCnt > 0)
			return true;
		return false;
	}

	//아이디 중복체크
	@Override
	public boolean idCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstm = null;
		int nCnt = 0;
		
		conn = ConnProp.getConnection();
		
		try {
			pstm = conn.prepareStatement(MemberSqlMap.selectID());
			pstm.setString(1, mvo.getM_ID());//M_ID
			
			nCnt = pstm.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("idCheck db error" + e.getMessage());
		}
		finally {
			ConnProp.connClose(conn, pstm);
		}
		
		if(nCnt > 0)
			return true;
		return false;
	}

	@Override
	public boolean loginCheck(MemberVO mvo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int nCnt = 0;
		
		conn = ConnProp.getConnection();
		
		try {
			pstm = conn.prepareStatement(MemberSqlMap.login());
			pstm.setString(1, mvo.getM_ID());//M_ID
			pstm.setString(2, mvo.getM_PW());//M_PW
			
			nCnt = pstm.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("loginCheck db error" + e.getMessage());
		}
		finally {
			ConnProp.connClose(conn, pstm);
		}
		
		if(nCnt > 0)
			return true;
		return false;
	}

	@Override
	public boolean pwUpdate(MemberVO mvo) {
		
		return false;
	}

	@Override
	public String memChaebun() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String m_num = "";
		conn = ConnProp.getConnection();
		
		try {
			pstmt = conn.prepareStatement(ChaebunLogic.makeChaebunQuery(table, pk));
			rs = pstmt.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					m_num = rs.getString(1);
				}
			}
		} catch (SQLException e) {
			System.out.println("디비연동오류 : memChaebun >>> : " + e);
		}finally {
			ConnProp.connClose(conn, pstmt, rs);
		}
		return m_num;
	}
}
