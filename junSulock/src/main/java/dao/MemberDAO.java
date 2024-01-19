package dao;

import dto.MemberDTO; // MemberDTO 클래스를 import
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
            pstmt.setString(5, member.getBirth().toString()); 
            pstmt.setString(6, member.getMail());

            // 전화번호 처리
            String phone = member.getPhone();
            pstmt.setString(7, phone);

            // 주소 관련 필드
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
            // 자원 정리
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }

        return success;
    }
}
