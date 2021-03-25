package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import common.JDBCUtil;
import vo.MemberPriceVO;
import vo.MemberVO;

public class MemberDAO {
	public int getLastIndex() {
		int i = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("select max(empno) from employee_tbl");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				i = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i + 1;

	}

	public int insertUser(MemberVO vo) {
		int i = 0;

		PreparedStatement pstmt = null;
		Connection conn = null;

		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("insert into employee_tbl values(?,?,?,?,?)");
			pstmt.setInt(1, vo.getEmpno());
			pstmt.setString(2, vo.getEmpname());
			pstmt.setDate(3, vo.getJoindate());
			pstmt.setString(4, vo.getGrade());
			pstmt.setString(5, vo.getDept());

			i = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("insert into salary_tbl values(?,?, 0)");
			pstmt.setInt(1, vo.getEmpno());
			Date now = Date.valueOf(LocalDate.now());
			pstmt.setDate(2, now);
			i = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return i;
	}

	public ArrayList<MemberVO> getList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("select * from employee_tbl order by empno");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEmpname(rs.getString(2));
				vo.setJoindate(rs.getDate(3));
				String grade = "";
				switch (rs.getString(4)) {
				case "A":
					grade = "사원";
					break;
				case "B":
					grade = "대리";
					break;
				case "C":
					grade = "과장";
					break;
				}
				vo.setGrade(grade);

				String dept = "";
				switch (rs.getString(5)) {
				case "A":
					dept = "디자인";
					break;
				case "B":
					dept = "백엔드";
					break;
				case "C":
					dept = "프론트";
					break;
				}
				System.out.println(vo.toString());
				vo.setDept(dept);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public MemberVO getUserInfo(int empno) {
		MemberVO vo = new MemberVO();
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("select * from employee_tbl where empno = ?");
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setEmpno(empno);
				vo.setEmpname(rs.getString(2));
				vo.setJoindate(rs.getDate(3));
				vo.setGrade(rs.getString(4));
				vo.setDept(rs.getString(5));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return vo;
	}

	public int UpdateInfo(MemberVO vo) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int n = 0;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("update employee_tbl set empname = ?, rank = ?, dept = ? where empno = ?");
			pstmt.setString(1, vo.getEmpname());
			pstmt.setString(2, vo.getGrade());
			pstmt.setString(3, vo.getDept());
			pstmt.setInt(4, vo.getEmpno());
			n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return n;
	}

	public ArrayList<MemberPriceVO> getPrice() {
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		ArrayList<MemberPriceVO> list = new ArrayList<MemberPriceVO>();
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("select a.empno, a.empname, sum(b.pay) from employee_tbl a, salary_tbl b where a.empno = b.empno group by a.empno, a.empname order by sum(b.pay) desc, a.empno asc");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberPriceVO vo = new MemberPriceVO();
				vo.setempNo(rs.getInt(1));
				vo.setempName(rs.getString(2));
				vo.setTotal(rs.getInt(3));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
