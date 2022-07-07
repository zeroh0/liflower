package shop.master;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerDBBean {
	
	private static CustomerDBBean instance = new CustomerDBBean();
	   
    public static CustomerDBBean getInstance() {
    	return instance;
    }
   
    private CustomerDBBean() {}
   
    private Connection getConnection() throws Exception {
   	 Class.forName("com.mysql.jdbc.Driver");
     Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","multi2020");
     return conn;
    }

	 
	 //�쉶�썝�젙蹂대�� �닔�젙�븯湲� �쐞�빐 湲곗〈�쓽 �젙蹂대�� �몴�떆
     public CustomerDataBean getMember(String id) 
     throws Exception {
    	 Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         CustomerDataBean member=null;
         
         try {
        	 conn = getConnection();
           
             pstmt = conn.prepareStatement(
           	     "select * from member where id = ?");
             pstmt.setString(1, id);
             rs = pstmt.executeQuery();

             if (rs.next()) {
            	 member = new CustomerDataBean();
            	 
                 member.setId(rs.getString("id"));
                 member.setPasswd(rs.getString("passwd"));
				 member.setName(rs.getString("name"));
                 member.setTel(rs.getString("tel"));
                 member.setEmail(rs.getString("email"));
                 member.setAddress(rs.getString("address"));     
                 member.setPostcode(rs.getString("postcode"));
			 }
         }catch(Exception ex) {
             ex.printStackTrace();
         }finally {
             if (rs != null) 
            	 try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) 
            	 try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) 
            	 try { conn.close(); } catch(SQLException ex) {}
         }
		 return member;
     }
   
     public void updateMember(CustomerDataBean member) //�쉶�썝�쓽 �젙蹂댁닔�젙
     throws Exception {
    	 Connection conn = null;
         PreparedStatement pstmt = null;
       
         try {
        	 conn = getConnection();
           
             pstmt = conn.prepareStatement(
               "update member set passwd=?,name=?,tel=?,address=? "+
               "where id=?");
             pstmt.setString(1, member.getPasswd());
             pstmt.setString(2, member.getName());
             pstmt.setString(3, member.getTel());
             pstmt.setString(4, member.getAddress());
             pstmt.setString(5, member.getId());
           
             pstmt.executeUpdate();
         }catch(Exception ex) {
             ex.printStackTrace();
         }finally {
             if (pstmt != null) 
            	 try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) 
            	 try { conn.close(); } catch(SQLException ex) {}
         }
     }
   
     public int deleteMember(String id, String passwd) //�쉶�썝�깉�눜
     throws Exception {
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs= null;
         String dbpasswd="";
         int x=-1;
         
         try {
			 conn = getConnection();

             pstmt = conn.prepareStatement(
           	  "select passwd from member where id = ?");
             pstmt.setString(1, id);
             rs = pstmt.executeQuery();
           
			 if(rs.next()){
				 dbpasswd= rs.getString("passwd"); 
				 if(dbpasswd.equals(passwd)){
					 pstmt = conn.prepareStatement(
           	             "delete from member where id=?");
                     pstmt.setString(1, id);
                     pstmt.executeUpdate();
					 x= 1; //�쉶�썝�깉�눜 �꽦怨�
				 }else
					 x= 0; //鍮꾨�踰덊샇 ��由�
			 }
         }catch(Exception ex) {
             ex.printStackTrace();
         }finally {
             if (rs != null) 
            	 try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) 
            	 try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) 
            	 try { conn.close(); } catch(SQLException ex) {}
         }
		 return x;
     }

}