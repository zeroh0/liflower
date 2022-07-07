package shop.master;

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

public class productDBBean {
	
    public static productDBBean instance 
                          = new productDBBean();
    
    public static productDBBean getInstance() {
        return instance;
    }
    
    private productDBBean() {}
    
    //  而ㅻ꽖�뀡��濡쒕��꽣 而ㅻ꽖�뀡媛앹껜瑜� �뼸�뼱�궡�뒗 硫붿냼�뱶
    public static Connection getConnection() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul"
        		+ "","root","multi2020");
        return conn;
        }
        
  
   
    
    //梨� �벑濡� 硫붿냼�뱶
    public void insertproduct(productDataBean pdr) 
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"insert into product values (?,?,?,?,?,?,?,?,?,?)");
            pstmt.setInt(1,pdr.getPDR_id());
            pstmt.setString(2, pdr.getCategory());
            pstmt.setString(3, pdr.getTitle());
            pstmt.setInt(4, pdr.getPrice());
            pstmt.setString(5, pdr.getManufacturer());
			pstmt.setString(6, pdr.getPublishing_date());
			pstmt.setString(7, pdr.getPDR_image());
			pstmt.setString(8, pdr.getContent());
			pstmt.setTimestamp(9, pdr.getReg_date());
			pstmt.setShort(10, pdr.getCount());
            pstmt.executeUpdate();
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
    }
        
	// �쟾泥대벑濡앸맂 梨낆쓽 �닔瑜� �뼸�뼱�궡�뒗 硫붿냼�뱶
	public int getProductCount()
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from product");
            rs = pstmt.executeQuery();

            if (rs.next()) 
               x= rs.getInt(1);
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
	
	// 遺꾨쪟蹂꾨삉�뒗 �쟾泥대벑濡앸맂 梨낆쓽 �젙蹂대�� �뼸�뼱�궡�뒗 硫붿냼�뱶
	public List<productDataBean> getProducts(String category)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<productDataBean> productList=null;
        
        try {
            conn = getConnection();
            
            String sql1 = "select * from product";
            String sql2 = "select * from product ";
            sql2 += "where category = ? order by reg_date desc";
            
            if(category.equals("all")){
            	 pstmt = conn.prepareStatement(sql1);
            }else{
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1, category);
            }
        	rs = pstmt.executeQuery();
            
            if (rs.next()) {
                productList = new ArrayList<productDataBean>();
                do{
                     productDataBean pdr= new productDataBean();
                     
                     pdr.setPDR_id(rs.getInt("PDR_id"));
                     pdr.setCategory(rs.getString("category"));
                     pdr.setTitle(rs.getString("title"));
                     pdr.setPrice(rs.getInt("price"));
                     pdr.setManufacturer(rs.getString("Manufacturer"));
                     pdr.setPublishing_date(rs.getString("publishing_date"));
                     pdr.setPDR_image(rs.getString("PDR_image"));
                     pdr.setReg_date(rs.getTimestamp("reg_date"));
                     pdr.setCount(rs.getShort("count"));
                     
                     pdr.setContent(rs.getString("content"));
                     
                     productList.add(pdr);
			    }while(rs.next());
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return productList;
    }
	
	// �눥�븨紐� 硫붿씤�뿉 �몴�떆�븯湲� �쐞�빐�꽌 �궗�슜�븯�뒗 遺꾨쪟蹂� �떊媛꾩콉紐⑸줉�쓣 �뼸�뼱�궡�뒗 硫붿냼�뱶
	public productDataBean[] getProducts(String category,int count)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        productDataBean bookList[]=null;
        int i=0;
        
        try {
            conn = getConnection();
            
            String sql = "select * from product where category = ? ";
            sql += "order by reg_date desc limit ?,?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, category);
            pstmt.setInt(2, 0);
            pstmt.setInt(3, count);
        	rs = pstmt.executeQuery();

            if (rs.next()) {
                bookList = new productDataBean[count];
                do{
                     productDataBean pdr= new productDataBean();
                     pdr.setPDR_id(rs.getInt("PDR_id"));
                     pdr.setCategory(rs.getString("category"));
                     pdr.setTitle(rs.getString("title"));
                     pdr.setPrice(rs.getInt("price"));
                     pdr.setManufacturer(rs.getString("Manufacturer"));
                     pdr.setPublishing_date(rs.getString("publishing_date"));
                     pdr.setPDR_image(rs.getString("PDR_image"));
                     pdr.setReg_date(rs.getTimestamp("reg_date"));
                     pdr.setCount(rs.getShort("count"));
                     
                     pdr.setContent(rs.getString("content"));
                     
                     
                     bookList[i]=pdr;
                     
                     i++;
			    }while(rs.next());
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return bookList;
    }
	
	// PDRId�뿉 �빐�떦�븯�뒗 梨낆쓽 �젙蹂대�� �뼸�뼱�궡�뒗 硫붿냼�뱶濡� 
    //�벑濡앸맂 梨낆쓣 �닔�젙�븯湲� �쐞�빐 �닔�젙�뤌�쑝濡� �씫�뼱�뱾湲곗씠湲� �쐞�븳 硫붿냼�뱶
	public productDataBean getProduct(int PDR_id)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        productDataBean pdr=null;
        
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select * from product where PDR_id = ?");
            pstmt.setInt(1, PDR_id);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                pdr = new productDataBean();
                
                
                pdr.setPDR_id(rs.getInt("PDR_id"));
                pdr.setCategory(rs.getString("category"));
                pdr.setTitle(rs.getString("title"));
                pdr.setPrice(rs.getInt("price"));
                pdr.setManufacturer(rs.getString("Manufacturer"));
                pdr.setPublishing_date(rs.getString("publishing_date"));
                pdr.setPDR_image(rs.getString("PDR_image"));
                pdr.setReg_date(rs.getTimestamp("reg_date"));
                pdr.setCount(rs.getShort("count"));
                pdr.setContent(rs.getString("content"));
                
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return pdr;
    }
    
    // �벑濡앸맂 梨낆쓽 �젙蹂대�� �닔�젙�떆 �궗�슜�븯�뒗 硫붿냼�뱶
    public void updateproduct(productDataBean pdr, int PDR_id)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql;
        
        try {
            conn = getConnection();
            
            sql = "update product set category=?, title=?,price=?";
            sql += ",manufacturer=?,publishing_date=?";
            sql += ",PDR_image=?,content=?,count=?";
            sql += " where PDR_id=?";
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, pdr.getCategory());
            pstmt.setString(2, pdr.getTitle());
            pstmt.setInt(3, pdr.getPrice());
            pstmt.setString(4, pdr.getManufacturer());
			pstmt.setString(5, pdr.getPublishing_date());
			pstmt.setString(6, pdr.getPDR_image());
			pstmt.setString(7, pdr.getContent());
			pstmt.setShort(8, pdr.getCount());
			pstmt.setInt(9, pdr.getPDR_id());
            
            pstmt.executeUpdate();
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    // bookId�뿉 �빐�떦�븯�뒗 梨낆쓽 �젙蹂대�� �궘�젣�떆 �궗�슜�븯�뒗 硫붿냼�뱶
    public void deleteProduct(int PDR_id)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        
        try {
			conn = getConnection();

            pstmt = conn.prepareStatement(
            	"delete from product where PDR_id=?");
            pstmt.setInt(1, PDR_id);
            
            pstmt.executeUpdate();
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) 
            	try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
    }
}