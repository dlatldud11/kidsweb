package kids.members.student.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kids.common.model.SuperDao2;




public class StudentDao extends SuperDao2{

	public int insertData(Student bean) {
		String sql = "insert into student (sid, name, hp, birth, address1, address2, gender, textarea, image)"
				+ " values( sid_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)" ;
		
		PreparedStatement pstmt = null ;
		int cnt = -99999 ;
		try {
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getHp());
			pstmt.setString(3, bean.getBirth());
			pstmt.setString(4, bean.getAddress1());
			pstmt.setString(5, bean.getAddress2());
			pstmt.setString(6, bean.getGender());
			pstmt.setString(7, bean.getTextarea());
			pstmt.setString(8, bean.getImage());
		
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

	@SuppressWarnings("resource")
	public int DeleteData( int sid) {
		String sql ;		
		PreparedStatement pstmt = null ;		
		Student bean = null ;
		int cnt = -99999 ;
		try {
			bean = this.SelectDataByPk(sid) ;
			
			if( conn == null ){ super.conn = super.getConnection() ; }
			conn.setAutoCommit( false );	
		
			sql = " update parents set remark = ?  " ;
			sql += " where sid = ? " ;
			pstmt = super.conn.prepareStatement(sql) ;
			
			String imsi = bean.getName() +  "(" + sid + ")가 회원 탈퇴를 하였습니다." ;
			pstmt.setString(1, imsi);			
			pstmt.setInt(2, sid);
			
			cnt = pstmt.executeUpdate() ;
			if(pstmt != null) {pstmt.close();}
		
			sql = " update stu_fee set remark = ? " ;
			sql += " where sid = ? " ;
			pstmt = super.conn.prepareStatement(sql) ;
			
			pstmt.setString(1, imsi);			
			pstmt.setInt(2, sid);
			
			cnt = pstmt.executeUpdate() ;
			if(pstmt != null) {pstmt.close();}
			
			sql = " delete from students " ;
			sql += " where sid = ? " ;
			pstmt = super.conn.prepareStatement(sql) ;
			pstmt.setInt(2, sid);			
			cnt = pstmt.executeUpdate() ;
			if(pstmt != null) {pstmt.close();}
			
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
	

	public int SelectTotalCount(String mode, String keyword) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;				

		String sql = " select count(*) as cnt from student " ;
		if(mode.equalsIgnoreCase("all") ==false) { 
			System.out.println("not all search mode");
			sql += " where " + mode + " like '%" + keyword + "%' " ;	
		}
		
		int cnt = 0 ; 
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;			 
			rs = pstmt.executeQuery() ; 
			
			if (rs.next()) {
				cnt = rs.getInt("cnt") ;
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


	public List<Student> SelectDataList(int beginRow, int endRow, String mode, String keyword) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " " ;
		sql += " " ;
		sql += " " ; 

		List<Student> lists = new ArrayList<Student>() ;
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow); 
			
			rs = pstmt.executeQuery() ; 
			while ( rs.next() ) {
				Student bean = new Student() ; 
			 		
				lists.add( bean ) ; 
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

	public Student SelectDataByPk(int no) {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;	
		
		String sql = " select * from students " ;
		sql += " where no = ? " ;
		
		Student bean = null ;
		try {
			if( this.conn == null ){ this.conn = this.getConnection() ; }			
			pstmt = this.conn.prepareStatement(sql) ;			
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery() ; 
			
			if ( rs.next() ) { 
				bean = new Student() ;
				
				bean.setName(rs.getString("name"));
				bean.setHp(rs.getString("hp"));
				bean.setBirth(rs.getString("birth"));
				bean.setGender(rs.getString("gender"));
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setRegdate(String.valueOf(rs.getDate("regdate")));
				bean.setTextarea(rs.getString("textarea"));
				bean.setImage(rs.getString("image"));
				bean.setZipcode(rs.getString("zipcode"));

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