<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function alertchecks(){
		alert("이미 확인하였습니다.");
	}
	function alertdelete(){
		alert("이미 선생님이 확인하여 삭제할 수 없습니다.");
	}
</script>
<body>
<div class="container fluid">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
            <h5 class="m-0 font-weight-bold text-primary">투약의뢰서 작성</h5>
        </div>
	<div class="card-body">
    <div class="table-responsive">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<tr>
			<th>아동명</th>
			<td>${loginfo.stname}</td>
			<th rowspan="4">투약 시간</th>
			<td>
				<select id="hour_1" name="hour_1">
					<option value="매끼">매끼</option>
					<option value="점심">점심</option>
					<option value="저녁">저녁</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>반명</th>
			<td>${loginfo.classname}</td>
			<td>
				<select id="hour_2" name="hour_2">
					<option value="식전">식전</option>
					<option value="식후">식후</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>증상</th>
			<td><input type="text" id="textarea" name="textarea"></td>
			<td><input type="text" id="hour_3" name="hour_3">시<br>
			<span class="text-danger">${errhour_3}</span>
			</td>
		</tr>
		<tr>
			<th rowspan="4">약의 종류</th>
			<td><input type="radio" id="category" name="category" value="물약" checked="checked">물약</td>
			<td><input type="text" id="hour_4" name="hour_4" >분<br>
			<span class="text-danger">${errhour_4}</span>
			</td>
		</tr>
		<tr>
			<td><input type="radio" id="category" name="category" value="가루약">가루약</td>
			<th>보관방법</th>
			<td>
				<input type="radio" id="storagemethod" name="storagemethod" value="실온" checked="checked">실온
				<input type="radio" id="storagemethod" name="storagemethod" value="냉장">냉장
				<input type="radio" id="storagemethod" name="storagemethod" value="냉동">냉동
			</td>
		</tr>
		<tr>
			<td><input type="radio" id="category" name="category" value="연고">연고</td>
			<th>투약용량</th>
			<td>
				<input type="text" id="amount_1" name="amount_1">
				<select id="amount_2" name="amount_2">
					<option value="cc">cc</option>
					<option value="봉">봉</option>
					<option value="정">정</option>
				</select>
				<br>
				<span class="text-danger">${erramount_1}</span>
			</td>
		</tr>
		<tr>
			<td><input type="radio" id="category" name="category" value="기타">기타</td>
			<th>투약횟수</th>
			<td><input type="text" id="reps" name="reps">회<br>
			<span class="text-danger">${errreps}</span>
			</td>
		</tr>
		<tr>
			<th>의뢰자</th>
			<td>${loginfo.name}</td>
			<th>관계</th>
			<td>${loginfo.relationship}</td>
		</tr>
		<tr>
			<td colspan="4">
				<div class="row" style="float : right; padding: 10px">			
				<strong >의뢰일</strong>&nbsp;${time}&nbsp;
					<button type="submit" class="btn btn-default" onclick="onsubmit();">제출</button>
				</div>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>	
	</div>
	
	<!-- 이전 -->
	<div class="container col-sm-offset-2 col-sm-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4>${bean.name} 투약의뢰서</h4>
			</div>
			<div class="row panel-body">
				<div class="col-sm-4">
					<table>
						<tr>
							<td>
								<img src="<%=request.getContextPath()%>/images/teacher.jpg" class="img-rounded" 
									alt="${bean.name}" width="200" height="200">		
							</td>
						</tr>
					</table>
				</div>
				<div class="col-sm-8">
					<table class="table table-bordered">
						<tr>
							<td width="25%" align="center">등록 날짜</td>
							<td width="75%" align="left">${bean.regdate}</td>
						</tr>
						<tr>
							<td width="25%" align="center">약종류</td>
							<td width="75%" align="left">${bean.category}</td>
						</tr>
						<tr>
							<td width="25%" align="center">투약량</td>
							<td width="75%" align="left">${bean.amount}</td>
						</tr>
						<tr>
							<td width="25%" align="center">투약 횟수</td>
							<td width="75%" align="left">${bean.reps}</td>
						</tr>
						<tr>
							<td width="25%" align="center">투약 시간</td>
							<td width="75%" align="left">${bean.hour}</td>
						</tr>
						<tr>
							<td width="25%" align="center">보관방법</td>
							<td width="75%" align="left">${bean.storagemethod}</td>
						</tr>
						<tr>
							<td width="25%" align="center">비고</td>
							<td width="75%" align="left">${bean.textarea}</td>
						</tr>
						<tr>
							<td width="25%" align="center">확인 여부</td>
							<td width="75%" align="left">${bean.checks}</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="col-sm-7" style="float:right;">
				<button class="btn btn-info" onclick="location.href='<%=NoForm%>meList'">
					돌아 가기
				</button>
				<c:choose>
					<c:when test="${bean.checks != '안읽음' && whologin == 2 }">
						<button class="btn btn-info" onclick="alertchecks();">
						확인
						</button>
					</c:when>
					<c:when test="${bean.checks == '안읽음' && whologin == 2 }">
						<button class="btn btn-info" onclick="location.href='<%=NoForm%>meCheck&meno=${bean.meno}'">
						확인
						</button>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${bean.checks != '안읽음' }">
						<button class="btn btn-danger" onclick="alertdelete();">
						삭제
						</button>
					</c:when>
					<c:when test="${bean.checks == '안읽음' }">
						<button class="btn btn-danger" onclick="location.href='<%=NoForm%>meDelete&meno=${bean.meno}'">
						삭제
						</button>
					</c:when>
				</c:choose>
				
				<%-- <button class="btn btn-danger" onclick="location.href='<%=NoForm%>empDelete&tid=${bean.tid}'">
					직원 정보 삭제
				</button> --%>
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