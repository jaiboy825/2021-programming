package member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.JDBCUtil;

public class MemberDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int maxCustno() {
		int max = 0;
		try {
			con = JDBCUtil.getConnection();
			String sql = "select max(custno) from member_tbl_02";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				max = rs.getInt(1) + 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(max);
		return max;
	}
	
	public int register(MemberVO vo) {
		int cnt = 0;
		try {
			con = JDBCUtil.getConnection();
			
			String sql = "insert into member_tbl_02 values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getCustno()); // 1
			pstmt.setString(2, vo.getCustname()); // 2
			pstmt.setString(3, vo.getPhone()); // 3
			pstmt.setString(4, vo.getAddress()); // 4
			pstmt.setDate(5, vo.getJoindate()); // 5
			pstmt.setString(6, vo.getGrade()); // 6
			pstmt.setString(7, vo.getCity()); // 7
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return cnt;
	}
	
	public ArrayList<MemberVO> selectMembers() {
		ArrayList<MemberVO> list = new ArrayList<>();
		try {
			con = JDBCUtil.getConnection();
			String sql = "select * from member_tbl_02";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				Date joindate = rs.getDate("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				
				MemberVO vo = new MemberVO(custno, custname, phone, address, joindate, grade, city);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return list;
	}
	
	public MemberVO selectMember(int custno) {
		MemberVO vo = new MemberVO();
		try {
			con = JDBCUtil.getConnection();
			String sql = "select * from member_tbl_02 where custno = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				Date joindate = rs.getDate("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				
				vo = new MemberVO(custno, custname, phone, address, joindate, grade, city);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return vo;
	}
	
	public int update(MemberVO vo) {
		int cnt = 0;
		
		try {
			con = JDBCUtil.getConnection();
			String sql = "update MEMBER_TBL_02 set custname = ?, phone = ?, address = ?, grade = ?, city = ? where custno = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCustname()); // 1
			pstmt.setString(2, vo.getPhone()); // 2
			pstmt.setString(3, vo.getAddress()); // 3
			pstmt.setString(4, vo.getGrade()); // 4
			pstmt.setString(5, vo.getCity()); // 5
			pstmt.setInt(6, vo.getCustno());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return cnt;
	}
	
	public ArrayList<PriceVO> getPrice() {
		ArrayList<PriceVO> list = new ArrayList<>();
		try {
			con = JDBCUtil.getConnection();
			String sql = "select member.custno, member.custname, member.grade, sum(money.price) from member_tbl_02 member, money_tbl_02 money " + 
					"where member.custno = money.custno " + 
					"group by member.custno, member.custname, member.grade " + 
					"order by sum(money.price) desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String grade = rs.getString("grade");
				int price = rs.getInt("sum(money.price)");
				
				PriceVO vo = new PriceVO(custno, custname, grade, price);
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
