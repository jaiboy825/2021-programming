package vo;

import java.sql.Date;

public class MemberVO {
	private int empno;
	private String empname;
	private Date joindate;
	private String grade;
	private String dept;

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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	@Override
	public String toString() {
		return "MemberVO [empno=" + empno + ", empname=" + empname + ", joindate=" + joindate + ", grade=" + grade
				+ ", dept=" + dept + "]";
	}
	
	

}
