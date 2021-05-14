package kids.board.activity.model;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kids.common.model.SuperDao;


public class ActivityDao extends SuperDao {

	public int DeleteData(int actino) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int InsertData(Activity bean) {
		String sql = " " ;
		sql += " " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getActino());
			pstmt.setInt(2, bean.getSubject_code());
			pstmt.setString(3, bean.getTitle());
			pstmt.setString(4, bean.getContent());
			pstmt.setString(5, bean.getImage());
			pstmt.setString(6, bean.getRegdate());
			pstmt.setString(7, bean.getRemark());
			pstmt.setString(8, bean.getTid());
			pstmt.setInt(9, bean.getClass_id());
			pstmt.setInt(10, bean.getReadhit());
			
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

	public List<Activity> SelectDataList(int i, int j) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " " ;
		sql += " " ;
		sql += " " ;
		
		List<Activity> lists = new ArrayList<Activity>();
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;			
			
			rs = pstmt.executeQuery() ;			
			
			while( rs.next() ){
				Activity bean = new Activity();
				
				bean.setActino(rs.getInt("actino"));
				bean.setSubject_code(rs.getInt("subject_code"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setImage(rs.getString("image"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setRemark(rs.getString("remark"));
				bean.setTid(rs.getString("tid"));
				
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

	public int UpdateData (Activity bean) {
		String sql = " " ;
		sql += " " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getActino());
			pstmt.setInt(2, bean.getSubject_code());
			pstmt.setString(3, bean.getTitle());
			pstmt.setString(4, bean.getContent());
			pstmt.setString(5, bean.getImage());
//			pstmt.setDate(6, (Date) bean.getRegdate());
			pstmt.setString(7, bean.getRemark());
			pstmt.setString(8, bean.getTid());
			pstmt.setInt(9, bean.getClass_id());
			pstmt.setInt(10, bean.getReadhit());
			
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
	
		public Activity SelectDataByPk(int actino) {
			PreparedStatement pstmt = null ;
			ResultSet rs = null ;
			
			String sql = " " ;
			sql += " " ;
			sql += " " ;
			
			Activity bean = null ;
			try {
				if( this.conn == null ){ this.conn = this.getConnection() ; }			
				pstmt = this.conn.prepareStatement(sql) ;			
				
				pstmt.setInt(1, actino);
				
				rs = pstmt.executeQuery() ; 
				
				if ( rs.next() ) {
					bean = new Activity();
					
					bean.setActino(rs.getInt("actino"));
					bean.setSubject_code(rs.getInt("subject_code"));
					bean.setTitle(rs.getString("title"));
					bean.setContent(rs.getString("content"));
					bean.setImage(rs.getString("image"));
					bean.setRegdate(rs.getString("regdate"));
					bean.setRemark(rs.getString("remark"));
					bean.setTid(rs.getString("tid"));
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
			return bean  ;
	
	}
}