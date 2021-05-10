package kids.members.employees.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kids.common.model.SuperDao;

public class EmployeesDao extends SuperDao {

	public Employees SelectData(String id, String password) {
		Employees bean = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from employees where tid = ? and password = ? " ;
		
		try {
			if(conn == null) {super.conn = super.getConnection() ; }
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery() ; 
			
			if(rs.next()) {
				bean = new Employees() ;
				
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setBirth(rs.getString("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGender(rs.getString("gender"));
				bean.setHp(rs.getString("hp"));
				bean.setImage(rs.getString("image"));
				bean.setName(rs.getString("name"));
				bean.setPassword(rs.getString("password"));
				bean.setTid(rs.getString("id"));
				
//				bean.setSubmit(rs.getString("submit"));
//				bean.setResponsibilities(rs.getString("address1"));
//				bean.setClass_id(0);
//				bean.setSalary(0);
				
			}
		} catch (Exception e) {			
			e.printStackTrace();
			bean = null ; 
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();} 
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return bean ;
	}	
	
}
