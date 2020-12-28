package member.db;

public class MemberSqlMap {

	//전체조회
	public static String selectAll() {
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM MEMBER");
		return sb.toString();
	}

	//회원번호로 조회
	public static String select() {
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT * FROM MEMBER WHERE M_NUM = ?");
		return sb.toString();
	}

	//INSERT(회원가입)
	//필수 입력값 : 이름, 아이디, 비밀번호, 이메일, 성별, 휴대폰번호
	//선택 입력 : 생일, 주소, 취미, 자기소개, 프로필사진
	public static String insert() {
		StringBuffer sb = new StringBuffer();
		sb.append("INSERT INTO MEMBER(");
		sb.append("M_NUM, M_ID, M_PW, M_NAME, M_EMAIL,");
		sb.append("M_GENDER, M_AUTH, M_HP,");
		sb.append("M_BIRTH, M_ZIPCODE, M_ADDR, M_ADDRDETAIL, M_GIBUN,");
		sb.append("M_HOBBY, M_INFO, M_PHOTO, M_INSERTDATE, M_UPDATEDATE, M_DELETEYN )");
		sb.append("VALUES( ?, " ); //채번로직
		sb.append("?, ?, ?, ?, ?,"); //~gender
		sb.append("'STUDENT',");//auth
		sb.append("?,?,?,?,?,?,?,?,?,SYSDATE, SYSDATE, 'Y' )");
		
		return sb.toString();
	}

	//회원정보 수정
	//수정 가능 : 이메일, 휴대폰번호, 비밀번호, 주소, 취미, 자기소개, 프로필사진, 비밀번호, 이름, 성별, 생일
	//수정 불가능 : 아이디, 회원번호, 권한
	public static String update() {
		StringBuffer sb = new StringBuffer();
		sb.append("UPDATE MEMBER SET  												\n");
		sb.append("M_EMAIL = ?, M_HP = ?, M_PW =? ,										\n");
		sb.append("M_ZIPCODE = ?, M_ADDR = ?, M_ADDRDETAIL = ?, M_GIBUN =?,			\n");
		sb.append("M_NAME = ?, M_GENDER = ?, M_HOBBY =? , M_INFO =?, M_PHOTO =? 	\n");
		sb.append("M_UPDATEDATE = SYSDATE 											\n");
		return sb.toString();
	}
	
	//회원탈퇴
	public static String delete() {
		StringBuffer sb = new StringBuffer();
		sb.append(" UPDATE 	MEMBER SET 	 		\n");
		sb.append(" M_DELETEYN = 'N' 			\n");
		sb.append(" ,M_UPDATEDATE = SYSDATE 	\n");
		sb.append("	WHERE M_ID = ? AND M_PW = ?	\n");
		return sb.toString();
	}
	
	//로그인 (아이디, 비번)
	public static String login() {
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT M_NUM FROM MEMBER WHERE M_ID = ? AND M_PW = ? AND M_DELETEYN = 'Y'");
		return sb.toString();
	}

	//아이디 조회
	public static String selectID() {
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT M_ID FROM MEMBER WHERE M_ID = ?");
		return sb.toString();
	}

	//패스워드 변경
	public static String updatePw() {
		StringBuffer sb = new StringBuffer();
		sb.append(" UPDATE 	MEMBER 					\n");
		sb.append("	SET M_PW = ? 					\n");
		sb.append("		,M_UPDATEDATE = SYSDATE 	\n");
		sb.append("	WHERE M_ID = ? 	AND M_PW = ?	\n");
		sb.append("	AND M_DELETEYN = 'Y' 			\n");
		return sb.toString();
	}
}
