package kids.board.timetable.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kids.common.controller.SuperClass;
import kids.common.model.SuperDao;
import kids.management.myclass.model.Myclass;

public class TimetableDao extends SuperDao{
	

	public int DeleteData(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int InsertData(Timetable bean) {
		String sql = " insert into ";
		sql += " values() " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(cnt, cnt);
			pstmt.setInt(cnt, cnt);
			pstmt.setInt(cnt, cnt);
			pstmt.setString(cnt, sql);
			pstmt.setString(cnt, sql);
			pstmt.setString(cnt, sql);
			
			cnt = pstmt.executeUpdate() ; 
			conn.commit(); 
		} catch (Exception e) {
			SQLException err = (SQLException)e ;			
			cnt = - err.getErrorCode() ;			
			e.printStackTrace();
			try {
				conn.rollback(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally{
			try {
				if( pstmt != null ){ pstmt.close(); }
				super.closeConnection(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public List<Timetable> SelectDataList(int i, int j) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " " ;
		sql += " " ;
		sql += " " ;
		
		List<Timetable> lists = new ArrayList<Timetable>();
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;			
			
			rs = pstmt.executeQuery() ;			
			
			while( rs.next() ){
				Timetable bean = new Timetable();
				
				bean.setNo(rs.getInt("no"));
				bean.setSubject_code(rs.getInt("subject_code"));
				bean.setClass_id(rs.getInt("class_id"));
				bean.setTime(rs.getString("time"));
				bean.setDay(rs.getString("day"));
				bean.setRemark(rs.getString("remark"));
				
				lists.add( bean ) ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if( rs != null ){ rs.close(); }
				if( pstmt != null ){ pstmt.close(); }
				super.closeConnection(); 
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		}
		
		return lists;
	}
	
	public int UpdateData( Timetable bean ){
		String sql = " " ; 
		sql += " " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
		
			pstmt.setInt(1, bean.getNo());
			pstmt.setInt(2, bean.getSubject_code());
			pstmt.setInt(3, bean.getClass_id());
			pstmt.setString(4, bean.getTime());
			pstmt.setString(5, bean.getDay());
			pstmt.setString(6, bean.getRemark());
		
		
			cnt = pstmt.executeUpdate() ; 
			conn.commit(); 
		} catch (Exception e) {
			SQLException err = (SQLException)e ;			
			cnt = - err.getErrorCode() ;			
			e.printStackTrace();
			try {
				conn.rollback(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally{
			try {
				if( pstmt != null ){ pstmt.close(); }
				super.closeConnection(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
		
		
	}
	
	}
