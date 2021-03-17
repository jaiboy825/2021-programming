package vo;

import java.sql.Date;

public class MemberVO {
	private int custno;
	private String custname;
	private Date joindate;
	private String grade;
	private String address;



	@Override
	public String toString() {
		return "MemberVO [custno=" + custno + ", custname=" + custname + ", joindate=" + joindate + ", grade=" + grade
				+ ", address=" + address + "]";
	}



	public int getCustno() {
		return custno;
	}



	public void setCustno(int custno) {
		this.custno = custno;
	}



	public String getCustname() {
		return custname;
	}



	public void setCustname(String custname) {
		this.custname = custname;
	}



	public Date getJoindate() {
		return joindate;
	}



	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}



	public String getGrade() {
		return grade;
	}



	public void setGrade(String grade) {
		this.grade = grade;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}
	

}
