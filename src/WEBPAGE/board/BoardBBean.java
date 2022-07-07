package WEBPAGE.board;

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




public class BoardBBean {

     private static BoardBBean instance = new BoardBBean();
    //.jsp�럹�씠吏��뿉�꽌 DB�뿰�룞鍮덉씤 BoardBBean�겢�옒�뒪�쓽 硫붿냼�뱶�뿉 �젒洹쇱떆 �븘�슂
    public static BoardBBean getInstance() {
        return instance;
    }
    
    private BoardBBean() {}
    
    //而ㅻ꽖�뀡��濡쒕��꽣 Connection媛앹껜瑜� �뼸�뼱�깂
  
    // 湲곗궗 �궗�엯 �댋
    //board�뀒�씠釉붿뿉 湲��쓣 異붽�(inset臾�)<=writePro.jsp�럹�씠吏��뿉�꽌 �궗�슜
    public void insertArticle(BoardDataBean article) 
        throws Exception     {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
        String sql="";

        try {
        	   
        	    String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
        	    String dbid = "root";
        	    String dbpwd = "multi2020";
        	    Class.forName("com.mysql.jdbc.Driver");
        	    conn =DriverManager.getConnection(dburl,dbid,dbpwd);
        	

            pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			
			if (rs.next())
		      number=rs.getInt(1)+1;
		    else
		      number=1; 
		   
		    if (num!=0) {  
		      sql="update board set re_step=re_step+1 ";
		      sql += "where ref= ? and re_step> ?";
              pstmt = conn.prepareStatement(sql);
              pstmt.setInt(1, ref);
			  pstmt.setInt(2, re_step);
			  pstmt.executeUpdate();
			  re_step=re_step+1;
			  re_level=re_level+1;
		     }else{
		  	  ref=number;
			  re_step=0;
			  re_level=0;
		     }	 
            // 荑쇰━瑜� �옉�꽦
            sql = "insert into board (writer,email,subject,passwd,reg_date,";
		    sql+="ref,re_step,re_level,content,ip) values(?,?,?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, article.getWriter());
            pstmt.setString(2, article.getEmail());
            pstmt.setString(3, article.getSubject());
            pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
            pstmt.setInt(6, ref);
            pstmt.setInt(7, re_step);
            pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    //board�뀒�씠釉붿뿉 ���옣�맂 �쟾泥닿��쓽 �닔瑜� �뼸�뼱�깂(select臾�)<=list.jsp�뿉�꽌 �궗�슜
	public int getArticleCount()
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            
        	String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8";
     	    String dbid = "root";
     	    String dbpwd = "multi2020";
     	    Class.forName("com.mysql.jdbc.Driver");
     	    conn =DriverManager.getConnection(dburl,dbid,dbpwd);
     	
            
            pstmt = conn.prepareStatement("select count(*) from board");
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }

	//湲��쓽 紐⑸줉(蹂듭닔媛쒖쓽 湲�)�쓣 媛��졇�샂(select臾�) <=list.jsp�뿉�꽌 �궗�슜
	public List<BoardDataBean> getArticles(int start, int end)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardDataBean> articleList=null;
        try {
        	String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
     	    String dbid = "root";
     	    String dbpwd = "multi2020";
     	    Class.forName("com.mysql.jdbc.Driver");
     	    conn =DriverManager.getConnection(dburl,dbid,dbpwd);
     	
            
            pstmt = conn.prepareStatement(
            	"select * from board order by ref desc, re_step asc limit ?,? ");
            pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<BoardDataBean>(end);
                do{
                  BoardDataBean article= new BoardDataBean();
				  article.setNum(rs.getInt("num"));
				  article.setWriter(rs.getString("writer"));
                  article.setEmail(rs.getString("email"));
                  article.setSubject(rs.getString("subject"));
                  article.setPasswd(rs.getString("passwd"));
			      article.setReg_date(rs.getTimestamp("reg_date"));
				  article.setReadcount(rs.getInt("readcount"));
                  article.setRef(rs.getInt("ref"));
                  article.setRe_step(rs.getInt("re_step"));
				  article.setRe_level(rs.getInt("re_level"));
                  article.setContent(rs.getString("content"));
			      article.setIp(rs.getString("ip")); 
				  
                  articleList.add(article);
			    }while(rs.next());
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return articleList;
    }
 
	//湲��쓽 �궡�슜�쓣 蹂닿린(1媛쒖쓽 湲�)(select臾�)<=content.jsp�럹�씠吏��뿉�꽌 �궗�슜
	public BoardDataBean getArticle(int num)
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
        	String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
     	    String dbid = "root";
     	    String dbpwd = "multi2020";
     	    Class.forName("com.mysql.jdbc.Driver");
     	    conn =DriverManager.getConnection(dburl,dbid,dbpwd);
     	
            pstmt = conn.prepareStatement(
            	"update board set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

            pstmt = conn.prepareStatement(
            	"select * from board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article = new BoardDataBean();
                article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
                article.setEmail(rs.getString("email"));
                article.setSubject(rs.getString("subject"));
                article.setPasswd(rs.getString("passwd"));
			    article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
			    article.setIp(rs.getString("ip"));     
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return article;
    }
    
	//湲� �닔�젙�뤌�뿉�꽌 �궗�슜�븷 湲��쓽 �궡�슜(1媛쒖쓽 湲�)(select臾�)<=updateForm.jsp�뿉�꽌 �궗�슜
    public BoardDataBean updateGetArticle(int num)
          throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
         	String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
     	    String dbid = "root";
     	    String dbpwd = "multi2020";
     	    Class.forName("com.mysql.jdbc.Driver");
     	    conn =DriverManager.getConnection(dburl,dbid,dbpwd);

            pstmt = conn.prepareStatement(
            	"select * from board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article = new BoardDataBean();
                article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
                article.setEmail(rs.getString("email"));
                article.setSubject(rs.getString("subject"));
                article.setPasswd(rs.getString("passwd"));
			    article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
			    article.setIp(rs.getString("ip"));     
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return article;
    }

    //湲� �닔�젙泥섎━�뿉�꽌 �궗�슜(update臾�)<=updatePro.jsp�뿉�꽌 �궗�슜
    public int updateArticle(BoardDataBean article)
          throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String dbpasswd="";
        String sql="";
		int x=-1;
        try {
         	String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
     	    String dbid = "root";
     	    String dbpwd = "multi2020";
     	    Class.forName("com.mysql.jdbc.Driver");
     	    conn =DriverManager.getConnection(dburl,dbid,dbpwd);
            
			pstmt = conn.prepareStatement(
            	"select passwd from board where num = ?");
            pstmt.setInt(1, article.getNum());
            rs = pstmt.executeQuery();
            
			if(rs.next()){
			  dbpasswd= rs.getString("passwd"); 
			  if(dbpasswd.equals(article.getPasswd())){
                sql="update board set writer=?,email=?,subject=?,passwd=?";
			    sql+=",content=? where num=?";
                pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, article.getWriter());
                pstmt.setString(2, article.getEmail());
                pstmt.setString(3, article.getSubject());
                pstmt.setString(4, article.getPasswd());
                pstmt.setString(5, article.getContent());
			    pstmt.setInt(6, article.getNum());
                pstmt.executeUpdate();
				x= 1;
			  }else{
				x= 0;
			  }
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
    
    //湲��궘�젣泥섎━�떆 �궗�슜(delete臾�)<=deletePro.jsp�럹�씠吏��뿉�꽌 �궗�슜
    public int deleteArticle(int num, String passwd)
        throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        try {
         	String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
     	    String dbid = "root";
     	    String dbpwd = "multi2020";
     	    Class.forName("com.mysql.jdbc.Driver");
     	    conn =DriverManager.getConnection(dburl,dbid,dbpwd);

            pstmt = conn.prepareStatement(
            	"select passwd from board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement(
            	      "delete from board where num=?");
                    pstmt.setInt(1, num);
                    pstmt.executeUpdate();
					x= 1; //湲��궘�젣 �꽦怨�
				}else
					x= 0; //鍮꾨�踰덊샇 ��由�
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
	    
}
