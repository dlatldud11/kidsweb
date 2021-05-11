package kids.members.employees.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
				bean.setTid(rs.getString("tid"));
				bean.setSubmit(rs.getString("submit"));
				bean.setResponsibilities(rs.getString("responsibilities"));
				bean.setClass_id(rs.getInt("class_id"));
				bean.setSalary(rs.getInt("salary"));
				
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

	public int InsertData(Employees bean) {
		PreparedStatement pstmt = null;
		
		String sql = " insert into employees(tid, class_id, name, join_date, salary, image, birth, hp, address1, address2, gender, responsibilities, password, submit, subject_code, remark, email, zipcode) ";
			sql += " values(?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		
		int cnt = -99999;
		System.out.println(bean);
		try {
			if( conn == null ) { super.conn = super.getConnection();}
			conn.setAutoCommit(false);
			pstmt = super.conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getTid());
			pstmt.setInt(2, bean.getClass_id());
			pstmt.setString(3, bean.getName());
			pstmt.setInt(4, bean.getSalary());
			pstmt.setString(5, bean.getImage());
			pstmt.setString(6, bean.getBirth());
			pstmt.setString(7, bean.getHp());
			pstmt.setString(8, bean.getAddress1());
			pstmt.setString(9, bean.getAddress2());
			pstmt.setString(10, bean.getGender());
			pstmt.setString(11, bean.getResponsibilities());
			pstmt.setString(12, bean.getPassword());
			pstmt.setString(13, bean.getSubmit());
			pstmt.setInt(14, bean.getSubject_code());
			pstmt.setString(15, bean.getRemark());
			pstmt.setString(16, bean.getEmail());
			pstmt.setString(17, bean.getZipcode());
			
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

	public Employees SelectDataByPk(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from employees ";
		sql += " where tid = ? ";
		
		Employees bean = null;
		
		try {
			if(this.conn == null) {this.conn = this.getConnection();}
			pstmt = this.conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new Employees();
				
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setBirth(rs.getString("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGender(rs.getString("gender"));
				bean.setHp(rs.getString("hp"));
				bean.setImage(rs.getString("image"));
				bean.setName(rs.getString("name"));
				bean.setPassword(rs.getString("password"));
				bean.setTid(rs.getString("tid"));
				bean.setSubmit(rs.getString("submit"));
				bean.setResponsibilities(rs.getString("responsibilities"));
				bean.setClass_id(rs.getInt("class_id"));
				bean.setSalary(rs.getInt("salary"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) { rs.close(); }
				if(pstmt != null) {pstmt.close();}
				this.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return bean;
	}	
	
}
