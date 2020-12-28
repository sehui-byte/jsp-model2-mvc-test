package member.db;

public class MemberVO {

	private String M_NUM; 
	private String M_ID;
	private String M_PW;
	private String M_NAME;
	private String M_EMAIL;
	private String M_GENDER; //남자(M), 여자(F), 비공개(N)
	private String M_AUTH; //권한 : 관리자(admin), 강사(teacher), 학생(student), 반장(leader)
	private String M_HP; //01012341234
	private String M_BIRTH;
	private String M_ZIPCODE; //우편번호
	private String M_ADDR; //도로명주소
	private String M_ADDRDETAIL; //도로명주소 상세주소
	private String M_GIBUN; //지번주소
	private String M_HOBBY; //취미는 " " 로 구분
	private String M_INFO;//자기소개
	private String M_PHOTO;
	private String M_INSERTDATE;
	private String M_UPDATEDATE; 
	private String M_DELETEYN;
	
	public MemberVO(){}
	
	public MemberVO(String m_NUM, String m_ID, String m_PW, String m_NAME, String m_EMAIL, String m_GENDER,
			String m_AUTH, String m_HP, String m_BIRTH, String m_ZIPCODE, String m_ADDR, String m_ADDRDETAIL,
			String m_GIBUN, String m_HOBBY, String m_INFO, String m_PHOTO, String m_INSERTDATE, String m_UPDATEDATE,
			String m_DELETEYN) {

		M_NUM = m_NUM;
		M_ID = m_ID;
		M_PW = m_PW;
		M_NAME = m_NAME;
		M_EMAIL = m_EMAIL;
		M_GENDER = m_GENDER;
		M_AUTH = m_AUTH;
		M_HP = m_HP;
		M_BIRTH = m_BIRTH;
		M_ZIPCODE = m_ZIPCODE;
		M_ADDR = m_ADDR;
		M_ADDRDETAIL = m_ADDRDETAIL;
		M_GIBUN = m_GIBUN;
		M_HOBBY = m_HOBBY;
		M_INFO = m_INFO;
		M_PHOTO = m_PHOTO;
		M_INSERTDATE = m_INSERTDATE;
		M_UPDATEDATE = m_UPDATEDATE;
		M_DELETEYN = m_DELETEYN;
	}

	public String getM_NUM() {
		return M_NUM;
	}

	public String getM_ID() {
		return M_ID;
	}

	public String getM_PW() {
		return M_PW;
	}

	public String getM_NAME() {
		return M_NAME;
	}

	public String getM_EMAIL() {
		return M_EMAIL;
	}

	public String getM_GENDER() {
		return M_GENDER;
	}

	public String getM_AUTH() {
		return M_AUTH;
	}

	public String getM_HP() {
		return M_HP;
	}

	public String getM_BIRTH() {
		return M_BIRTH;
	}

	public String getM_ZIPCODE() {
		return M_ZIPCODE;
	}

	public String getM_ADDR() {
		return M_ADDR;
	}

	public String getM_ADDRDETAIL() {
		return M_ADDRDETAIL;
	}

	public String getM_GIBUN() {
		return M_GIBUN;
	}

	public String getM_HOBBY() {
		return M_HOBBY;
	}

	public String getM_INFO() {
		return M_INFO;
	}

	public String getM_PHOTO() {
		return M_PHOTO;
	}

	public String getM_INSERTDATE() {
		return M_INSERTDATE;
	}

	public String getM_UPDATEDATE() {
		return M_UPDATEDATE;
	}

	public String getM_DELETEYN() {
		return M_DELETEYN;
	}

	public void setM_NUM(String m_NUM) {
		M_NUM = m_NUM;
	}

	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}

	public void setM_PW(String m_PW) {
		M_PW = m_PW;
	}

	public void setM_NAME(String m_NAME) {
		M_NAME = m_NAME;
	}

	public void setM_EMAIL(String m_EMAIL) {
		M_EMAIL = m_EMAIL;
	}

	public void setM_GENDER(String m_GENDER) {
		M_GENDER = m_GENDER;
	}

	public void setM_AUTH(String m_AUTH) {
		M_AUTH = m_AUTH;
	}

	public void setM_HP(String m_HP) {
		M_HP = m_HP;
	}

	public void setM_BIRTH(String m_BIRTH) {
		M_BIRTH = m_BIRTH;
	}

	public void setM_ZIPCODE(String m_ZIPCODE) {
		M_ZIPCODE = m_ZIPCODE;
	}

	public void setM_ADDR(String m_ADDR) {
		M_ADDR = m_ADDR;
	}

	public void setM_ADDRDETAIL(String m_ADDRDETAIL) {
		M_ADDRDETAIL = m_ADDRDETAIL;
	}

	public void setM_GIBUN(String m_GIBUN) {
		M_GIBUN = m_GIBUN;
	}

	public void setM_HOBBY(String m_HOBBY) {
		M_HOBBY = m_HOBBY;
	}

	public void setM_INFO(String m_INFO) {
		M_INFO = m_INFO;
	}

	public void setM_PHOTO(String m_PHOTO) {
		M_PHOTO = m_PHOTO;
	}

	public void setM_INSERTDATE(String m_INSERTDATE) {
		M_INSERTDATE = m_INSERTDATE;
	}

	public void setM_UPDATEDATE(String m_UPDATEDATE) {
		M_UPDATEDATE = m_UPDATEDATE;
	}

	public void setM_DELETEYN(String m_DELETEYN) {
		M_DELETEYN = m_DELETEYN;
	}
}
