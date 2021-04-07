package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.MemberVO;

public class MemberDAO {
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "hr", "hr");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public ArrayList<MemberVO> getListNum(String memberNum){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from personnel where id = ?");
			pstmt.setString(1, memberNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setDept(rs.getString(3));
				vo.setPosition(rs.getString(4));
				vo.setDuty(rs.getString(5));
				vo.setPhone(rs.getString(6));
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public ArrayList<MemberVO> getListDept(String dept){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from personnel where dept = ?");
			pstmt.setString(1, dept);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setDept(rs.getString(3));
				vo.setPosition(rs.getString(4));
				vo.setDuty(rs.getString(5));
				vo.setPhone(rs.getString(6));
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
		
	}
	public int insertMember(MemberVO vo) {
		int num = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into personnel values (?,?,?,?,?,?)");
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getDept());
			pstmt.setString(4, vo.getPosition());
			pstmt.setString(5, vo.getDuty());
			pstmt.setString(6, vo.getPhone());
			num = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return num;
	}
	public int updateMember(MemberVO vo) {
		int num = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update personnel set name = ?, dept = ?, position = ?, duty = ?, phone = ? where id = ?");
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getDept());
			pstmt.setString(3, vo.getPosition());
			pstmt.setString(4, vo.getDuty());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getId());
			num = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return num;
	}
	
	public int deleteMember(String name, String number) {
		int num = 0;
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from personnel where id = ? and name = ?");
			pstmt.setString(1, number);
			pstmt.setString(2, name);
			num = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return num;
	}
}
