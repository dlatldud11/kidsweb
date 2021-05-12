package kids.members.student.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kids.common.model.SuperDao;

public class StudentDao extends SuperDao {

	public int selectSidByData(String name, String hp) {
		int sid = 0;
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		String sql = "select sid from student where name = ? and hp = ?";
		
		try {
			if(conn == null) {super.conn = super.getConnection() ; }
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, name);
			pstmt.setString(2, hp);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sid = rs.getInt("sid");
			}
		} catch (Exception e) {	
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();} 
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return sid;
	}

}
