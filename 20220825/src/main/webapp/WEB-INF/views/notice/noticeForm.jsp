<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.btn {
  border: none;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  background: #fff;
  padding: 0.5em;
  padding-left: 1em;
  padding-right: 1em;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

body {
  padding:5em;
  width:800px;
  position: absolute;
  top: 40%;
  left: 50%;
  transform: translate(-50%, -50%);
  
  background: #f5f5f5
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
  
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  
  }
</style>


</head>
<body>
	<div align="center">
		<div><h1>공지사항 등록</h1></div>
		<div>
			 <form id="frm" action="noticeInsert.do" method="post" enctype="multipart/form-data">
			 	<div>
			 		<table>
			 			<tr>
			 				<th width="150">작성자</th>
			 				<td width="200">
			 					<input type="text" id="noticeWriter" name="noticeWriter">
			 				</td>
			 				<th width="150">날짜</th>
			 				<td width="200">
			 					<input type="date" id="noticeDate" name="noticeDate" size="80">
			 				</td>
			 			<tr>
			 			
			 			<tr>
			 				<th>제목</th>
			 				<td colspan="3">
			 					<input type="text" id="noticeTitle" name="noticeTitle" size="80">
			 				</td>
			 			<tr>
			 			
			 			<tr>
			 				<th>내용</th>
			 				<td colspan="3">
			 					<textarea rows="10" cols="80" id="noticeSubject" name="noticeSubject" ></textarea>
			 				</td>
			 			<tr>
			 			
			 			<tr>
			 				<th>첨부파일</th>
			 				<td colspan="3">
			 					<input type="file" id="file" name="file">
			 				</td>
			 			<tr>
			 		</table>
			 	</div><br>
			 	
			 	<input class="btn" type="submit" value="등록">&nbsp;&nbsp;
			 	<input class="btn" type="submit" value="취소">
			 </form>
		</div>
	</div>
</body>
</html>