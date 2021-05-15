package kids.board.diet.model;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import kids.common.model.SuperDao;

public class DietDao extends SuperDao {

	public int InsertDietData(Diet bean) {
			PreparedStatement pstmt = null;
			
			String sql = " insert into diet(regdate, bf, bffiles) ";
				sql += " values(sysdate, ?, ?) ";
			
			int cnt = -99999;
			System.out.println(bean);
			try {
				if( conn == null ) { super.conn = super.getConnection();}
				conn.setAutoCommit(false);
				pstmt = super.conn.prepareStatement(sql);
				
				pstmt.setString(1, bean.getBf());
				pstmt.setString(2, bean.getBffiles());
				
				cnt = pstmt.executeUpdate();
				conn.commit();
			} catch (Exception e) {
				e.printStackTrace();
				try {
					conn.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}finally {
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
	
