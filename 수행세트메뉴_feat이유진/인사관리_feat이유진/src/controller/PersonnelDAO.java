package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jdbc.JDBCUtil;

public class PersonnelDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public PersonnelVO selectId(String id) {
		System.out.println(id);
		PersonnelVO vo = null;
		try {
			conn = JDBCUtil.getConn();
			String sql = "select * from personnel where id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String name = rs.getString("name");
				System.out.println(name);
				String dept = rs.getString("dept");
				String position = rs.getString("position");
				String duty = rs.getString("duty");
				String phone = rs.getString("phone");
				
				vo = new PersonnelVO(id, name, dept, position, duty, phone);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public ArrayList<PersonnelVO> selectDept(String dept) {
		ArrayList<PersonnelVO> list = new ArrayList<PersonnelVO>();
		System.out.println(dept);
		PersonnelVO vo = null;
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "select * from personnel where dept = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dept);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String position = rs.getString("position");
				String duty = rs.getString("duty");
				String phone = rs.getString("phone");
				
				vo = new PersonnelVO(id, name, dept, position, duty, phone);
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(PersonnelVO vo) {
		int cnt = -1;
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "insert into personnel values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getDept());
			pstmt.setString(4, vo.getPosition());
			pstmt.setString(5, vo.getDuty());
			pstmt.setString(6, vo.getPhone());
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int update(PersonnelVO vo) {
		int cnt = -1;
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "update personnel set name = ?, dept = ?, position = ?, duty = ?, phone = ?  where id = ?";
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getDept());
			pstmt.setString(3, vo.getPosition());
			pstmt.setString(4, vo.getDuty());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getId());
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int delete(String name, String id) {
		int cnt = -1;
		
		try {
			conn = JDBCUtil.getConn();
			String sql = "delete from personnel where id = ? and name = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}
