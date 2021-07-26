<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<style>
	.profile {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	border: 1px solid #ffffff;
	}
</style>

<script type="text/javascript">

/* 댓글 호출 */
function getComment() {
	$.ajax({
		type: "get",
		url: "comment?id=${param.id}",
		dataType: "text",
		error: function() {
			alert("문제가 발생하였습니다, 관리자에게 문의하세요.");
		},
		success: function(content) {
			$("#content").html(content);
		}

	})
}

/* 댓글작성 */
$('#setComment').on('click', function setComment(){
	let conn = $("#conn").val();
	let writeid = $("#writeid").val();
	let username = $("#username").val();
    let form = {
    		id: ${param.id},
    		writeid: writeid,
    		username: username,
    		content: conn
    }
    $.ajax({
        url: "${root}/setComment",
        type: "POST",
        data: form,
        success: function(){
        	getComment();
        	
        },
        error: function(){
            alert("작동에러");
        }
    })
})

/* 댓글 삭제 */
function deleteComment(deleteID){
	if (confirm("댓글을 삭제하시겠습니까?") == true){ 
		    let form = {id: deleteID}
	    $.ajax({
	        url: "${root}/deleteComment",
	        type: "POST",
	        data: form,
	        success: function(){
	        	getComment();
	        },
	        error: function(){
	            alert("작동에러");
	        }
	    })
	}else {
		}
	}
	

</script>


</head>

<body>

		<c:if test="${list eq '[]'}">
			<table class="table">
				<tr>
					<td>작성된 댓글이 없습니다.</td>
				</tr>
			</table>
		</c:if>

		<c:if test="${!(list eq null)}">
			<c:forEach var="li" items="${list}">
			<div id="comment${li.id}">
				<table class="table">
					<tbody>
						<tr>
							<th rowspan="2" width="100"><img class="profile" alt="대충 프로필사진" src="https://via.placeholder.com/150"></th>
							<th>작성자 :</th>
							<th>${li.username}</th>
							<th>작성일 :</th>
							<th><fmt:formatDate value="${li.regdate}"
									pattern="yyyy-MM-dd" /></th>
							<th>
							<c:if test="${(sessionScope.userID eq li.writeid) || (sessionScope.userRank eq 'A')}">
								<a href="#"data-bs-toggle="modal" data-bs-target="#exampleModal${li.id}">수정</a>
								/
								<a href="#" onclick="deleteComment(${li.id})">삭제</a>
							</c:if>
							<c:if test="${!(sessionScope.userID eq li.writeid) || !(sessionScope.userRank eq 'A')}"></c:if>
							</th>
						</tr>
						<tr>
							<th colspan="5">${li.content}</th>
						</tr>
					</tbody>
				</table>
			</div>
			<form action="${root}/modifyComment" method="POST">
			<div class="modal fade" id="exampleModal${li.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					<div class="modal-body">
					<div class="mb-3">
						<textarea class="form-control" name="content">${li.content}</textarea>
						<input type="hidden" name="detailID" value="${param.id}">
						<input type="hidden" name="writeid" value="${sessionScope.userID}">
						<input type="hidden" name="id" value="${li.id}">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</div>
		</div>
	</div>
	</form>
			</c:forEach>
		</c:if>

	<table class="table">
		<tr>
			<c:if test="${sessionScope.commentFlag== 'Y'}">
			<td>
				<textarea rows="5" cols="130" id="conn" name="conn" required></textarea>
				<input type="hidden" value="${sessionScope.userID}" name="writeid" id="writeid">
				<input type="hidden" value="${sessionScope.userName}" name="username" id="username">
			</td>
			<td><input type="button" class="btn btn-primary" id="setComment" value="작성"></td>
			</c:if>
			<c:if test="${sessionScope.commentFlag=='N'}">
			<td>댓글을 사용할 수 없는 계정입니다.</td>
			</c:if>
		</tr>
	</table>
</body>
</html>