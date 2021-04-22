package controller;

import java.sql.Date;

public class SalaryTVO {
	private int empno;
	private Date payday;
	private int pay;
	
	public SalaryTVO() {}

	public SalaryTVO(int empno, Date payday, int pay) {
		super();
		this.empno = empno;
		this.payday = payday;
		this.pay = pay;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public Date getPayday() {
		return payday;
	}

	public void setPayday(Date payday) {
		this.payday = payday;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

}
