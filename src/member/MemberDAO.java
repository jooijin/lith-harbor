package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	// 오늘의 팁 가지고 옴
	public ArrayList<String> selectTodayTip(){
		ArrayList<String> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT TIP FROM LITH.TODAYTIP";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				String tip = rs.getString("TIP");
				list.add(tip);
			}
		} catch(Exception e) {
			System.out.println("selectTodayTip 에러 : " + e);
		} finally {
			close(conn, ps, rs);
		}
		return list;
	}
	// selectTodayTip
	
	// 메소 당첨금 더하기
	public int mesoPlus(int meso, String id) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "UPDATE LITH.MEMBER SET MESO = MESO+? WHERE ID=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, meso);
			ps.setString(2, id);
			cnt = ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("mesoPlus 에러 : " + e);
		} finally {
			close(conn, ps);
		}
		return cnt;
	}
	
	// 업데이트 된 메소값 select
	public int selectMeso(String id){
		int meso = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT MESO FROM LITH.MEMBER WHERE ID=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				meso = rs.getInt("MESO");
			}
		} catch(Exception e) {
			System.out.println("selectMeso 에러 : " + e);
		} finally {
			close(conn, ps, rs);
		}
		return meso;
	}
	
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
