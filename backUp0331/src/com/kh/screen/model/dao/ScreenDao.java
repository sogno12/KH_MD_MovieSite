package com.kh.screen.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.screen.model.vo.PageInfo;
import com.kh.screen.model.vo.Screen;
import com.kh.screen.model.vo.ScreenCBS;

public class ScreenDao {
	Properties prop = new Properties();
	public ScreenDao(){ //기본생성자
		String fileName = ScreenDao.class.getResource("/sql/screen/screen-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Screen> selectScreen(Connection conn, String theaterNo, String movieNo, String screenDate) {
		List<Screen> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSchedule");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, screenDate);
			pstmt.setString(2, movieNo);
			pstmt.setString(3, theaterNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Screen(rset.getInt("SCREEN_NO"), rset.getInt("ROOM_NO"),
						rset.getInt("MOVIE_NO"), rset.getTimestamp("SCREEN_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public List<ScreenFlatDto> selectScreen(Connection conn, String theaterNo, String screenDate) {
		List<ScreenFlatDto> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectScreenDto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, screenDate);
			pstmt.setString(2, theaterNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new ScreenFlatDto(rset.getInt("THEATER_NO"), rset.getInt("ROOM_NO"), rset.getString("NAME"),
						rset.getInt("SCREEN_NO"), rset.getInt("MOVIE_NO"), rset.getString("TITLE"), 
						rset.getInt("AGE_LIMIT"), rset.getTimestamp("SCREEN_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ScreenSelectDto reservedScreen(Connection conn, String screenNo) {
		ScreenSelectDto s = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reservedScreen");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, screenNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				s = new ScreenSelectDto(
						rset.getInt("SCREEN_NO"), rset.getInt("THEATER_NO"), rset.getString("THEATER_NAME"),
						rset.getInt("ROOM_NO"), rset.getString("ROOM_NAME"), rset.getInt("MOVIE_NO"), rset.getString("TITLE"),
						rset.getInt("AGE_LIMIT"), rset.getTimestamp("SCREEN_DATE"), rset.getInt("MAINPOSTER"), rset.getString("MODIFY_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}

	public String screenTheater(Connection conn, String movieNo, String roomNo, String screenTime) {
		String screenNo = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("screenTh");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieNo);
			pstmt.setString(2, roomNo);
			pstmt.setString(3, screenTime);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				screenNo = rset.getString("SCREEN_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return screenNo;
	}

	public int insertScreenInfo(Connection conn, int roomNo, int movieNo, String[] sDate) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertScreenInfo");
		
				
		try {
		
			
			for(int i=0; i<sDate.length;i++) {
			
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setInt(1, roomNo);
				pstmt.setInt(2, movieNo);
				pstmt.setString(3, sDate[i]); // "2020-11-22 11:20:00
				
				result=pstmt.executeUpdate();
			}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
				finally {
					
					close(pstmt);
				}
				return result;	
			}

	public ArrayList<ScreenCBS> selectWholeMovie(Connection conn, int movieNo, int theaterNo) {
		
		ArrayList<ScreenCBS> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWholeScreenInfo");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, movieNo);
			pstmt.setInt(2, theaterNo);
			
			rset = pstmt.executeQuery();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			
			
			
			while(rset.next()) {
								
				ScreenCBS m = new ScreenCBS(rset.getDate("screenDate"), rset.getString("name"));
				
				list.add(m);
			}
					
		} catch (SQLException e) {
			
			e.printStackTrace();
	}
		finally {
			
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<ScreenCBS> updateScreenForm(Connection conn, int theaterNo) {
		
		ArrayList<ScreenCBS> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("updateScreenList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, theaterNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ScreenCBS sc = new ScreenCBS(rset.getInt("movie_no"),rset.getString("title")
											);
			
						list.add(sc);
			
			}
					
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<ScreenCBS> selectOffList(Connection conn, PageInfo pi, int theaterNo) {
		
		ArrayList<ScreenCBS> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectScreenList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, theaterNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new ScreenCBS(rset.getInt("screen_no"),
									   rset.getInt("room_no"),
									   rset.getInt("movie_no"),
									   rset.getString("name"),
									   rset.getString("title"),
									   rset.getDate("screen_date")));
				
				
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
public int getScreenListCount(Connection conn) {
		
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getScreenListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

public int updateScreen(Connection conn, int roomNo, int movieNo, int screenNo, String dt) {

	int result = 0;
	
	PreparedStatement pstmt = null;
	
	String sql = prop.getProperty("updateScreen");
	
	try {
		pstmt= conn.prepareStatement(sql);
		pstmt.setInt(1, roomNo);
		pstmt.setInt(2, movieNo);
		pstmt.setString(3, dt);
		pstmt.setInt(4, screenNo);
		
		result=pstmt.executeUpdate();
	} catch (SQLException e) {
	
		e.printStackTrace();
	}finally {
		
		close(conn);
	}
	
	
	
	return result;
}
	

	
}
