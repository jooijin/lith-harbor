package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3307/lith?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASS = "1234";
	
	// 연결 메소드
	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASS);
		} catch(Exception e) {
			System.out.println("연결 에러 : " + e);
		}
		return conn;
	}
	// 로그인 사용자 확인
	public MemberDTO verifyMember(String id, String pwd) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT NICKNAME, LEVEL, MESO FROM LITH.MEMBER WHERE ID=? AND PWD=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			if(rs.next()) {
				String nickname = rs.getString("nickname");
				int level = rs.getInt("level");
				int meso = rs.getInt("meso");
				dto.setNickname(nickname);
				dto.setLevel(level);
				dto.setMeso(meso);
			}
		} catch(Exception e) {
			System.out.println("verifyMember 에러 : " + e);
		} finally {
			close(conn, ps);
		}// finally
		return dto;
	}// verifyMember
	
	// close with 2 parameters
	private void close(Connection conn, PreparedStatement ps) {
		if(ps != null) {
			try {
				ps.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}//close
	
	// close with 3 parameters
	private void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(ps != null) {
			try {
				ps.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}//close
}
