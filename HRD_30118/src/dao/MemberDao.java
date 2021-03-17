package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCUtil;
import vo.BookStatusVO;
import vo.MemberStatusVO;
import vo.MemberVO;

public class MemberDao {
	public int nextNum() {
		int n = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = JDBCUtil.getConnection();
		try {
			pstmt = conn.prepareStatement("select max(custno) num from mem_tbl_book");
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				n = rs.getInt("num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return n + 1;
	}

	public int insertInfo(MemberVO vo) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int n = 0;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("insert into mem_tbl_book values (?, ?, ?, ?, ?)");
			pstmt.setInt(1, vo.getCustno());
			pstmt.setString(2, vo.getCustname());
			pstmt.setDate(3, vo.getJoindate());
			pstmt.setString(4, vo.getGrade());
			pstmt.setString(5, vo.getAddress());
			n = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return n;
	}

	public List<MemberStatusVO> getMStatusList() {
		ArrayList<MemberStatusVO> list = new ArrayList<MemberStatusVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public List<BookStatusVO> getBStatusList() {
		return null;
	}

	public ArrayList<MemberVO> getUserList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM mem_tbl_book");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setAddress(rs.getString("address"));
				String grade = "";
				switch (rs.getString("grade")) {
				case "A":
					grade = "VIP";
					break;
				case "B":
					grade = "일반";
					break;
				case "C":
					grade = "직원";
					break;
				}
				vo.setGrade(grade);
				vo.setJoindate(rs.getDate("joindate"));
				vo.toString();
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return list;
	}

	public MemberVO getUserInfo(int custno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = new MemberVO();
		try {
			conn = JDBCUtil.getConnection();
			pstmt = conn.prepareStatement("select * from mem_tbl_book where custno = ?");
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setAddress(rs.getString("address"));
				vo.setGrade(rs.getString("grade"));
			}
		} catch (Exception e) {
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
			pstmt = conn.prepareStatement("update mem_tbl_book set custname = ?, grade = ?, address = ? where custno = ?");
			pstmt.setString(1, vo.getCustname());
			pstmt.setString(2, vo.getGrade());
			pstmt.setString(3, vo.getAddress());
			pstmt.setInt(4, vo.getCustno());
			n = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return n;
	}
}
