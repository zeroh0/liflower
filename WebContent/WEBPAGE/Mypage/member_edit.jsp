<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%String userid = (String)session.getAttribute("id");%>  
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="../_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../_css/member-edit.css?after">
	<style>
        .tabs {
            font-family: 'Noto Sans KR';
            width: 1200px;
            font-size: 0;
            text-align: center;
        }
        input[type="radio"] {display:none;} /* input을 안보이게 처리 */
        input[type="radio"] + label {border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; width: 400px; height: 55px; display:inline-block;background:#f5f5f5;color:#222;font-size:14px;cursor:pointer;;line-height: 55px;font-size: 17px; font-weight: 500;} /* 버튼 공통 속성 */
        input[type="radio"]:checked + label {background:#3f4441;color:#fff;} /* 선택된 버튼속성 */
        .conbox {margin-top: 40px; font-size: 16px; width:1200px; display:none;text-align:left;box-sizing:border-box;} /* 컨텐츠박스 공통 속성 */
        input[id="tab01"]:checked ~ .con1 {display:block;} /* 인풋에 체크가 해당 요소보이게 설정 */
        input[id="tab02"]:checked ~ .con2 {display:block;}
        input[id="tab03"]:checked ~ .con3 {display:block;}
    </style>  
    
    <script>
    	function delcheck() {
    		document.delform.submit();
    	}
    	
    	function chgpasscheck() {
    		document.chgpassform.submit();
    	}
    	
    	function modifycheck() {
    		document.modifyform.submit();
    	}
    </script>
</head>
	
<body>
    <!-- 헤더 -->
	<div class="wrap_1200">	
		<jsp:include page="../header_1.jsp"/>
	</div>

	<!-- 서브비주얼 -->
	<div class="wrap_1920">
		<div class="subVisual">
			<div class="subVisual_wrap">
				<div class="sub_txt">
					<div class="sub_title">회원정보수정</div>
					<div class="sub_exp">Member_Edit</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상품 목록 -->
	<div class="wrap_1200">
        
		<% 
		String id = (String)session.getAttribute("id");
		String name="";
		String email="";
		String tel="";
		String address="";
		
		Connection con =null;
		Statement stmt = null; 
		
		String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8";
		String dbid = "root";
		String dbpwd = "multi2020";
		
		Class.forName("com.mysql.jdbc.Driver");
		con= DriverManager.getConnection(dburl,dbid,dbpwd); 
		
		String query="select name,email,tel,address from member where id = '"+id+"'";
		PreparedStatement pstmt = con.prepareStatement(query);
		
		
		ResultSet result = pstmt.executeQuery();
		if(result.next()){
			name = result.getString("name");
			email = result.getString("email");
			tel = result.getString("tel");
			address = result.getString("address");
		}
		result.close();
		pstmt.close();
		%>

        <div class="tabs">
            <input type="radio" id="tab01" name="tabmenu" checked>
            <label for="tab01" class="tab tab01" onclick="tab01();">
                회원정보수정
            </label>
            <input type="radio" id="tab02" name="tabmenu">
            <label for="tab02" class="tab tab02" onclick="tab02();">
                비밀번호 변경
            </label>
            <input type="radio" id="tab03" name="tabmenu"> 
            <label for="tab03" class="tab tab03" onclick="tab03();">
                회원탈퇴
            </label>
            <span class="border"></span>
            <!--<span class="background"></span>-->
            
            <div class="conbox con1">
                <div class="update_memeber">
                    <div class="edit_field">
                        <div class="edit_title">회원정보수정</div>
                        <div class="line"></div>
                        <div class="update_field">
                        <form action="modifyReg.jsp" method="post" name="modifyform">
                            <table class="update">
                                <tr>
                                    <td>이름</td>
                                    <td><input type="text" value="<%= name %>" name="name"></td>
                                </tr>
                                <tr class="space"></tr>
                                <tr>
                                    <td>이메일</td>
                                    <td class="input_email">
                                        <input type="text" name="email" value="<%= email %>"> 
                                    </td>
                                </tr>
                                <tr class="space"></tr>
                                <tr>
                                    <td>휴대폰 번호</td>
                                    <td class="input_tel">
                                        <input type="text" name="tel" value="<%=tel %>" onKeyup="inputPhoneNumber(this);">
                                    </td>
                                </tr>
                                <tr class="space"></tr>
                                <tr>
                                    <td>주소</td>
                                    <td class="input_address">
                                        <input type="text" name="address" value="<%= address%>">
                                    </td>
                                </tr>
                                
                                <tr class="space"></tr>
                            </table>
							</form>
                            <div class="edit_btn">
                                <div class="cancel"><a><img src="../_img/register-reset.png"></a></div>
                                <div class="check"><a onClick="modifycheck()"><img src="../_img/register-check.png"></a></div>
                            </div>
                        </div>                  
                    </div>
                </div>
            </div>
            <div class="conbox con2">
                <div class="update_memeber">
                    <div class="edit_field">
                    <div class="edit_title">비밀번호 변경</div>
                    <div class="line"></div>
                    <div class="update_field">
						<form action ="modifypasswordpro.jsp" method="post" name="chgpassform">
                        <table class="passwd_chg">
                            <tr>
                                <td>기존 비밀번호</td>
                                <td><input type="password" name="pass" placeholder="기존 비밀번호"></td>
                            </tr>
                            <tr class="space"></tr>
                            <tr>
                                <td>새로운 비밀번호</td>
                                <td><input type="password" name="chgpass1" placeholder="새로운 비밀번호"></td>
                            </tr>
                            <tr class="space"></tr>
                            <tr>
                                <td>새로운 비밀번호 확인</td>
                                <td><input type="password" name="chgpass2" placeholder="새로운 비밀번호 확인"></td>
                            </tr>
                            <tr class="space"></tr>
                        </table>
						</form>

                        <div class="edit_btn">
                            <div class="cancel"><a><img src="../_img/register-reset.png"></a></div>
                            <div class="check"><a onClick="chgpasscheck()"><img src="../_img/register-check.png"></a></div>
                        </div>
                    </div>                  
                    </div>
                </div>
            </div>
            <div class="conbox con3">
                <div class="update_memeber">
                <div class="edit_field">
                <div class="edit_title">회원 탈퇴</div>
                <div class="line"></div>
                <div class="update_field">
                    <form action ="delete.jsp" method="post" name="delform">
                    <table class="del_member">
                        <tr>
                            <td>비밀번호</td>
                            <td><input type="password" name="delpw" placeholder="비밀번호 입력"></td>
                        </tr>
                        <tr class="separation"></tr>
                        <tr>
                            <td></td>
                            <td>
                                * 회원 탈퇴는 요청 즉시 탈퇴합니다.<br>
                                * 전자상거래 등에서의 소비자보호에 관한 법률 제 6조 (거래 기록 보존 등)에 의거, 주문 정보는 5년간<br>
                                 데이터로만 보관하며 (다른용도 절대 사용불가(이후 파기되오니 이점 유의해 주시기 바랍니다.
                            </td>
                        </tr>
                        <tr class="space"></tr>
                    </table>
					</form>
                    <div class="edit_btn">
                        <div class="cancel"><a><img src="../_img/register-reset.png"></a></div>
                        <div class="check"><a onClick="delcheck()"><img src="../_img/register-check.png"></a></div>
                    </div>
                </div>                  
                </div>
            </div>
            </div>
            
        </div>
        
		<!-- 푸터 -->
		<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>
