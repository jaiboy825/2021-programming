package controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jdbc.JDBCUtil;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getMaxNo() {
		int max = -1;
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "select max(empno) from employee_tbl";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				max = rs.getInt(1) + 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return max;
	}
	
	public int insertMember(MemberVO vo) {
		int cnt = -1;
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "insert into employee_tbl values(?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getEmpno());
			pstmt.setString(2, vo.getEmpname());
			pstmt.setDate(3, vo.getJoindate());
			pstmt.setString(4, vo.getRank());
			pstmt.setString(5, vo.getDept());
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int insertSalary(int empno) {
		int cnt = -1;
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "insert into salary_tbl values(?, '2019-03-01', 0)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, empno);
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public ArrayList<MemberVO> selectMembers() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "select * from employee_tbl";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int empno = rs.getInt(1);
				String empname = rs.getString(2);
				Date joindate = rs.getDate(3);
				String rank = rs.getString(4);
				String dept = rs.getString(5);
				
				MemberVO vo = new MemberVO(empno, empname, joindate, rank, dept);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public MemberVO selectOneMember(int empno) {
		MemberVO vo = new MemberVO();
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "select * from employee_tbl where empno = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, empno);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String empname = rs.getString("empname");
				Date joindate = rs.getDate("joindate");
				String rank = rs.getString("rank");
				String dept = rs.getString("dept");
				
				vo = new MemberVO(empno, empname, joindate, rank, dept);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public int updateMember(MemberVO vo) {
		int cnt = -1;
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "update employee_tbl set empname = ?, rank = ?, dept = ? where empno = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getEmpname());
			pstmt.setString(2, vo.getRank());
			pstmt.setString(3, vo.getDept());
			pstmt.setInt(4, vo.getEmpno());
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public ArrayList<SalaryVO> selectSalary() {
		ArrayList<SalaryVO> list = new ArrayList<SalaryVO>();
		SalaryVO vo = new SalaryVO();
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "select et.empno, empname, sum(pay) " + 
					"from employee_tbl et, salary_tbl st " + 
					"where et.empno = st.empno " + 
					"group by et.empno, empname " +
					"order by sum(pay) desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int empno = rs.getInt("empno");
				String empname = rs.getString("empname");
				int pay = rs.getInt("sum(pay)");
				
				vo = new SalaryVO(empno, empname, pay);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
		
}