<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.master.productDBBean" %>
<% request.setCharacterEncoding("utf-8");%>
<%
      String pdr_id = request.getParameter("PDR_id");
if (pdr_id == null) {
	pdr_id = "0";
}
       int PDR_id = Integer.parseInt(pdr_id);
       String category = request.getParameter("category");
       
       //int PDR_id = Integer.parseInt(request.getParameter("PDR_id"));
       //String category = request.getParameter("category");
      
       productDBBean productProcess = productDBBean.getInstance();
       productProcess.deleteProduct(PDR_id); 

       response.sendRedirect("productList.jsp?category="+category);
%>

<!-- 
<html>
<head>
<title>책삭제</title>

</head>
<body>
<p>책삭제</p>
<br>
<form method="POST" name="delForm"  
   action="productDeletePro.jsp?PDR_id=<%= PDR_id%>&category=<%=category%>" 
   onsubmit="return deleteSave()"> 
 <table>
 <tr>
     <td align="right" >
	    <a href="../admin.jsp"> 관리자 메인으로</a> &nbsp;
	    <a href="productList.jsp?category=<%=category%>">목록으로</a>
     </td>
  </tr>
  
 <tr height="30">
    <td align=center>
      <input type="submit" value="삭제" >  
   </td>
 </tr>  
</table> 
</form>
</body>
</html>
 -->