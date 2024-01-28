package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvc.database.DBConnection;

// 데이터 엑세스하는 클래스 //
public class BoardDAO {
	private static BoardDAO instance;

	private BoardDAO() {

	}

	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}

	// 게시판 하단의 페이징과 검색기능 구현을 위해 board 테이블에서 원하는 조건에 맞는 레코드 개수를 얻어오는 함수 생성 //
	public int getListCount(String items, String text) { // items=컬럼명, text=사용자 입력 키워드 문자열
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0; // 선택된 총 게시글의 개수

		String sql;

		// 검색어가 없으면 리스트 모두 가져오고 검색어가 있으면 검색한 리스트 가져올 때 매개변수로 받은 items와 text의 값이 들어갈 수 있게
		// 함 //
		if (items == null && text == null)
			sql = "select count(*) from osulock_board";
		else
			sql = "select count(*) from osulock_board where " + items + " like '%" + text + "%'";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// rs의 첫번째 결과값을 가지고 와서 정수 타입의 x(선택된 총 게시글의 갯수)에 저장
			if (rs.next())
				x = rs.getInt(1);

		} catch (Exception e) {
			System.out.println("getBoardList()Error : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 선택된 총 게시글의 갯수 리턴
		return x;
	}

	// board 테이블의 레코드 목록을 가져오는 함수 생성 //
	public ArrayList<BoardDTO> getBoardList(int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 최신 글이 맨 앞에 오도록 오름차순으로 읽어옴 //
		String sql = "select * from osulock_board order by num desc";

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setImg(rs.getString("img"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setUpdate_day(rs.getString("update_day"));
				board.setPrice(rs.getInt("price"));
				list.add(board);
			}
			// 저장한 게시글의 목록을 리턴 //
			return list;
		} catch (Exception e) {
			System.out.println("getBoardList()Error : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	// board 테이블의 레코드 목록 가져오는 apge, limit, text 네 개의 매갭 변수를 가지느 ㄶ마수 생성
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getListCount(items, text);

		// start=현재 페이지 넘버-1 후 limit(5)를 곱한 값을 저장 => 0,5,15...
		int start = (page - 1) * limit;

		// rs에서 활용할 index를 정의 / 1, 6, 11...
		int index = start + 1;

		String sql;
		// 검색어가 없으면 최신글이 맨앞으로 오도록 오름차순으로 읽어옴 //
		if (items == null && text == null)
			sql = "select * from osulock_board order by num desc";
		//
		else
			sql = "select * from osulock_board where " + items + " like '%" + text + "%' order by num desc";

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			// rs.absolute(index)를 사용하기 위해 매개변수를 sql,
			// ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY 사용
			// => TYPE_SCROLL_INSENSITIVE : rs에서 화면을 이동하는데 사용할 수 있는 커서로 rs.next()를 사용하면 다음
			// 결과 행을 가져오고 다음에는 이전 값을 사용 못하지만 이 옵션을 설정하여 rs를 만들면 한 번 커서가 지나간 다음에도 다시 커서를 앞으로
			// 되돌릴 수 있음
			// => CONCUR_READ_ONLY : rs로 가져온 row의 값을 insert, update로 사용하지 않고 데이터를 읽기만 하겠다
			rs = pstmt.executeQuery();

			// rs.absolute(index) : rs 커서를 원하는 위치(index)의 검색 행으로 이동하는 메소드로 rs로 가져온 행의
			// 1,6,11...이런식으로 loop를 돌며 dto객체 생성, 각 컬럼의 데이터를 얻어와 설정
			while (rs.absolute(index)) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setImg(rs.getString("img"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setUpdate_day(rs.getString("update_day"));
				board.setPrice(rs.getInt("price"));

				list.add(board);

				if (index < (start + limit) && index <= total_record)
					index++;
				// page:1, start:0,limit:5,index:1,total_record:6 이라고 가정
				// => 1<(0+5) && 1<=6 -> index:2 -5<(5+5) && 5<=6 -> index:6
				// => 2<(0+5) && 2<=6 -> index:3 -6<(5+5) && 6<=6 -> index:7
				// => 3<(0+5) && 3<=6 -> index:4 -7<(5+5) && 7<=6 -> index는 증가하지 않고 7 유지
				// => 4<(0+5) && 4<=6 -> index:5
				// => 5<(0+5) && 5<=6 -> index는 1을 증가하지 않고 그대로 5 유지
				else
					break;
			}
			// 저장한 게시글의 목록을 리턴 //
			return list;
		} catch (Exception e) {
			System.out.println("getBoardList()Error : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	// member 테이블에서 인증된 아이디의 사용자 명을 가져오는 함수
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String name = null;
		String sql = "select * from ohsulock_Member where id=?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				name = rs.getString("name");
			return name;
		} catch (Exception e) {
			System.out.println("getLoginNameById()Error : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public void insertBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "insert into osulock_board values (num.nextval,?,?,?,?,?,?,?,sysdate,sysdate, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getHit());
			pstmt.setString(6, board.getIp());
			pstmt.setString(7, board.getImg());
			pstmt.setInt(8, board.getPrice());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertBoard()Error : " + e);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 선택된 글 상세 내용을 가져오는 함수
	public BoardDTO getBoardByNum(int num, int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;

		// 내가 본 글의 조회수를 증가시키는 함수
		updateHit(num);

		String sql = "select * from osulock_board where num=?";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setImg(rs.getString("img"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setUpdate_day(rs.getString("update_day"));
				board.setPrice(rs.getInt("price"));
			}
		} catch (Exception e) {
			System.out.println("getBoardByNum()Error : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return board;
	}

	// 조회수 증가 기능
	public void updateHit(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "select hit from osulock_board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			int hit = 0;

			if (rs.next())
				hit = rs.getInt("hit") + 1;

			sql = "update osulock_board set hit=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hit);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateHit()Error : " + e);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 본인이 올린 글 내용
	public void updateBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update osulock_board set subject=?,content=?,ip=?,update_day=sysdate where num=?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			// conn.setAutoCommit(false);

			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getIp());
			pstmt.setInt(4, board.getNum());
			pstmt.executeUpdate();
			// conn.commit();
		} catch (Exception e) {
			System.out.println("updateBoard()Error : " + e);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 본인 글 삭제하는 기능
	public void deleteBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "delete from osulock_board where num=?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteBoard()Error : " + e);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}