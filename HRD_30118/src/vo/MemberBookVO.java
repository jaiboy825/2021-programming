package vo;

public class MemberBookVO {
	private int custno;
	private int bookno;
	private String custname;
	private int memberCnt;
	private int bookCnt;

	public MemberBookVO(int custno, int bookno, String custname, int memberCnt, int bookCnt) {
		super();
		this.custno = custno;
		this.bookno = bookno;
		this.custname = custname;
		this.memberCnt = memberCnt;
		this.bookCnt = bookCnt;
	}

	public int getCustno() {
		return custno;
	}

	public void setCustno(int custno) {
		this.custno = custno;
	}

	public int getBookno() {
		return bookno;
	}

	public void setBookno(int bookno) {
		this.bookno = bookno;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public int getMemberCnt() {
		return memberCnt;
	}

	public void setMemberCnt(int memberCnt) {
		this.memberCnt = memberCnt;
	}

	public int getBookCnt() {
		return bookCnt;
	}

	public void setBookCnt(int bookCnt) {
		this.bookCnt = bookCnt;
	}

}
