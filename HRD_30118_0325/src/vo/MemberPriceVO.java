package vo;

public class MemberPriceVO {
	private int empNo;
	private String empName;
	private int total;

	public MemberPriceVO() {
		super();
	}

	public MemberPriceVO(int empNo, String empName, int total) {
		super();
		this.empNo = empNo;
		this.empName = empName;
		this.total = total;
	}

	public int getempNo() {
		return empNo;
	}

	public void setempNo(int empNo) {
		this.empNo = empNo;
	}

	public String getempName() {
		return empName;
	}

	public void setempName(String empName) {
		this.empName = empName;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}