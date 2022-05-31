package board;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
public class BoardDAO {
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
			System.out.println("연결 에러:" + e);
		}
		return conn;
	}// getConnection
	// 글 저장
	public int insertBoard(BoardDTO dto) {
		int ok = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "insert into board(title,id,content) values(?,?,?)";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getContent());
			ok = ps.executeUpdate(); // insert, update, delete는 executeUpdate() 사용
		} catch(Exception e) {
			System.out.println("insertBoard 에러:" + e);
		} finally {
			close(conn, ps);
		}// finally
		return ok;
	}// insertBoard
	// 글 리스트
	public ArrayList<BoardDTO> listBoard() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT num,title,regdate,hit FROM board ORDER BY num DESC";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(); // select 는 executeQuery() 사용
			while(rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				Date regdate = rs.getDate("regdate");
				int hit = rs.getInt("hit");
				BoardDTO dto = new BoardDTO();
				dto.setNum(num);
				dto.setTitle(title);
				dto.setRegdate(regdate);
				dto.setHit(hit);
				list.add(dto);
			}// while
		} catch(Exception e) {
			System.out.println("listBoard 에러:" + e);
		} finally {
			close(conn, ps, rs);
		}// finally
		return list;
	}// listBoard
	// 글 읽기
	public BoardDTO boardRead(int num) {
		BoardDTO dto = new BoardDTO();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT num,title,id,content,regdate,hit FROM board WHERE num=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				int num2 = rs.getInt("num");
				String title = rs.getString("title");
				String id = rs.getString("id");
				String content = rs.getString("content");
				Date regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				dto.setNum(num2);
				dto.setTitle(title);
				dto.setId(id);
				dto.setContent(content);
				dto.setRegdate(regdate);
				dto.setHit(hit);
			}// if
		} catch(Exception e) {
			System.out.println("boardRead 에러: " + e);
		} finally {
			close(conn, ps, rs);
		}// finally
		return dto;
	}// boardRead
	// 조회수 증가
	public void updateHit(int num) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "UPDATE board SET hit=hit+1 WHERE num=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("updateHit 에러 : " + e );
		} finally {
			close(conn, ps);
		}// finally
	}// updateHit
	// 글 수정
	public int updateBoard(BoardDTO dto) {
		int ok = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "UPDATE board SET title=?, id=?, content=? WHERE num=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getNum());
			ok = ps.executeUpdate(); // 1:성공, 0:실패
		} catch(Exception e) {
			System.out.println("updateBoard 에러 : " + e);
		} finally {
			close(conn, ps);
		}// finally
		return ok;
	}// updateBoard
	// 글 삭제
	public int deleteBoard(BoardDTO dto) {
		int ok = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "DELETE FROM board WHERE num=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getNum());
			ok = ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("deleteBoard 에러 : " + e);
		} finally {
			close(conn, ps);
		}// finally
		return ok;
	}// deleteBoard
	// 현재 로그인한 계정 비밀번호
	public String selectPwd(String id) {
		String pwd = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT PWD FROM LITH.MEMBER WHERE ID = ?";
		try{
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				pwd = rs.getString("PWD");
			}
		} catch(Exception e){
			System.out.println("selectPwd 에러 : " + e);
		} finally {
			close(conn, ps, rs);
		}
		return pwd;
	 }
	// 글 리스트
	public ArrayList<BoardDTO> listBoard(int begin, int size){
		ArrayList<BoardDTO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT num,title,regdate,hit FROM board order by num desc LIMIT ?,?";
		try{
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, size);
			rs = ps.executeQuery();
			while(rs.next()){
				int num = rs.getInt("num");
				String title = rs.getString("title");
				Date regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				BoardDTO dto = new BoardDTO();
				dto.setNum(num);
				dto.setTitle(title);
				dto.setRegdate(regdate);
				dto.setHit(hit);
				list.add(dto);
			}
		} catch(Exception e){
			System.out.println("listBoard 에러 : " + e);
		} finally {
			close(conn, ps, rs);
		}
		return list;
	}
	// 인기글 가져오기
	public ArrayList<BoardDTO> popularList() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT num,title,regdate,hit FROM board ORDER BY hit DESC, num DESC LIMIT 1,10";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(); // select 는 executeQuery() 사용
			while(rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				Date regdate = rs.getDate("regdate");
				int hit = rs.getInt("hit");
				BoardDTO dto = new BoardDTO();
				dto.setNum(num);
				dto.setTitle(title);
				dto.setRegdate(regdate);
				dto.setHit(hit);
				list.add(dto);
			}// while
		} catch(Exception e) {
			System.out.println("popularList 에러:" + e);
		} finally {
			close(conn, ps, rs);
		}// finally
		
		return list;
	}
	// 글의 수 얻기
	public int countBoard() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) cnt FROM board";
		try{
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				cnt = rs.getInt("cnt");	// rs.getInt(1);
			}
		} catch(Exception e){
			System.out.println("countBoard 에러 : " + e);
		} finally {
			close(conn, ps, rs);
		}
		return cnt;
	 }
	private void close(Connection conn, PreparedStatement ps) {
		if(ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}// if
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}// if
	}// close 2
	private void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}// if
		if(ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}// if
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}// if
	}// close
}// end

/*
1. 글 쓰기폼 : writeform.jsp
2. 글 저장 : write.jsp, insert
3. 글 리스트 : list.jsp, select
4. 글 하나 읽기 : read.jsp, select
5. 글 수정 폼 : updateform.jsp, select
6. 글 수정 : update.jsp, update
7. 글 삭제 폼 : deleteform.jsp
8. 글 삭제 : delete.jsp, delete
*/
