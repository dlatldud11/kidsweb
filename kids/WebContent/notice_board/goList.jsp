<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function search(){
			var mode = $('#mode').val();
			var keyword = $('#keyword').val();
			location.href='<%=NoForm%>goList'+'&mode='+mode+'&keyword='+keyword;
		}
		function searchAll(){
			locatoin.gref='<%=NoForm%>goList';
		}
		
	</script>
   <style type="text/css">
      .badge{background:orange; color:red;}
      .form-inline{
         justify-content: flex-end;
      }
   </style>
</head>
<body>
 <div class="d-sm-flex align-items-center justify-content-between mb-4">
   <div class="container col-sm-offset-2 col-sm-10">
         <div class="panel panel-primary">
             <div class="card-header py-3" style="background-color:white;">
               <h4>공지 사항</h4>
               <div class="card-body" style="background-color:white;">
                  <form action="" class="form-inline" role="form" name="myform" method="get"> 
                    <div>${pageInfo.pagingStatus}</div>
                    &nbsp;&nbsp;
                     <div class="form-group">
                        <select id="mode" name="mode" class="form-control">
                           <option value="all" selected="selected">-- 선택하세요.
                           <option value="title">글제목
                           <option value="tid">아이디
                            <option value="class_id">학급
                        </select>
                     </div>                           
                     <div class="form-group">
                        <input type="text" class="form-control" name="keyword" id="keyword"> 
                     </div>  
                     &nbsp;&nbsp;
                     <button class="btn btn-primary" type="button" onclick="search();">검색</button>
                     &nbsp;&nbsp;
                     <button class="btn btn-primary" type="button" onclick="searchAll();">전체 검색</button>
                     &nbsp;&nbsp;
                  </form>
            <br>
               <table class="table table-hover">
					<thead align="center">
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>글쓴이</th>
							<th>학급</th>
							<th>조회수</th>
							<th>등록일</th>
						</tr>
					</thead>
			  	 <tbody align="center">
						<c:forEach var="bean" items="${requestScope.lists}">
							<tr onclick="location.href='<%=NoForm%>goDetail&notino=${bean.notino}&${requestScope.parameters}'">
								<td>${bean.notino}</td>
								<td>${bean.title}</td>
								<td>${bean.tid}</td>
								<td>${bean.class_name}</td>
								<td>${bean.readhit}</td>
								<td>${bean.regdate}</td>
							</tr>
					</c:forEach>
				</tbody>
		 	</table>
		 	<button class="btn btn-primary" style="float:right;margin-top:2px;" onclick="location.href='<%=NoForm%>goInsert&tid=${sessionScope.loginfo.tid}'">
					글쓰기
			</button>
        </div> 
      </div>
      </div> 
      <div style="width: 30%; float:none; margin:0 auto" >
		<p style="width: 100%">${pageInfo.pagingHtml}</p>
	  </div>
	</div>
</div>
</body>
</html>