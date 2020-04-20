<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.notice.model.vo.Notice" %>
<%
   Notice n = (Notice)request.getAttribute("n");
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
   /* .outer>table{
      width:100%;
      height:100%;
   }
   .outer>table tr>*{
      border:0.5px solid black;
      height:50px;
   }
   .outer>table p{
      height:300px;
   }
   .content>td{
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
   font-size:25px;
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
</style>
</head>
<body>
   <%@ include file="../common/adminMenubar.jsp" %>
   <div class="outer">
      <table style="border-collapse:collapse;width:1000px;height: 800px;font-family:sans-serif;">
         <tr>
            <th width="10%" height="50px;">번호</th>
            <th width="40%">구분</th>
            <th width="40%">작성 날짜</th>
            <th width="10%">조회수</th>
         </tr>
         <tr class="content">
            <td height="50px;"><%=n.getNoticeNo() %></td>
            <td><%=n.getNoticeType() %></td>
            <td><%=n.getNoticeDate() %></td>
            <td><%=n.getReference() %></td>
         </tr>
         <tr>
            <th height="50px;">제목</th>
            <td colspan="3"><%=n.getNoticeTitle() %></td>
         </tr>
         <tr>
            <th>내용</th>
            <td colspan="4">
               <p><%=n.getNoticeContent() %></p>
            </td>
         </tr>
      </table>
      
      <div class="btns" style="margin-left:900px;">
         <button id="delete" type="button">삭제</button>
         <button type="button" onclick="history.back(-1);">뒤로가기</button>
      </div>
   </div>
   
   <script>
      $(document).ready(function(){
         $('#delete').click(function(){
            var result = confirm("삭제 하시겠습니까?");
            
            if(result){
               alert("삭제가 완료되었습니다.");
               location.replace("adminList.no");
               location.href='<%= request.getContextPath()%>/adminDelete.no?noticeNo=<%=n.getNoticeNo()%>';
            }else{
            
            }
         })
      })
   </script>
</body>
</html>