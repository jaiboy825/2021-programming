package my.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	private Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
		} catch (ClassNotFoundException e) {
			System.out.println("driver not found");
		} catch (SQLException e) {
			System.out.println("DB connection failed");
		}
		return conn;
	}

	public List<MemberDTO> selectMembers() {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			conn = getConnection();

			String sql = "select * from member";
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			list = makeArray(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
			}
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return list;
	}

	private List<MemberDTO> makeArray(ResultSet rs) throws SQLException {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		while (rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setName(rs.getString("name"));
			dto.setId(rs.getString("id"));
			dto.setPass(rs.getString("pass"));
			dto.setBirth(rs.getInt("birth"));
			dto.setGender(rs.getString("gender"));
			dto.setJob(rs.getString("job"));
			dto.setAddress(rs.getString("address"));
			dto.setRegDate(rs.getDate("regDate"));
			list.add(dto);
		}
		return list;
	}

	public boolean idAvailableChk(String id) {
		boolean result = false;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {
			conn = getConnection();

			String sql = "select * from member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();
			if (!rs.next())
				result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
			}
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return result;
	}

	public boolean insertMember(MemberDTO dto) {
		boolean result = false;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;

		try {
			conn = getConnection();

			String sql = "insert into member values(?,?,?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPass());
			ps.setInt(4, dto.getBirth());
			ps.setString(5, dto.getGender());
			ps.setString(6, dto.getJob());
			ps.setString(7, dto.getAddress());

			int n = ps.executeUpdate();
			if (n > 0)
				result = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
			}
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return result;

	}

	public int loginCheck(String id, String pass) {
		int result = -1; // -1: not found 0: pwd error 1: success
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			conn = getConnection();

			String sql = "select pass from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString("pass");
				if (dbPass.equals(pass)) {
					result = 1;
				} else {
					result = 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
			}
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return result;
	}

	public MemberDTO selectMember(String id) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		MemberDTO dto = new MemberDTO();
		try {
			conn = getConnection();
			String sql = "select * from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setBirth(rs.getInt("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setJob(rs.getString("job"));
				dto.setAddress(rs.getString("address"));
				dto.setRegDate(rs.getDate("regDate"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
			}
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return dto;
	}

	public boolean updateMember(MemberDTO dto) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		boolean temp = false;
		int n = 0;
		try {
			conn = getConnection();
			String sql = "update member set pass = ?, birth = ?, gender = ?, job = ?, address = ? where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getPass());
			ps.setInt(2, dto.getBirth());
			ps.setString(3, dto.getGender());
			ps.setString(4, dto.getJob());
			ps.setString(5, dto.getAddress());
			ps.setString(6, dto.getId());
			n = ps.executeUpdate();
			if (n > 0) {
				temp = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
			}
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return temp;
	}

	public boolean deleteMember(String id, String pass) {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		boolean temp = false;
		int n = 0;
		try {
			conn = getConnection();
			String sql = "delete from member where id = ? and pass = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pass);
			n = ps.executeUpdate();
			if (n > 0) {
				temp = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
			}
			try {
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return temp;
	}

}
