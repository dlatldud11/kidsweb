package kids.management.myclass.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kids.common.model.SuperDao;


public class MyclassDao extends SuperDao{

	public int DeleteData(int class_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Myclass> SelectDataList(int i, int j) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " " ;
		sql += " " ;
		sql += " " ;
		
		List<Myclass> lists = new ArrayList<Myclass>();
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;			
			
			rs = pstmt.executeQuery() ;			
			
			while( rs.next() ){
				Myclass bean = new Myclass();
				
				bean.setClass_id(rs.getInt("class_id"));
				bean.setClass_name(rs.getString("class_name"));
				bean.setTid(rs.getString("tid"));
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
		
		return lists ;
	}

	public int insertData(Myclass bean) {
		String sql = " insert into Myclass(class_id, class_name, tid, remark) " ;
		sql += " values(?, ?, ?, ?) " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getClass_id());
			pstmt.setString(2, bean.getClass_name());
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
		return cnt ;
	}

	public int UpdateData( Myclass bean ){
		String sql = " update Myclass set c" ;
		sql += " " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getClass_id());
			pstmt.setString(2, bean.getClass_name());
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
		return cnt ;
		
		
	}



}
