package dao;

import java.sql.*;
import java.util.ArrayList;

import common.JdbcUtil;
import vo.MemberVO;

public class MemberDao {
	public int nextNum() {
		int n = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement("select max(custno) num from member_tbl_02");
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				n = rs.getInt("num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		return n + 1;
	}

	public int insertMember(MemberVO member) {
		int n = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement("insert into member_tbl_02 values(?,?,?,?,?,?,?)");
			pstmt.setInt(1, member.getCustno());
			pstmt.setString(2, member.getCustname());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setDate(5, member.getJoindate());
			pstmt.setString(6, member.getGrade());
			pstmt.setString(7, member.getCity());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		return n;
	}

	public ArrayList<MemberVO> getList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement("select * from member_tbl_02");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCustno(Integer.parseInt(rs.getString("custno")));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
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
				String city = "";
				switch (rs.getString("city")) {
				case "01":
					city = "서울";
					break;
				case "10":
					city = "인천";
					break;

				case "20":
					city = "성남";
					break;
				case "30":
					city = "대전";
					break;

				case "40":
					city = "광주";
					break;

				case "60":
					city = "부산";
					break;
				}
				System.out.println(city);
				vo.setCity(city);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		return list;
	}

	public MemberVO getInfo(int custno) {
		MemberVO vo = new MemberVO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement("select * from member_tbl_02 where custno = ?");
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo.setCustno(Integer.parseInt(rs.getString("custno")));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		return vo;
	}

	public int updateMember(MemberVO member) {
		int n = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement("update member_tbl_02 set custname = ?, phone = ?, address = ?, grade = ?, city = ? where custno = ?");
			pstmt.setString(1, member.getCustname());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getAddress());
			pstmt.setString(4, member.getGrade());
			pstmt.setString(5, member.getCity());
			pstmt.setInt(6, member.getCustno());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt);
		}
		return n;
	}

}
