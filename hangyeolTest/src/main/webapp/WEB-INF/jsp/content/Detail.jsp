<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	

</head>
<script type="text/javascript">

$(document).ready(function(){
	getComment();
});

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

function fn_alert(){
	alert('이미 좋아요를 누르셨습니다');
	return false;	
}
</script>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script src="${root}/js/user/deletcheck.js"></script>
<body>
	<!-- header -->
	<c:import url="/etc/headerd"></c:import>
	<main class="main-content mt-1 border-radius-lg">
		${msg}
		<form method="post">
			<c:if test="${nt.secret!='Y'}">
				<div class="container">
					<div class="row">
						<div class="col-12">

							<!-- 게시글 내용 영역 -->
							<table class="table">
								<thead>
									<tr>
										<th>게시판</th>
										<td>${nt.boardid}</td>
										<th>작성일</th>
										<td>${nt.regdate}</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>글쓴이</th>
										<td>
											${nt.writeid} 
											<a class="dropdown-item" href="${root}/Userinfo?writeid=${nt.writeid}" onclick="window.open(this.href, '_blank', 'width=400, height=200, toolbars=no, scrollbars=yes'); return false;">🔍</a>
											<a class="dropdown-item" href="${root}/writeuserpage?writeid=${nt.writeid}">🎫</a></button>
											<c:if test="${not empty userID}">

												<li class="nav-item px-3 d-flex align-items-center">
													<form method="post" action="${root}/usertables" class="nav-link text-body p-0">
														<input type="hidden" name="userName" value="${userName}" />
														<input type="hidden" name="userRank" value="${userRank}" />
														<input type="hidden" name="userID" value="${userID}" />

													</form>
												</li>
											</c:if> <%-- 	<div class="dropdown">
												<button class="btn btn-secondary dropdown-toggle"
													type="button" id="dropdownMenuButton2"
													data-bs-toggle="dropdown" aria-expanded="true">
													${nt.writeid}</button>
												<ul class="dropdown-menu dropdown-menu-dark"
													aria-labelledby="dropdownMenuButton2">
													<li><a class="dropdown-item" href="${root}/user/Userinfo?writeid=${nt.writeid}">회원 정보</a></li>
													<li><a class="dropdown-item" href="#">팔로우</a></li>
													<li><a class="dropdown-item" href="#">쪽지 보내기</a></li>
													<li><hr class="dropdown-divider"></li>
													<li><a class="dropdown-item" href="#">차단</a></li>
												</ul>
												<a class="dropdown-item" href="${root}/user/Userinfo?writeid=${nt.writeid}" onclick="window.open(this.href, '_blank', 'width=400, height=200, toolbars=no, scrollbars=yes'); return false;">${nt.writeid}뭐야</a>
												<button type="button" onclick="${root}/user/Userinfo?writeid=${nt.writeid}" class="btn btn-primary">${nt.writeid}뭐야</button>
											</div> 
											 --%>

										</td>
										<th>조회수</th>
										<td>${nt.cocnt}</td>
									<tr>
										<td>첨부파일</td>
										<td><a download href="../../../upload/${nt.files}">${nt.files}</a>
										</td>
										<th>좋아요</th>
										<td colspan="2"><c:if test="${check==0 }">
												<input type="button" value="❤"
													onclick="location.href='/contents/like?pid=${nt.id}'">
											</c:if> <c:if test="${check!=0 }">
												<input type="button" onclick="fn_alert()" value="❤">
											</c:if></td>
										<td>${count}</td>
									</tr>
									<tr>
										<th>부제</th>
										<td><c:if test="${nt.titleid==1 }">
									잡담
								</c:if> <c:if test="${nt.titleid==2 }">
									질문
								</c:if> </td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3">${nt.title}</td>
									</tr>
									<tr>
										<th colspan="4">내용</th>
									</tr>
									<tr>
										<td colspan="4">${nt.content}</td>
									</tr>
								</tbody>
							</table>

							<!-- 댓글 영역 -->

							<hr>

							<!-- 세션 userID예 값이 없으면 -->
							<c:if test="${sessionScope.userID eq null}">
								<div>
									<p>로그인되지 않았습니다.</p>
								</div>
							</c:if>

							<!-- 세션 userID예 값이 있으면 -->
							<c:if test="${!(sessionScope.userID eq null)}">
								<div id="content">
								</div>
							</c:if>


							<!-- 목록,수정,삭제 목록 영역 -->
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<c:if
									test="${sessionScope.userID!=nt.writeid || sessionScope.userRank!='A'}">
								</c:if>
								<c:if
									test="${sessionScope.userID==nt.writeid || sessionScope.userRank=='A'}">
									<button class="btn btn-primary me-md-2"
										onclick="location.href='modify?id=${nt.id}&q=${q}&f=${f}&titleid=${nt.titleid}&boardid=${select-1}'"
										type="button">수정</button>
									<button class="btn btn-primary me-md-2"
										onclick="button_event(${nt.id})" type="button">삭제</button>
								</c:if>
								<button class="btn btn-primary" type="button"
									onclick="location.href='${root}/list'">목록으로</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>

			<c:if test="${nt.secret =='Y'}">
				<c:if test="${!(sessionScope.userID eq nt.writeid )}">
					<c:if test="${!(sessionScope.userRank eq 'A' )}">
				글쓴이와 관리자만 볼 수 있는 게시물입니다.돌아가세요.
			<button class="btn btn-primary" type="button"
							onclick="location.href='${root}/list'">돌아가기</button>
					</c:if>
				</c:if>
				<c:if
					test="${sessionScope.userID eq nt.writeid || sessionScope.userRank eq 'A'}">
					<div class="container">
						<div class="row">
							<div class="col-12">

								<!-- 게시글 내용 영역 -->
								<table class="table">
									<thead>
										<tr>
											<th>게시판</th>
											<td>${nt.boardid}</td>
											<th>작성일</th>
											<td>${nt.regdate}</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>글쓴이</th>
											<td>${nt.writeid}</td>
											<th>조회수</th>
											<td>${nt.hit}</td>
										<tr>
											<td>첨부파일</td>
											<td><a download href="../../../upload/${nt.files}">${nt.files}</a>
											</td>
											<th>좋아요</th>
											<td colspan="2"><c:if test="${check==0 }">
													<input type="button" value="❤"
														onclick="location.href='/contents/like?pid=${nt.id}'">
												</c:if> <c:if test="${check!=0 }">
													<input type="button" onclick="fn_alert()" value="❤">
												</c:if></td>
											<td>${count}</td>
										</tr>
										<tr>
											<th>부제</th>
											<td><c:if test="${nt.titleid==1 }">
									잡담
								</c:if> <c:if test="${nt.titleid==2 }">
									질문
								</c:if> <c:if test="${nt.titleid==3 }">
									정보
								</c:if> <c:if test="${nt.titleid==4 }">
									공지
								</c:if></td>
										</tr>
										<tr>
											<th>제목</th>
											<td colspan="3">${nt.title}</td>
										</tr>
										<tr>
											<th colspan="4">내용</th>
										</tr>
										<tr>
											<td colspan="4">${nt.content}</td>
										</tr>
									</tbody>
								</table>

								<!-- 댓글 영역 -->

								<hr>

								<!-- 세션 userID예 값이 없으면 -->
								<c:if test="${sessionScope.userID eq null}">
									<div>
										<p>로그인되지 않았습니다.</p>
									</div>
								</c:if>

								<!-- 세션 userID예 값이 있으면 -->
								<c:if test="${!(sessionScope.userID eq null)}">
									<div id="content"></div>
								</c:if>



								<!-- 목록,수정,삭제 목록 영역 -->
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<c:if
										test="${sessionScope.userID!=nt.writeid || sessionScope.userRank!='A'}">
									</c:if>
									<c:if
										test="${sessionScope.userID==nt.writeid || sessionScope.userRank=='A'}">
										<button class="btn btn-primary me-md-2"
											onclick="location.href='modify?id=${nt.id}&q=${q}&f=${f}&titleid=${nt.titleid}&boardid=${select-1}'"
											type="button">수정</button>
										<button class="btn btn-primary me-md-2"
											onclick="button_event(${nt.id})" type="button">삭제</button>
									</c:if>
									<button class="btn btn-primary" type="button"
										onclick="location.href='${root}/list'">목록으로</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:if>
		</form>
	</main>
</body>
</html>