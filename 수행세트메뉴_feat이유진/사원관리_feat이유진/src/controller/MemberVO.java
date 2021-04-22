package controller;

import java.sql.Date;

public class MemberVO {
	private int empno;
	private String empname;
	private Date joindate;
	private String rank;
	private String dept;
	
	public MemberVO() {}

	public MemberVO(int empno, String empname, Date joindate, String rank, String dept) {
		super();
		this.empno = empno;
		this.empname = empname;
		this.joindate = joindate;
		this.rank = rank;
		this.dept = dept;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

}
