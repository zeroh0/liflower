package Notice.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import WEBPAGE.board.BoardBBean;
import WEBPAGE.board.BoardDataBean;

public class noticeDTO {
	
	private static noticeDTO instance = new noticeDTO();
    //.jsp�럹�씠吏��뿉�꽌 DB�뿰�룞鍮덉씤 BoardBBean�겢�옒�뒪�쓽 硫붿냼�뱶�뿉 �젒洹쇱떆 �븘�슂
    public static noticeDTO getInstance() {
        return instance;
    }
    
    private noticeDTO() {}
    
    //而ㅻ꽖�뀡��濡쒕��꽣 Connection媛앹껜瑜� �뼸�뼱�깂
    public static Connection getConnection() throws Exception{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb","root","multi2020");
    return con;
    }
    
    
    public void insertNotice(noticeDAO article) 
            throws Exception{
            Connection conn = null;
            PreparedStatement pstmt = null;
    		ResultSet rs = null;

    		
            String sql="";

            try {
                conn = getConnection();

                pstmt = conn.prepareStatement("select max(num) from notice");
    			rs = pstmt.executeQuery();
    			
    			
    			   
    		   
    		    
                // 荑쇰━瑜� �옉�꽦
                sql = "insert into notice(num,subject,content,reg_date,re_level,readCount) values(?,?,?,?,?,?)";

                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, article.getNum());
                pstmt.setString(2, article.getSubject());
                pstmt.setString(3, article.getContent());
                pstmt.setTimestamp(4, article.getReg_date());
                pstmt.setInt(5, 1);
                pstmt.setInt(6, 1);
                pstmt.executeUpdate();
            } catch(Exception ex) {
                ex.printStackTrace();
            } finally {
    			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
                if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
                if (conn != null) try { conn.close(); } catch(SQLException ex) {}
            }
        }

}
