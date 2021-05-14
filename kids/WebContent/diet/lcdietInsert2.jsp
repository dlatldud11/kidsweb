<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html><html>
<head>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
	<div class="container col-sm-offset-2 col-sm-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h4>아침 식단</h4>
			</div>
			<div class="panel-body">
				<form class="form-horizontal" action="<%=YesForm%>" method="post">
					<input type="hidden" name="command" value="dietInsert">
					<input type="hidden" name="isCheck" value="fals">
					<div class="form-group">
				      	<label class="control-label col-sm-3" for="writer">작성자</label>
				      	<div class="col-sm-9">
				        	<input type="text" class="form-control" disabled="disabled" 
				        		id="fakewriter" name="fakewriter"
				        		value="${sessionScope.loginfo.name}(${sessionScope.loginfo.tid})" >				        		
				        	<input type="hidden" name="tid" value="${sessionScope.loginfo.tid}">
				      	</div>
				    </div>
				    <div class="form-group">
						<label class="control-label col-sm-3" for="title">글 제목</label>
				      	<div class="col-sm-9">
				        	<input type="text" class="form-control" id="title" 
				        	name="title" value="${bean.title}">
				        	<span class="err">${errtitle}</span>
				      	</div>
				    </div>	
					<div class="form-group">
				      	<label class="control-label col-sm-3" for="content">글 내용</label>
				      	<div class="col-sm-9">
				        	<input type="text" class="form-control" id="subject" 
				        		name="content" value="${bean.content}">
				      	</div>
				    </div>
				    <div class="form-group">
                      	<div class="row">
                            <div class="col-sm-12">
								<select class="form-control" id="eat" name="eat">
					        		<option value="-" selected="selected">--- 타임을 선택해 주세요.</option>
								    <option value="1">아침</option>
								    <option value="2">점심</option>
								    <option value="3">저녁</option>
								    <option value="4">간식</option>
							  	</select>
								<span class="text-danger">${erreat}</span>
							</div>
						</div>
               	    </div>
					<div class="form-group">
				      	<label class="control-label col-sm-3" for="tiles">첨부 자료</label>
				      	<div class="col-sm-9">
				        	<input type="file" class="form-control" id="files" 
				        		name="files" value="${bean.files}">
				      	</div>
				    </div>
				    <div class="form-group">        
				      	<div class="col-sm-offset-2 col-sm-8">
				        	<button type="submit" class="btn btn-default">작성 완료</button>
				        	&nbsp;&nbsp;&nbsp;
				        	<button type="reset" class="btn btn-default">초기화</button>
				      	</div>
				    </div>
				</form>
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