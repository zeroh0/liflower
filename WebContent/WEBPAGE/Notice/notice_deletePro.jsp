<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "WEBPAGE.board.BoardBBean" %>
<%@ page import = "WEBPAGE.board.BoardDataBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");

  BoardBBean dbPro = BoardBBean.getInstance(); 
  int check = dbPro.deleteArticle(num, passwd);

  if(check==1){
%>
	<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
	<script type="text/javascript">      
         alert("삭제되었습니다.");
        location.href="list.jsp"
   </script>
<%}else{%>
    <script type="text/javascript">      
         
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
      	
   </script>
<%} %>