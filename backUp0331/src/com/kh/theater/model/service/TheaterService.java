package com.kh.theater.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.movie.model.vo.MovieCBS;
import com.kh.room.model.vo.RoomCBS;
import com.kh.theater.model.dao.TheaterDao;
import com.kh.theater.model.vo.PageInfo;
import com.kh.theater.model.vo.Theater;
import com.kh.theater.model.vo.TheaterCBS;

public class TheaterService {

	/** 01. SUJIN
	 * @return		
	 */
	public List<Theater> selectAll() {
		Connection conn = getConnection();
		
		List<Theater> list = new TheaterDao().selectAll(conn);
		
		close(conn);
		return list;
	}

	/** 02. SUJIN
	 * @param sectionNo	
	 * @return	
	 */
	public List<Theater> selectAllBySection(String sectionNo) {
		Connection conn = getConnection();
		
		List<Theater> list = new TheaterDao().selectAllBySection(conn, sectionNo);
		
		close(conn);
		
		return list;
	}

	/** 03. SUJIN
	 * @param theaterNo	
	 * @return			
	 */
	public Theater selectTheater(String theaterNo) {
		Connection conn = getConnection();
		
		Theater t = new TheaterDao().selectTheater(conn, theaterNo);
		
		close(conn);
		
		return t;
	}
	
	public int getTheaterListCount() {
		
		Connection conn = getConnection();

		int listCount = new TheaterDao().getOnListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<TheaterCBS> selectTheaterList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<TheaterCBS> list = new TheaterDao().selectTheaterList(conn,pi);
		
		close(conn);
		return list;
	}
	
	/* public int insertTheater(TheaterCBS t, String[] roomName) { */
		
	public int insertTheater(TheaterCBS t, String[] roomName) {
		Connection conn = getConnection();
		
		int result1 = new TheaterDao().insertTheater(conn,t);
		
		int result2 = new TheaterDao().insertRoom(conn, roomName);
		if(result1*result2>0) {
			
			commit(conn);
		}else{
			
			rollback(conn);
		}
		close(conn);
		
		
		return result1*result2;
	}
	
	public TheaterCBS selectTheater(int theaterNo) {
		
		Connection conn = getConnection();
		
		TheaterCBS t = new TheaterDao().selectTheater(conn, theaterNo);
		
		close(conn);
		
		return t;
	}
	
	public ArrayList<RoomCBS> getRoomInfo(int TheaterNo) {
		
		Connection conn = getConnection();
		
		
		ArrayList<RoomCBS> list = new TheaterDao().getRoomInfo(conn,TheaterNo);
		
		close(conn);
		return list;
	}
	
	public ArrayList<MovieCBS> selectModalMovieList(int theaterNo) {
		Connection conn = getConnection();
		
		ArrayList<MovieCBS> list = new TheaterDao().selectModalMovieList(conn, theaterNo);
		
		close(conn);
		return list;
	}

	public int updateTheater(TheaterCBS t) {
		
		Connection conn = getConnection();
		
		int result = new TheaterDao().updateTheater(conn,t);
		
		if(result>0) {
			
			commit(conn);
		}else {
			rollback(conn);
			
		}
		close(conn);
		
		
		return result;
	}

	public ArrayList<TheaterCBS> selectWholeTheater(int sectionNo) {
		
		Connection conn = getConnection();
		
		ArrayList<TheaterCBS> list = new TheaterDao().selectWholeTheater(conn, sectionNo);
		
		close(conn);
		
		return list;
	}	
	
	
}
