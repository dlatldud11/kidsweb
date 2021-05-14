package kids.board.activity_comment.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kids.board.activity.model.Activity;
import kids.common.model.SuperDao;

public class Activity_commentDao extends SuperDao {

	public int DeleteData(int activity_cmid) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int InsertData(Activity_comment bean) {
		String sql = "insert into activity(activity_cmid, actino, actino, regdate, remark, tid, pid, groupno, orderno, depth)"
		           + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ;
		 
		 PreparedStatement pstmt = null ;
			int cnt = -99999 ; 
			try {
				if( conn == null ){ super.conn = super.getConnection() ; }
				conn.setAutoCommit( false );
				pstmt = super.conn.prepareStatement(sql) ;
				
				pstmt.setInt(1, bean.getActivity_cmid());
				pstmt.setInt(2, bean.getActino());
				pstmt.setString(3, bean.getContent());
				pstmt.setString(4, bean.getRegdate());
				pstmt.setString(5, bean.getRemark());
				pstmt.setString(6, bean.getTid());
				pstmt.setString(7, bean.getPid());
				pstmt.setInt(8, bean.getGroupno());
				pstmt.setInt(9, bean.getOrderno());
				pstmt.setInt(10, bean.getDepth());
				
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

	public List<Activity_comment> SelectDataList(int i, int j) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " " ;
		sql += " " ;
		sql += " " ;
		
		List<Activity_comment> lists = new ArrayList<Activity_comment>();
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			pstmt = super.conn.prepareStatement(sql) ;			
			
			rs = pstmt.executeQuery() ;			
			
			while( rs.next() ){
				Activity_comment bean = new Activity_comment() ;
				
				bean.setActivity_cmid(rs.getInt("activity_cmid"));
				bean.setActino(rs.getInt("actino"));
				bean.setContent(rs.getString("content"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setRemark(rs.getString("remark"));
				bean.setTid(rs.getString("tid"));
				bean.setPid(rs.getString("pid"));
				bean.setGroupno(rs.getInt("groupno"));
				bean.setOrderno(rs.getInt("orderno"));
				bean.setDepth(rs.getInt("depth"));
				
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
	public int UpdateData (Activity_comment bean) {
		String sql = " " ; 
		sql += " " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getActivity_cmid());
			pstmt.setInt(2, bean.getActino());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getRegdate());
			pstmt.setString(5, bean.getRemark());
			pstmt.setString(6, bean.getTid());
			pstmt.setString(7, bean.getPid());
			pstmt.setInt(8, bean.getGroupno());
			pstmt.setInt(9, bean.getOrderno());
			pstmt.setInt(10, bean.getDepth());
			
			
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