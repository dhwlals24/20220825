<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.tsub {
 height:400px;
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
<h1>공지사항 자세히보기</h1>

	<table border="1">
		<tr>
			<td width="8%">#${notice.noticeId } </td>
			<td width="15%">${notice.noticeWriter } </td>
			<td >${notice.noticeTitle } </td>
			<td width="15%">📁${notice.noticeAttech } </td>
			<td width="12%">${notice.noticeDate } </td>
			<td width="8%">${notice.noticeHit } </td>
		</tr>
	</table>
	<br>
	
	<table class="tsub" border="1">
		<tr>
			<td>${notice.noticeSubject } </td>
		</tr>
	</table>

</body>
</html>