package controller;

public class SalaryVO {
	private int empno;
	private String empname;
	private int pay;
	
	public SalaryVO() {}

	public SalaryVO(int empno, String empname, int pay) {
		super();
		this.empno = empno;
		this.empname = empname;
		this.pay = pay;
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

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

}
