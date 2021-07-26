<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="apple-touch-icon" sizes="76x76" href="${root}/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${root}/assets/img/favicon.png">
<title>
Soft UI Dashboard by Creative Tim
</title>
<!-- root Route -->
<c:set var="root" value="${pageContext.request.contextPath}" />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="${root}/css/user/nucleo-icons.css" rel="stylesheet" />
<link href="${root}/css/user/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="${root}/css/user/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle" href="${root}/css/user/soft-ui-dashboard.css?v=1.0.2" rel="stylesheet" />
</head>

<body class="g-sidenav-show   bg-gray-100">
	<!-- header -->
	<c:import url="/etc/headerd"></c:import>
  <main class="main-content mt-1 border-radius-lg">
	<div class="container-fluid py-4">
			<div class="row">
				<div class="col-12">
					<div class="card mb-4">
						<div class="card-header pb-0">
							<h6>마이페이지</h6> <span style="color:#008080;font-weight: bold">${userName}</span>님의 현재 등급은 <span style="color:#FF0000;font-weight: bold">${userRank}</span>입니다.
							<h6>내가 쓴 글 모아보기</h6>
						</div>
						<div class="card-body px-0 pt-0 pb-2">
							<div class="table-responsive p-0">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">게시판번호</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">제목</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">내용</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">등록일</th>																
										</tr>
									</thead>
									<tbody>
										<c:forEach var="li" items="${mp}">
											<tr>
												<td>
												<c:if test="${li.boardid== 1}">
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">공지사항</h6>
														</div>
													</div>
													</c:if>
												<c:if test="${li.boardid== 2}">
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">공포</h6>
														</div>
													</div>
													</c:if>
													<c:if test="${li.boardid== 3}">
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">액션</h6>
														</div>
													</div>
													</c:if>
													<c:if test="${li.boardid==4}">
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">로멘스</h6>
														</div>
													</div>
													</c:if>
													<c:if test="${li.boardid==5}">
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">만화</h6>
														</div>
													</div>
													</c:if>
												</td>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${li.title}</h6>
														</div>
													</div>
												</td>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${li.content}</h6>
														</div>
													</div>
												</td>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${li.regdate}</h6>															
														</div>
													</div>
												</td>												
											</tr>

										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
	<div>
		<input type="button"
			onclick="location.href='main'"
			value="메인으로">
	</div>
</main>
</body>
</html>