<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html><html>
<head>
	<style type="text/css">
		.badge{background:orange; color:red;}
	</style>
	<script>
		$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
		
		function submit(){
			document.myform.submit();
		}
		
		function callFunction(name) {
			alert(name);
			document.myform.submit_menu.value=name;
			submit();
		}
		
		/* 필드 검색 상태 보존 */
		$('#class_menu option').each(function(){
			if($(this).val() == '${class_menu}'){
				$(this).attr('selected', 'selected') ;
			}			
		});
		
		$('#submit_menu').val('${submit_menu}');

	</script>
</head>
<body>
 <div class="d-sm-flex align-items-center justify-content-between mb-4">
   <div class="container col-sm-offset-4 col-sm-8">
         <div class="card card-primary">
            <div class="card-header">
               <h4 align="center" >보호자 목록</h4>
         	</div>
          	<div class="card-body">
          		<table class="table table-hover">
               		<thead>
               			<tr>
               				<td align="center" style="padding-top: 20px;">학급 선택</td>
               				<td colspan="2">
               					<form name="myform" method="post" action="<%=YesForm%>">
               					<select name="class_menu" id="class_menu" class="form-control">
	                                 <option value="all" selected="selected">전체
	                                 <c:forEach var="bean" items="${requestScope.clists}">
	                                 	<option value="bean.class_name">
	                                 </c:forEach>
	                            </select>
	                            <input type="hidden" id="submit_menu" name="submit_menu" value="all">
	                            <input type="hidden" name="command" value="paList">
	                            </form>
               				</td>
               				<td colspan="1">
               						<button class="btn btn-primary" type="button" onclick="submit();">적용</button>
               				</td>
               				<td colspan="4">
					  		</td>
						</tr>
						<tr>
							<td colspan="4">
								<input class="form-control" id="myInput" type="text" placeholder="Search..">
							</td>
							<td colspan="4">
								<ul class="nav nav-tabs justify-content-end">
								    <li class="nav-item">
								      <a class="nav-link" href="javascript:callFunction('전체');" >전체</a>
								    </li>
								    <li class="nav-item">
								      <a class="nav-link" href="javascript:callFunction('승인');">승인</a>
								    </li>
								    <li class="nav-item">
								      <a class="nav-link" href="javascript:callFunction('미승인');">미승인</a>
								    </li>
							  	</ul>
							</td>
						</tr>
                  	 
                 		<tr>
							<th>학급명</th>
							<th>학생명</th>
							<th>관계</th>
							<th>보호자명</th>
							<th>아이디</th>
							<th>휴대폰번호</th>
							<th>승인 상태</th>
							<th>승인 처리</th>
						</tr>
               	  </thead>
               	   
               	  <tbody>
					<c:forEach var="bean" items="${requestScope.plists}">
						<tr onclick="location.href='<%=NoForm%>paDetail&pid=${bean.pid}'">
							<td>${bean.classname}</td>
							<td>${bean.stname}</td>
							<td>${bean.relationship}</td>
							<td>${bean.name}</td>
							<td>${bean.pid}</td>
							<td>${bean.hp}</td>
							<td>${bean.submit}</td>
							<td>
								<button class= "button button-primary" type="button" onclick="location.href='<%=NoForm%>paSubmitUpdate&pid=${bean.pid}&class_menu=${requestScope.class_menu }&submit_menu=${requestScope.submit_menu}'">가입 승인</button>
							</td>							
						</tr>							
					</c:forEach>		
					</tbody>
                 </table>
          </div>
        </div>
    </div>
</div>
</body>
</html>