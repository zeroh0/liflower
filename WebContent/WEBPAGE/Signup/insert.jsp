 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<% request.setCharacterEncoding("UTF-8");%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 button{cursor:pointer}  
</style>
</head>
<body>
<%
	 //입력창 회원 정보를 서버로 읽어오기 
     String id = request.getParameter("id");
     String passwd = request.getParameter("pass1");
     String name = request.getParameter("name");   
     String email = request.getParameter("email1")+"@"+request.getParameter("email2");
     String hp    = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
     String address  = request.getParameter("address1") + " " + request.getParameter("address2");
     int manager = 1;
     String postcode = request.getParameter("postcode");
     Connection conn = null; //Connection 객체 생성
     Statement stmt = null; //Statement 객체 생성
     String sql = null;  
  
    /* name필드 한글이 깨짐, table 삭제 후 재생성 --> create table reg_2019 convert to charset euckr 실행하면 
       charset=litin이 charset=euckr로 바뀜. 테이블에 레코드 삽입(insert)하면  삽입이 이루어지지 않는다. 데이터베이스 url을
       두 번째 방벙으로 변경 삽입됨 
    */ 
    //String dburl = "jdbc:mysql://localhost:3306/webdb";
  
  
  Class.forName("com.mysql.jdbc.Driver"); //드라이버 로드
  String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
  String dbid = "root";
  String dbpwd = "multi2020";
  conn = DriverManager.getConnection(dburl,dbid,dbpwd);
  stmt = conn.createStatement();    //Connection 객체의 createStatement()메소드로 Statement 객체 생성
  sql = "insert into member(id, passwd, name, email , tel , address , postcode, manager) values('" + id + "', '" + passwd + "', '" + name + "','"+email+"', '" +hp+ "', '" +address+ "','"+postcode+"', '"+manager+"' )";
  stmt.executeUpdate(sql); //Stetement 객체의 executeUpdate() 메소드로 sql 처리 
  
  session.setAttribute("id",id); //객체변수 id에 변수(id)값 저장 --> 전역변수
  session.setAttribute("name",name); //객체변수 pwd에 변수(pwd)값 저장 --> 전역변수
  session.setAttribute("email",email);
  session.setAttribute("tel",hp);
  
  stmt.close(); //Statement 객체 해제  
  conn.close(); //Connection 객체 해제 

  //out.println("member 테이블에 레코드가 삽입되었습니다.");
  %>
  <script>
  alert("회원 가입되엇습니다");
  location.href="signup3.jsp";
</script>
</body>
</html>