<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>   
<!DOCTYPE>
<html>
<head>
</head>
<body>
	       <!-- 로그인 상태 정보 -->
<c:set var="whologin" value="0" /> 
<c:if test="${empty sessionScope.loginfo}">
	<c:set var="whologin" value="0" />
</c:if>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.responsibilities == '원장'}">
		<c:set var="whologin" value="1" />
	</c:if>
	<c:if test="${sessionScope.loginfo.responsibilities == '직원'}">
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.loginfo.responsibilities != '원장'}">
		<c:if test="${sessionScope.loginfo.responsibilities != '직원'}">
			<c:set var="whologin" value="3" />
		</c:if>
	</c:if>
</c:if>

<!DOCTYPE html>
<html lang="en">
<%
	/* position for grid system */	
	int offset = 2 ;
	int mywidth = 12 - 2 * offset ;
	int formleft = 3 ;
	int formright = 12 - formleft ;
	int rightButton = 2 ;
%>

<!DOCTYPE html>
<html>
<head>
<script>	
		function search(){
			/* alert('검색');  */	
			var mode = $('#mode').val() ;
			var keyword = $('#keyword').val() ;
			location.href='<%=NoForm%>boList' + '&mode=' + mode + '&keyword=' + keyword ;
		}
		function searchAll(){
			/* alert('전체 검색'); */
			location.href='<%=NoForm%>boList';
		}
		function writeForm(){
			/* alert('글 작성'); */
			location.href='<%=NoForm%>boInsert';
		}
		
		$(document).ready(function(){
			
		});
	</script>
<style type="text/css">
.badge {
	background: orange;
	color: red;
}

.form-inline {
	justify-content: flex-end;
}
</style>
</head>
<body>
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<div class="container col-sm-offset-<%=offset%> col-sm-<%=mywidth%>">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>원비 납부 관리</h4>
				</div>
						<tr>
							<td align="center" colspan="11">
								<form action="" class="form-inline" role="form" name="myform"
									method="get">
									<div class="form-group">
										<select id="mode" name="mode" class="form-control">
											<option value="all" selected="selected">-- 선택하세요.
											<option value="name">이름
											<option value="gender">성별
										</select>
									</div>
									년 &nbsp;
									<div class="form-group">
										<select id="mode" name="mode" class="form-control">
											<option value="all" selected="selected">-- 선택하세요.
											<option value="name">이름
											<option value="gender">성별
										</select>
									</div>
									월 &nbsp; 납부
									<div class="form-group">
										<select id="mode" name="mode" class="form-control">
											<option value="all" selected="selected">-- 선택하세요.
											<option value="name">이름
											<option value="gender">성별
										</select>
									</div>
									&nbsp;반 
									<div class="form-group">
										<select id="mode" name="mode" class="form-control">
											<option value="all" selected="selected">-- 선택하세요.
											<option value="name">이름
											<option value="gender">성별
										</select>
									</div>
									&nbsp;한 페이지에 표시할 갯수 
									<div class="form-group">
										<select id="mode" name="mode" class="form-control">
											<option value="all" selected="selected">-- 선택하세요.
											<option value="name">이름
											<option value="gender">성별
										</select>
									</div>
									
								</form>
							</td>
						</tr>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>반</th>
									<th>납부</th>
									<th>미납금</th>
									<th>비고</th>
								</tr>
							</thead>
							</table>
							<tbody>
							 	<c:forEach var="bean" items="${requestScope.lists}">		
							<tr>
								<td>${bean.name}</td>
								<td>${bean.gender}</td>
								<td>${bean.hp}</td>
								<td>${bean.birth}</td>
								<td>${bean.address}</td>
								<td>${bean.textarea}</td>
							</tr>
								</c:forEach> 
							</tbody>
								<form action="" class="form-inline" role="form" name="myform" method="get">
									<div class="form-group">
										<select id="mode" name="mode" class="form-control">
											<option value="all" selected="selected"> -- 선택하세요.
											<option value="writer">번호
											<option value="subject">이름
											<option value="content">반
										</select>
									</div>
									
									<div class="form-group">
										<input type="text" class="form-control" name="keyword"
												id="keyword">
									</div>
										&nbsp;&nbsp;
										<button class="btn btn-primary" type="button"
											onclick="search();">검색</button>
										&nbsp;&nbsp; ${pageInfo.pagingStatus}
								</form>
						</div>
					</div>
				
					
					
					<div align="center">
						<footer>${pageInfo.pagingHtml}</footer>
					</div>
				</div>
			</div>
		</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<script type="text/javascript">
			/* 필드 검색 상태 보존 */
			$('#mode option').each(function() {
				if ($(this).val() == '${pageInfo.mode}') {
					$(this).attr('selected', 'selected');
				}
			});

			$('#keyword').val('${pageInfo.keyword}');
		</script>
    <!-- Bootstrap core JavaScript-->
    <script src="<%=request.getContextPath()%>/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath()%>/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath()%>/bootstrap/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="<%=request.getContextPath()%>/bootstrap/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath()%>/bootstrap/js/demo/chart-area-demo.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/demo/chart-pie-demo.js"></script>


<%@ include file="./../common/footer.jsp" %>

</body>
</html>