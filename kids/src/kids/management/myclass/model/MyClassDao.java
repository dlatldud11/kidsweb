package kids.management.myclass.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kids.common.model.SuperDao;

public class MyClassDao extends SuperDao{

	public List<Myclass> selectDataList() {
			List<Myclass> clists = new ArrayList<Myclass>();
			PreparedStatement pstmt = null ;
			ResultSet rs = null;
			String sql = "select * from myclass";
			
			try {
				if(conn == null) {super.conn = super.getConnection() ; }
				pstmt = conn.prepareStatement(sql) ;
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Myclass bean = new Myclass();
					bean.setClass_id(rs.getInt("class_id"));
					bean.setClass_name(rs.getString("class_name"));
					bean.setTid(rs.getString("tid"));
					bean.setRemark("remark");
					
					clists.add(bean);
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
			return clists;
		}
	

}
