<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.lostarticle.model.vo.Lostarticle" %>
<%
   Lostarticle l = (Lostarticle)request.getAttribute("l");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer{
      width:75%;
      height:100%;
      float:left;
      margin:auto;
      margin-top:30px;
      margin-left:5%;
   }
   /* .outer>table tr>*{
      border:4px solid gray;
      height:50px;
   }
   .outer>table{
      width:100%;
      height:100%;
   }
   .outer>table p{
      height:300px;
   }
   .content{
      text-align:center;
   } */
   table a:link {
   color: #666;
   font-weight: bold;
   text-decoration:none;
}
table a:visited {
   color: #999999;
   font-weight:bold;
   text-decoration:none;
}
table a:active,
table a:hover {
   color: #bd5a35;
   text-decoration:underline;
}
table {
   font-family:Arial, Helvetica, sans-serif;
   color:#666;
   font-size:12px;
   text-shadow: 1px 1px 0px #fff;
   background:#eaebec;
   margin:20px;
   border:#ccc 1px solid;

   -moz-border-radius:3px;
   -webkit-border-radius:3px;
   border-radius:3px;

   -moz-box-shadow: 0 1px 2px #d1d1d1;
   -webkit-box-shadow: 0 1px 2px #d1d1d1;
   box-shadow: 0 1px 2px #d1d1d1;
}
table th {
   padding:21px 25px 22px 25px;
   border-top:1px solid #fafafa;
   border-bottom:1px solid #e0e0e0;

   background: #ededed;
   background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
   background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table th:first-child {
   
   padding-left:20px;
}
table tr:first-child th:first-child {
   -moz-border-radius-topleft:3px;
   -webkit-border-top-left-radius:3px;
   border-top-left-radius:3px;
}
table tr:first-child th:last-child {
   -moz-border-radius-topright:3px;
   -webkit-border-top-right-radius:3px;
   border-top-right-radius:3px;
}
table tr {
   text-align: center;
   padding-left:20px;
}
table td:first-child {

   padding-left:20px;
   border-left: 0;
}
table td {
   padding:18px;
   border-top: 1px solid #ffffff;
   border-bottom:1px solid #e0e0e0;
   border-left: 1px solid #e0e0e0;
   font-size:15px;

   background: #fafafa;
   background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
   background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table tr.even td {
   background: #f6f6f6;
   background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
   background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
table tr:last-child td {
   border-bottom:0;
}
table tr:last-child td:first-child {
   -moz-border-radius-bottomleft:3px;
   -webkit-border-bottom-left-radius:3px;
   border-bottom-left-radius:3px;
}
table tr:last-child td:last-child {
   -moz-border-radius-bottomright:3px;
   -webkit-border-bottom-right-radius:3px;
   border-bottom-right-radius:3px;
}
   #modal {
     display:none;
     position:relative;
     width:100%;
     height:100%;
     z-index:1;
   }
   
   #modal h2 {
     margin:0;   
   }
   
   #modal button {
     display:inline-block;
     width:100px;
     float:right;
   }
   
   #modal .modal_content {
     width:300px;
     margin:100px auto;
     padding:20px 10px;
     background:#fff;
     border:2px solid #666;
   }
   
   #modal .modal_layer {
     position:fixed;
     top:0;
     left:0;
     width:100%;
     height:100%;
     background:rgba(0, 0, 0, 0.5);
     z-index:-1;
   }   
</style>
</head>
<body>
   <%@ include file="../common/adminMenubar.jsp" %>
   <div class="outer">
      <table style="border-collapse:collapse;width:1000px;height: 800px;font-family:sans-serif;">
         <tr>
            <th width="20%" height="50px;" style="font-size:25px;">번호</th>
            <th width="40%" style="font-size:25px">지점</th>
            <th width="40%" style="font-size:25px">작성일</th>
         </tr>
         <tr class="content">
            <td height="50px;"><%=l.getLostNo() %></td>
            <td><%=l.getPlace() %></td>
            <td><%=l.getLostDate() %></td>
         </tr>
         <tr>
            <th height="50px;" style="font-size:25px">작성자</th>
            <th style="font-size:25px">전화번호</th>
            <th style="font-size:25px">이메일</th>
         </tr>
         <tr class="content">
            <td height="50px;"><%=l.getName() %></td>
            <td>0<%=l.getPhone() %></td>
            <td><%=l.getEmail() %></td>
         </tr>
         <tr>
            <th height="50px;" style="font-size:25px">제목</th>
            <td colspan="2"><%=l.getTitle() %></td>
         </tr>
         <tr>
            <td colspan="3">
               <textarea style="resize:none;font-size:15px;border:none;width:950px;height:300px;" readonly><%=l.getContent() %></textarea>
            </td>
         </tr>
      </table>
      
      <div class="btns" style="margin-left:900px;">
         <%if(l.getReplyStatus().equals("N")) {%>
         <button type="button" id="reply" style="border-radius:5px;">답변하기</button>
         <%}else{ %>
         <button type="button" id="reply" style="border-radius:5px;">답변보기</button>
         <%} %>
         <button type="button" onclick="history.back(-1);" style="border-radius:5px;">뒤로가기</button>
      </div>
      
      <form action="<%=request.getContextPath()%>/reply.lo" method="POST">
         <div id="modal">
      
             <div class="modal_content" style="margin-top: -50%; width: 824px; height: 444px;">
                <%if(l.getReplyStatus().equals("N")) {%>
                    <h2>답변하기</h2>
                       <textarea name="replyContent" style="margin: 0px; width: 787px; height: 343px; resize:none;" placeholder="답변을 입력해주세요." id="replyAnswer"></textarea>
                       <input type="hidden" name="lostNo" value="<%=l.getLostNo() %>">
                       <button type="button" id="modal_close_btn">취소</button>
                       
                      <button type="submit" id="replyContent" style="margin-right: 10px;">답변등록</button>
                   <%}else{ %>
                      <h2>답변보기</h2>
                   
                    <textarea style="margin: 0px; width: 787px; height: 343px; resize:none;" readonly><%=l.getReplyContent()%></textarea>
                   
                    <button type="button" id="modal_close_btn">확인</button>
                   <%} %>
             </div>
            
             <div class="modal_layer"></div>
         </div>
      </form>
   </div>
   
   <script>
       document.getElementById("reply").onclick = function() {
           document.getElementById("modal").style.display="block";
       }
      
       document.getElementById("modal_close_btn").onclick = function() {
           document.getElementById("modal").style.display="none";
       }
   </script>
</body>
</html>