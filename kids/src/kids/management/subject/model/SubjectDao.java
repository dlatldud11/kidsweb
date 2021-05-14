package kids.management.subject.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kids.common.model.SuperDao;
import kids.management.myclass.model.Myclass;

public class SubjectDao extends SuperDao{

	 public int DeleteData(int subject_code) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int InsertData(Subject bean) {
		String sql = "insert into subject(subject_code, subject, tid)"
				+ " values(?, ?, ?)" ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ; 
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getSubject_code());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getTid());
		
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
		return cnt ;
	}


	public List<Subject> SelectDataList(int i, int subject_code) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from subject " ;
		sql += " where mid = ? " ;
		
		List<Subject> lists = new ArrayList<Subject>() ;
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, subject_code);
			
			rs = pstmt.executeQuery() ;
			
			while (rs.next()) {
				Subject bean = new Subject();
				bean.setSubject_code(subject_code);
				lists.add(bean);
			
			
			
			
			
			
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
	
	public int UpdateData( Subject bean ){
		String sql = " " ; 
		sql += " " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getSubject_code());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getTid());
			pstmt.setString(4, bean.getRemark());
			
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
