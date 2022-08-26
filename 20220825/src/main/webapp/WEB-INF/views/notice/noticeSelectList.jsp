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
.btn, .sch {
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

.ntr:hover, .btn:hover {
 color:#6098FF;  
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

<script src="resources/js/jquery-3.6.0.min.js"></script>

</head>
<body>
<div name="div1"><h1 name="title">공지사항 목록</h1></div>

	<div align="right">
		<select class="sch" id="key" name="key">
			<option value="1">제목</option>
			<option value="2">내용</option>
			<option value="3">작성자</option>
		</select> 
		<input class="sch" name ="schname" type="text" id="val" name="val">
		<button class="btn" type="button" onclick="searchCall()">검색</button>
	</div>
	<br>

	<table border="1">
		<thead>
			<tr>
				<th width="8%">글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th width="12%">📁</th>
				<th width="18%">날짜</th>
				<th width="8%">조회수</th>
			</tr>
		</thead>
		<tbody id="tb" name="tb">
			<c:forEach items="${notices }" var="n">
				<tr class="ntr" Onclick="noticeCall(${n.NOTICE_ID})">
					<td>#${n.NOTICE_ID} </td>
					<td>${n.NOTICE_WRITER} </td>
					<td>${n.NOTICE_TITLE}</td>
					<td>${n.NOTICE_ATTECH } </td>
					<td> <fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${n.NOTICE_DATE}"/></td>
					<td>${n.NOTICE_HIT } </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div>
		<form id="frm" method="post">
			<input name="noticeId" id="noticeId" type="hidden">
		</form>
	</div>
	


	<br>
	<div style="display: flex; justify-content: center;">
		<input class="btn" type="button" value="글쓰기" onClick="location.href='noticeForm.do'" >
	</div>
	
	
	<script type="text/javascript">
		function noticeCall(id) {
			frm.noticeId.value=id;
			frm.action = "noticeSelect.do";
			frm.submit();
		}
		
		
		//ajax 검색처리 패치버전 post방식
		/*function searchCall() {
			let key = document.getElementById('key').value;
			let val = document.getElementById('val').value;
			
			fetch("ajaxSearch.do",{
				method : 'post',
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded',
				},
				body : "key="+key+"&val="+val,
			}).then(response => response.json())
			  .then((data) => console.log(data)); //html convert method
		}
		
		//json형태로 값을 전달할 때 get방식
		headers : {
			'Content-Type' : 'application/json',
		},
		body : JSON.stringify({'key':key, 'val':val})
		*/
		
		function searchCall() { //제이쿼리버전
			let key = document.getElementById('key').value;
			let val = document.getElementById('val').value;
			$.ajax({
				url : "ajaxSearch.do",
				type : "post",
				data : {"key" : key, "val" : val},
				dataType : "json",
				success : function(response) { //결과로 처리되어 돌아오는 데이터
						  console.log(response);
						  htmlView(response);
				},
				error : function() {	
				
				}
			}); 
		}
		
		
		function htmlView(data) {
			$("[name='tb']").remove();
			let tbody = $("<tbody name='tb' />");
			$.each(data, function(index, item){
				let row = $("<tr class='ntr' />").attr("onclick","noticeCall("+item.noticeId+")").append(
							$("<td />").css('width','8%').text(item.noticeId),
							$("<td />").text(item.noticeWriter),
							$("<td />").text(item.noticeTitle),
							$("<td />").css('width','12%').text(item.noticeAttech),
							$("<td />").css('width','18%').text(item.noticeDate),
							$("<td />").css('width','8%').text(item.noticeHit),
						);
				tbody.append(row);
			});
			$('table').append(tbody);
			
			
			$("[name='title']").remove();
			let h1 = $("<h1 name='title' />").html("“" + $("[name='schname']").val() + "”의 검색결과입니다.");
			$("[name='div1']").append(h1);
				
		}
		
	</script>
</body>
</html>