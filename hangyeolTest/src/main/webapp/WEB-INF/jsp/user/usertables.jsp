<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<!-- root Route -->
<c:set var="root" value="${pageContext.request.contextPath}" />
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>user</title>


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
<link id="pagestyle" href="${root}/css/user/soft-ui-dashboard.css?v=1.0.2"
	rel="stylesheet" />




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
							<h6>유저관리게시판</h6>
						</div>
						<div class="card-body px-0 pt-0 pb-2">
							<div class="table-responsive p-0">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">id</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">이름</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">이메일</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">유저등급</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">로그인설정</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">댓글설정</th>
											<th
												class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">글쓰기설정</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="li" items="${list}">
											<tr>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${li.id}</h6>
														</div>
													</div>
												</td>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${li.name}</h6>
														</div>
													</div>
												</td>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${li.email}</h6>
														</div>
													</div>
												</td>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${li.rank}</h6>
															<form method="post" action="${root}/user/usergrade">
																<input type="hidden" name="id" value="${li.id}" /> <input
																	type="submit" value="등급조정">
															</form>
														</div>
													</div>
												</td>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${li.loginFlag}</h6>
														</div>
													</div>
												</td>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${li.commentFlag}</h6>
															<form method="post" action="${root}/user/flagmodify">
																<input type="hidden" name="id" value="${li.id}" />
															 <input
																	type="submit" value="설정 변경">

															</form>
															
														</div>
													</div>
												</td>
												<td>
													<div class="d-flex px-2 py-1">
														<div class="d-flex flex-column justify-content-center">
															<h6 class="mb-0 text-sm">${li.writeFlag}</h6>
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

			<div class="col-12">
				<div class="row">
					<div class="col-4">
						<!-- 변수선언 -->
						<c:set var="page" value="${empty param.p?1:param.p}"></c:set>
						<c:set var="startNum" value="${p-(p-1)%5}"></c:set>
						<c:set var="lastNum"
							value="${fn:substringBefore(Math.ceil(count/10),'.')}"></c:set>

						<!-- 현재 페이지 -->
						<div>
							<span>${page} </span> / ${lastNum} pages
						</div>
					</div>
					<div class="col-5">
						<!-- 페이징처리 시작 -->
						<section aria-label="Page navigation example">
							<ul class="pagination">
								<!-- 이전 페이지 -->
								<li class="page-item"><c:if test="${startNum > 1 }">
										<a class="page-link"
											href="?p=${startNum-1}&q=${sv.q}&f=${sv.f}">Prev</a>
									</c:if> <c:if test="${startNum <= 1 }">
										<a class="page-link" href="#" onclick="alert('첫 페이지입니다.');">Prev</a>
									</c:if></li>
								<!-- 숫자 페이지 -->
								<c:forEach var="i" begin="0" end="4">
									<li class="page-item"><c:if
											test="${param.p==(startNum+i)}">
											<c:set var="style" value="font-weight:bold; color:red;" />
										</c:if> <c:if test="${param.p!=(startNum+i)}">
											<c:set var="style" value="" />
										</c:if> <c:if test="${(startNum+i) <=lastNum }">
											<a style="${style}" class="page-link"
												href="?p=${startNum+i}&q=${sv.q}&f=${sv.f}">${startNum+i}</a>
										</c:if></li>
								</c:forEach>
								<!-- 다음 페이지 -->

								<li class="page-item"><c:if
										test="${startNum+5 <= lastNum }">
										<a class="page-link"
											href="?p=${startNum+5}&q=${sv.q}&f=${sv.f}">Next</a>
									</c:if> <c:if test="${startNum+5 >lastNum }">
										<a class="page-link" href="#" onclick="alert('마지막 페이지입니다.');">Next</a>
									</c:if></li>
							</ul>
						</section>
						<!--  검색 -->
						<form method="get">
							<div>
								<select name="f">
									<option ${(param.f==" id")?"selected":""} value="id">ID</option>
									<option ${(param.f=="name")?"selected":""} value="name">이름</option>
								</select> <input type="text" name="q" /> <span><input
									type="submit" value="검색"></span>
							</div>
						</form>
					</div>
					

				</div>
			</div>
		
		</div>
	</main>
	<!--   Core JS Files   -->
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap.min.js"></script>
	<script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="../assets/js/soft-ui-dashboard.min.js?v=1.0.2"></script>
	
	

</body>

</html>