package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.MemberDTO; // MemberDTO 클래스를 import
import mvc.database.DBConnection;

public class MemberDAO {

	private Connection connect() throws SQLException {
		try {
			return DBConnection.getConnection();
		} catch (Exception e) {
			throw new SQLException("DB 연결 실패: " + e.getMessage());
		}
	}

	public boolean registerMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean success = false;

		try {
			conn = connect();
			String sql = "INSERT INTO ohsulock_Member (id, password, name, gender, birth, mail, phone, postcode, address, detailAddress, extraAddress, logtime) VALUES (?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getBirth());
			pstmt.setString(6, member.getMail());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getPostcode());
			pstmt.setString(9, member.getAddress());
			pstmt.setString(10, member.getDetailAddress());
			pstmt.setString(11, member.getExtraAddress());

			int rows = pstmt.executeUpdate();
			if (rows > 0) {
				success = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}

		return success;
	}

	public MemberDTO validateMember(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO member = null;

		try {
			conn = connect();
			String sql = "SELECT * FROM ohsulock_Member WHERE id = ? AND password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setBirth(rs.getString("birth")); // 날짜 형식이라면 적절한 변환 필요
				member.setMail(rs.getString("mail"));
				member.setPhone(rs.getString("phone"));
				member.setPostcode(rs.getString("postcode"));
				member.setAddress(rs.getString("address"));
				member.setDetailAddress(rs.getString("detailAddress"));
				member.setExtraAddress(rs.getString("extraAddress"));
				member.setLogtime(rs.getTimestamp("logtime")); // Timestamp 또는 Date 형식으로 가져옴
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return member;
	}
}
