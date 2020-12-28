package common;


public class ChaebunLogic {

	// 강의노트(L), 일반게시판(F), 댓글(C), 자유게시판(F)
	//각 테이블 PK의 앞자리 알파벳 (MEMBER테이블의 M_NUM : M0001)
	
	//채번 쿼리문
	//멤버 채번 : M0001
	//게시물 채번 : F202011020001
	public static String makeChaebunQuery(String table, String pk) {
		String sysdate = "";
		StringBuffer sb = new StringBuffer();
		char firstAlp = table.charAt(0);
		
		//멤버테이블 외에는 일련번호에 sysdate를 붙여준다
		if(firstAlp != 'M') {
			sysdate = "TO_CHAR(SYSDATE,'YYYYMMDD') ||";
		}
		
		System.out.println("firstAlp >> " + firstAlp);
		System.out.println("sysdate >> " + sysdate);
		
		sb.append("SELECT												\n");
		sb.append("'" + firstAlp + "' || 										\n");
		sb.append(sysdate + "\n");
		sb.append("LPAD(NVL(MAX(SUBSTR(" + pk + ",2)),0) + 1,4,'0') AS " + pk);
		sb.append("\n");
		sb.append("FROM MEMBER											\n");

		System.out.println(sb);
		return sb.toString();
	}
}
