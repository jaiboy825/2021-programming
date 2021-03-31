package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.InfoVO;
import vo.MemberVO;
import vo.TeacherVO;

public class MemberDAO {
	public int getCount() {
		int num = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = common.getConnection();
			pstmt = conn.prepareStatement("select count(id) from course_tbl");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;

	}

	public ArrayList<MemberVO> getList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = common.getConnection();
			pstmt = conn.prepareStatement(
					"select a.id, a.name, a.credit, b.name, a.week, a.start_hour, a.end_end  from course_tbl a, lecturer_tbl b where a.lecturer = b.idx");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setCredit(rs.getInt(3));
				vo.setTeacher(rs.getString(4));
				String weeks = "";
				switch (rs.getInt(5)) {
				case 1:
					weeks = "월";
					break;
				case 2:
					weeks = "화";
					break;
				case 3:
					weeks = "수";
					break;
				case 4:
					weeks = "목";
					break;
				case 5:
					weeks = "금";
					break;
				case 6:
					weeks = "토";
					break;
				}
				vo.setWeek(weeks);
				vo.setStart_hour(rs.getInt(6));
				vo.setEnd_end(rs.getInt(7));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public ArrayList<TeacherVO> getTeacherList() {
		ArrayList<TeacherVO> list = new ArrayList<TeacherVO>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = common.getConnection();
			pstmt = conn.prepareStatement("select * from lecturer_tbl");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TeacherVO vo = new TeacherVO();
				vo.setIdx(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setMajor(rs.getString(3));
				vo.setField(rs.getString(4));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public int insertInfo(InfoVO vo) {
		int num = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = common.getConnection();
			pstmt = conn.prepareStatement("insert into COURSE_TBL values(?,?,?, ?, ?, ?, ?)");
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getCredit());
			pstmt.setString(4, vo.getTeacher());
			pstmt.setInt(5, vo.getWeek());
			pstmt.setInt(6, vo.getStart());
			pstmt.setInt(7, vo.getEnd());

			num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;

	}

	public int delete(String id) {
		int num = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = common.getConnection();
			pstmt = conn.prepareStatement("delete from course_tbl where id = ?");
			pstmt.setString(1, id);
			num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;

	}

	public int deleteT(String id) {
		int num = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = common.getConnection();
			pstmt = conn.prepareStatement("delete from lecturer_tbl where idx = ?");
			pstmt.setString(1, id);
			num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;

	}

	public InfoVO getInfo(String id) {
		InfoVO vo = new InfoVO();
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = common.getConnection();
			pstmt = conn.prepareStatement("select * from course_tbl where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setCredit(rs.getInt(3));
				vo.setTeacher(rs.getString(4));
				vo.setWeek(rs.getInt(5));
				vo.setStart(rs.getInt(6));
				vo.setEnd(rs.getInt(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

	public int updateInfo(InfoVO vo) {
		int num = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = common.getConnection();
			pstmt = conn.prepareStatement(
					"update course_tbl set name = ?, credit = ?, lecturer = ?, week = ?, start_hour = ?, end_end = ? where id = ?");
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getCredit());
			pstmt.setString(3, vo.getTeacher());
			pstmt.setInt(4, vo.getWeek());
			pstmt.setInt(5, vo.getStart());
			pstmt.setInt(6, vo.getEnd());
			pstmt.setString(7, vo.getId());
			num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;

	}

	public int getTnum() {
		int num = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = common.getConnection();
			pstmt = conn.prepareStatement("select max(idx) from lecturer_tbl");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(num);
		return num + 1;

	}

	public int insertTInfo(TeacherVO vo) {
		int num = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = common.getConnection();
			pstmt = conn.prepareStatement("insert into lecturer_tbl values(?, ?, ?, ?)");
			pstmt.setInt(1, vo.getIdx());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getMajor());
			pstmt.setString(4, vo.getField());
			num = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;

	}
}
