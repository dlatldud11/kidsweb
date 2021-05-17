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
			location.href='<%=NoForm%>meList'+'&mode='+mode+'&keyword='+keyword;
		}
		function searchAll(){
			locatoin.gref='<%=NoForm%>meList';
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
   <div class="container col-sm-offset-4 col-sm-8">
         <div class="panel panel-primary">
            <div class="panel-heading">
               <h4>투약의뢰서 목록</h4>
               <h2>ㅇㅇ반</h2>
               <div class="search">
                  <tr>
                     <td align="center" colspan="11">
                        <form action="" class="form-inline" role="form" name="myform" method="get"> 
                           <div class="form-group">
                              <select id="mode" name="mode" class="form-control">
                                 <option value="all" selected="selected">-- 선택하세요.
                                 <option value="name">등록날짜
                                 <option value="tid">이름
                                  <option value="email">확인여부
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
                           ${pageInfo.pagingStatus}                        
                        </form>
                     </td>
                  </tr>   
               </div>
            <br>
               <table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>등록날짜</th>
							<th>이름</th>
							<th>확인 여부</th>
						</tr>
					</thead>
			  	 <tbody>
						<c:forEach var="bean" items="${requestScope.lists}">
							<tr onclick="location.href='<%=NoForm%>meDetail&tid=${bean.tid}&${requestScope.parameters}'">
								<td>${bean.tid}</td>
								<td>${bean.name}</td>
								<td>${bean.gender}</td>
								<td>${bean.hp}</td>
								<td>${bean.email}</td>
								<td>${bean.class_id}</td>
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
<html>
<body>
<%@ include file="./../common/footer.jsp" %>
</body>
</html>