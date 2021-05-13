package kids.members.parents.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kids.common.model.SuperDao;
import kids.members.employees.model.Employees;

public class ParentsDao extends SuperDao {

	public int insertData(Parents bean) {
		int cnt = -99999;
		PreparedStatement pstmt = null ;
		String sql = "";
		
		if(bean.getChildid2() > 0) { 
			sql = "insert into parents "
					+ " (pid, name, hp, address1, address2, gender, password, birth, email, image, zipcode, sid, relationship, childid2, childid)"
					+ " values"
					+ " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		}else if(bean.getChildid() > 0) {
			sql = "insert into parents "
					+ " (pid, name, hp, address1, address2, gender, password, birth, email, image, zipcode, sid, relationship, childid)"
					+ " values"
					+ " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		}else {
			sql = "insert into parents "
					+ " (pid, name, hp, address1, address2, gender, password, birth, email, image, zipcode, sid, relationship)"
					+ " values"
					+ " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		}

		try {
			System.out.println("sql문 : "+sql);
			
			if(conn == null) {super.conn = super.getConnection() ; }
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getPid());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getHp());
			pstmt.setString(4, bean.getAddress1());
			pstmt.setString(5, bean.getAddress2());
			pstmt.setString(6, bean.getGender());
			pstmt.setString(7, bean.getPassword());
			pstmt.setString(8, bean.getBirth());
			pstmt.setString(9, bean.getEmail());
			pstmt.setString(10, bean.getImage());
			pstmt.setString(11, bean.getZipcode());
			pstmt.setInt(12, bean.getSid());
			pstmt.setString(13, bean.getRelationship());
			
			if(bean.getChildid2() > 0) {
				pstmt.setInt(14, bean.getChildid());
				pstmt.setInt(15, bean.getChildid2());
			}else if(bean.getChildid() > 0) {
				pstmt.setInt(14, bean.getChildid());
			}
			
			pstmt.executeUpdate() ; 
			conn.commit();
		} catch (Exception e) {	
			SQLException err = (SQLException)e;
			cnt = -err.getErrorCode();
			e.printStackTrace();
		}finally {
			try {
				conn.rollback();
				if(pstmt != null) {pstmt.close();} 
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public Parents selectDataByPk(String pid) {
		Parents bean = null;
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		String sql = "select * from parents where pid = ?";
		
		try {
			if(conn == null) {super.conn = super.getConnection() ; }
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, pid);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new Parents();
				bean.setPid(rs.getString("pid"));
				bean.setSid(rs.getInt("sid"));
				bean.setName(rs.getString("name"));
				bean.setHp(rs.getString("hp"));
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setGender(rs.getString("gender"));
				bean.setRelationship(rs.getString("relationship"));
				bean.setSubmit(rs.getString("submit"));
				bean.setBirth(String.valueOf(rs.getDate("birth")));
				bean.setPassword(rs.getString("password"));
				bean.setEmail(rs.getString("email"));
				bean.setImage(rs.getString("image"));
				bean.setChildid(rs.getInt("childid"));
				bean.setChildid2(rs.getInt("childid2"));
				bean.setRemark(rs.getString("remark"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setResponsibilities(rs.getString("responsibilities"));
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
		return bean;
	}

	public Parents selectData(String pid, String password) {
		Parents bean = null;
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		String sql = "select * from parents where pid = ? and password = ?";
		
		try {
			if(conn == null) {super.conn = super.getConnection() ; }
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, pid);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new Parents();
				bean.setPid(rs.getString("pid"));
				bean.setSid(rs.getInt("sid"));
				bean.setName(rs.getString("name"));
				bean.setHp(rs.getString("hp"));
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setGender(rs.getString("gender"));
				bean.setRelationship(rs.getString("relationship"));
				bean.setSubmit(rs.getString("submit"));
				bean.setBirth(String.valueOf(rs.getDate("birth")));
				bean.setPassword(rs.getString("password"));
				bean.setEmail(rs.getString("email"));
				bean.setImage(rs.getString("image"));
				bean.setChildid(rs.getInt("childid"));
				bean.setChildid2(rs.getInt("childid2"));
				bean.setRemark(rs.getString("remark"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setResponsibilities(rs.getString("responsibilities"));
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
		return bean;
	}

	public Parents searchId(String name, String birth, String email) {
		Parents bean = null;
		PreparedStatement pstmt = null ;
		ResultSet rs = null;
		String sql = "select * from parents where name = ? birth = ? email = ?";
		
		try {
			if(conn == null) {super.conn = super.getConnection() ; }
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new Parents();
				bean.setPid(rs.getString("pid"));
				bean.setSid(rs.getInt("sid"));
				bean.setName(rs.getString("name"));
				bean.setHp(rs.getString("hp"));
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setGender(rs.getString("gender"));
				bean.setRelationship(rs.getString("relationship"));
				bean.setSubmit(rs.getString("submit"));
				bean.setBirth(String.valueOf(rs.getDate("birth")));
				bean.setPassword(rs.getString("password"));
				bean.setEmail(rs.getString("email"));
				bean.setImage(rs.getString("image"));
				bean.setChildid(rs.getInt("childid"));
				bean.setChildid2(rs.getInt("childid2"));
				bean.setRemark(rs.getString("remark"));
				bean.setZipcode(rs.getString("zipcode"));
				bean.setResponsibilities(rs.getString("responsibilities"));
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
		return bean;
	}	
}
