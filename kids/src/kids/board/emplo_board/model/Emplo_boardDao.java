package kids.board.emplo_board.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kids.common.model.SuperDao;
import kids.members.employees.model.Employees;

public class Emplo_boardDao extends SuperDao {

	public int selectEmbCount(String mode, String keyword) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select count(*) as cnt from emplo_board " ;
		if(mode.equalsIgnoreCase("all") == false) {
			sql += " where " + mode + "like '%" + keyword + "%' " ;
		}
		
		int cnt = 0 ; //없는 경우의 기본 값
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;			 
			rs = pstmt.executeQuery() ; 
			
			if ( rs.next() ) { 
				cnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			try {
				if( rs != null){ rs.close(); } 
				if( pstmt != null){ pstmt.close(); } 
				this.closeConnection() ;
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		} 		
		return cnt  ; 
	}

	public List<Emplo_board> SelectList(int beginRow, int endRow, String mode, String keyword) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select ranking, empno, tid, content, files, regdate, remark from ( " ;
		sql += " select empno, tid, content, files, regdate, remark, rank() over(order by empno desc) ";
		sql += " as ranking from emplo_board ";
		if(mode.equalsIgnoreCase("all") == false) {
			sql += " where " + mode + "like '%" + keyword + "%' " ;
		}
		sql += " ) where ranking between ? and ? ";
		
		List<Emplo_board> lists = new ArrayList<Emplo_board>();
		
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;	
			
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery() ; 
			
			while ( rs.next() ) { 
				Emplo_board bean = new Emplo_board();
				
				bean.setContent(rs.getString("content"));
				bean.setFiles(rs.getString("files"));
				bean.setEmpno(rs.getInt("empno"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setRemark(rs.getString("remark"));
				bean.setTid(rs.getString("tid"));
				
				lists.add(bean);
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			try {
				if( rs != null){ rs.close(); } 
				if( pstmt != null){ pstmt.close(); } 
			} catch (Exception e2) {
				e2.printStackTrace(); 
			}
		} 		
		
		return lists  ; 
	}
}
