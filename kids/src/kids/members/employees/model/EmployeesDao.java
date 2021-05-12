package kids.members.employees.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	public int selectEmpCount(String mode, String keyword) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select count(*) as cnt from employees " ;
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

	public List<Employees> SelectDataList(int beginRow, int endRow, String mode, String keyword) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select ranking, tid, name, gender, birth, hp, email, submit, remark from ( " ;
		sql += "  select tid, name, gender, birth, hp, email, submit, remark, rank() over(order by name desc) ";
		sql += " as ranking from employees where submit = ? ";
		if(mode.equalsIgnoreCase("all") == false) {
			sql += " and " + mode + "like '%" + keyword + "%' " ;
		}
		sql += " ) where ranking between ? and ? ";
		
		List<Employees> lists = new ArrayList<Employees>();
		
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;	
			
			String nosub = "미승인";
			
			pstmt.setString(1, nosub);
			pstmt.setInt(2, beginRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery() ; 
			
			if ( rs.next() ) { 
				Employees bean = new Employees();

				bean.setBirth(rs.getString("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setGender(rs.getString("gender"));
				bean.setHp(rs.getString("hp"));
				bean.setName(rs.getString("name"));
				bean.setTid(rs.getString("tid"));
				bean.setSubmit(rs.getString("submit"));
				
				lists.add(bean);
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
		return lists  ; 
	}

	public int SubmitUpdate(String tid) {
		String sql = " update employees set submit = ? where tid = ?" ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = this.conn.prepareStatement(sql) ;	
			
			String upsub = "승인";
			pstmt.setString(1, upsub);
			pstmt.setString(2, tid);
			
			cnt = pstmt.executeUpdate();
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
		return cnt  ; 
	}

	public List<Employees> SelectList(int beginRow, int endRow, String mode, String keyword) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select ranking, tid, class_id, name, join_date, salary, image, birth, hp, address1, " ;
		sql += " address2, gender, responsibilities, password, subject_code, email, zipcode, remark from ( ";
		sql += " select tid, class_id, name, join_date, salary, image, birth, hp, address1, ";
		sql += " address2, gender, responsibilities, password, subject_code, email, zipcode, remark, rank() over(order by name asc) ";
		sql += " as ranking from employees where responsibilities = ? ";
		if(mode.equalsIgnoreCase("all") == false) {
			sql += " and " + mode + "like '%" + keyword + "%' " ;
		}
		sql += " ) where ranking between ? and ? ";
		
		List<Employees> lists = new ArrayList<Employees>();
		
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;	
			
			pstmt.setString(1, "직원");
			pstmt.setInt(2, beginRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery() ; 
			
			while ( rs.next() ) { 
				Employees bean = new Employees();
				
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
				bean.setResponsibilities(rs.getString("responsibilities"));
				bean.setClass_id(rs.getInt("class_id"));
				bean.setSalary(rs.getInt("salary"));
				bean.setJoin_date(rs.getString("join_date"));
				bean.setSubject_code(rs.getInt("subject_code"));
				bean.setRemark(rs.getString("remark"));
				bean.setZipcode(rs.getString("zipcode"));
				
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

	public Employees DetailData(String tid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from employees ";
		sql += " where tid = ? ";
		
		Employees bean = null;
		
		try {
			if(this.conn == null) {this.conn = this.getConnection();}
			pstmt = this.conn.prepareStatement(sql);
			
			pstmt.setString(1, tid);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new Employees();
				
				String str = rs.getString("birth");
				
				
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setBirth(str.substring(0, 10));
				bean.setEmail(rs.getString("email"));
				bean.setGender(rs.getString("gender"));
				bean.setHp(rs.getString("hp"));
				bean.setImage(rs.getString("image"));
				bean.setName(rs.getString("name"));
				bean.setPassword(rs.getString("password"));
				bean.setTid(rs.getString("tid"));
				bean.setResponsibilities(rs.getString("responsibilities"));
				bean.setClass_id(rs.getInt("class_id"));
				bean.setSalary(rs.getInt("salary"));
				bean.setJoin_date(rs.getString("join_date"));
				bean.setSubject_code(rs.getInt("subject_code"));
				bean.setRemark(rs.getString("remark"));
				bean.setZipcode(rs.getString("zipcode"));
				
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

	public int UpdateData(Employees bean) {
		String sql = " update employees set address = ?, address2 = ?, birth = ?, email = ?, " ;
		sql += " gender = ?, hp = ?, image = ?, name = ? password = ?, zipcode = ?, class_id = ?, ";
		sql += " subject_code = ?, salary = ? where tid = ? ";
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = this.conn.prepareStatement(sql) ;	

			pstmt.setString(1, bean.getAddress1());
			pstmt.setString(2, bean.getAddress2());
			pstmt.setString(3, bean.getBirth());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getGender());
			pstmt.setString(6, bean.getHp());
			pstmt.setString(7, bean.getImage());
			pstmt.setString(8, bean.getName());
			pstmt.setString(9, bean.getPassword());
			pstmt.setString(10, bean.getZipcode());
			pstmt.setInt(11, bean.getClass_id());
			pstmt.setInt(12, bean.getSubject_code());
			pstmt.setInt(13, bean.getSalary());
			
			
			cnt = pstmt.executeUpdate();
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
		return cnt  ; 
	}
}
