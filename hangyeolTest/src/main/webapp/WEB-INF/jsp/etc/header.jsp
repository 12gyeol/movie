<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- root Route -->
	<c:set var="root" value="${pageContext.request.contextPath}" />
	

  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${root}/css/list/nucleo-svg.css" rel="stylesheet" />


	<!-- Stylesheets -->
	<link rel="stylesheet" href="${root}/css/main/bootstrap.min.css"/>
	<link rel="stylesheet" href="${root}/css/main/font-awesome.min.css"/>
	<link rel="stylesheet" href="${root}/css/main/slicknav.min.css"/>
	<link rel="stylesheet" href="${root}/css/main/fresco.css"/>
	<link rel="stylesheet" href="${root}/css/main/slick.css"/>
	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="${root}/css/main/style.css"/>
	
	<!--====== Javascripts & Jquery ======-->
	<script src="${root}/js/main/vendor/jquery-3.2.1.min.js"></script>
	<script src="${root}/js/main/jquery.slicknav.min.js"></script>
	<script src="${root}/js/main/slick.min.js"></script>
	<script src="${root}/js/main/fresco.min.js"></script>
	<script src="${root}/js/main/main.js"></script>

	
 <!-- Bootstrap core CSS -->
	<link href="${root}/css/bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${root}/css/board/dashboard.css" rel="stylesheet">
    
    <!-- Bootstrap js-->
     <script src="${root}/js/bootstrap/bootstrap.bundle.min.js" defer></script>
   
    <!-- Dashboard js -->
      <script src="${root}/js/board/dashboard.js" defer></script>
</head>
<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section -->
	<header class="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4 col-md-3 order-2 order-sm-1">
					<div class="header__social">
					<c:if  test="${sessionScope.userRank eq 'A'}"> 	
						<a href="movie"><i class="">차트영화크롤</i></a>
						<a href="nextmovie"><i class="">개봉예정영화크롤</i></a>
						</c:if>
							<c:if  test="${!(sessionScope.userRank eq 'A')}"></c:if>
					</div>
				</div>
				<div class="col-sm-4 col-md-6 order-1  order-md-2 text-center">
					<a href="main" class="site-logo"> <!--나중에 로고 넣으세요!!!-->
						<img src="${root}/img/main/name.png" width="30%">
					</a>
				</div>
				
				<div class="col-sm-4 col-md-3 order-3 order-sm-3">
					<div class="header__switches">
						<a href="#" class="search-switch"><i class="fa fa-search"></i></a>
						<a href="#" class="nav-switch"><i class="fa fa-bars"></i></a>
						<c:if  test="${sessionScope.userID == null}"> 	
						<a href="#" onClick="location.href='${root}/login'"><i>로그인</i></a>
						</c:if>
						    <form action="${root}/index" method="get">
						<c:if  test="${sessionScope.userID != null}">
						<img src="${root}/img/icon/person.svg">
							${userName}
							<a href="#" onClick="location.href='${root}/logout'"><i>로그아웃</i></a>
						</c:if>
						</form>
						
						<c:if test="${not empty userID}">
							<form method="post" action="${root}/user/mytables"
								class="nav-link text-body p-0">
								<input type="hidden" name="userName" value="${userName}" /> <input
									type="hidden" name="userRank" value="${userRank}" /> <input
									type="hidden" name="userID" value="${userID}" />
									<input type="submit" value="🦋">
							</form>
						</c:if>
					</div>
				</div>
			</div>
			<nav class="main__menu">
				<ul class="nav__menu">
					<li><a href="${root}/main" class="menu--active">Home</a></li>
					<li><a href="${root}/movielist">계봉예정작</a></li>
					
					<li><a href="${root}/list">공지사항</a></li>
				
					<li><a href="#">영화게시판</a>
						<ul class="sub__menu">
							<c:forEach var="mn" items="${menu}">
								<c:choose>
									<c:when test="${mn.boardid eq 2}">
										<li><a
											href="${root}/list?boardid=${mn.boardid}">${mn.boardName}
										</a></li>
									</c:when>
									<c:when test="${mn.boardid eq 3}">
										<li><a
											href="${root}/list?boardid=${mn.boardid}">${mn.boardName}
										</a></li>
									</c:when>
									<c:when test="${mn.boardid eq 4}">
										<li><a
											href="${root}/list?boardid=${mn.boardid}">${mn.boardName}
										</a></li>
									</c:when>
									<c:when test="${mn.boardid eq 5}">
										<li><a
											href="${root}/list?boardid=${mn.boardid}">${mn.boardName}
										</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
						</ul></li>
						
						<!-- admin 계정으로만 보임 -->
						<c:if  test="${sessionScope.userRank eq 'A'}">
						<li><a href="${root}/usertables">관리자전용</a></li>
						</c:if>
						<c:if  test="${!(sessionScope.userRank eq 'A')}"></c:if>
				</ul>
			</nav>
		</div>
	</header>
	<!-- Header Section end -->
</body>
</html>