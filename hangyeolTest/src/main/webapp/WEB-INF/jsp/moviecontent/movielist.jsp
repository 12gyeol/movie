<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="utf-8">
<head>
	<title>Movie</title>
	<meta charset="UTF-8">

		<!-- root Route -->
	<c:set var="root" value="${pageContext.request.contextPath}" />
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="${root}/css/main/bootstrap.min.css"/>
	<link rel="stylesheet" href="${root}/css/main/font-awesome.min.css"/>
	<link rel="stylesheet" href="${root}/css/main/slicknav.min.css"/>
	<link rel="stylesheet" href="${root}/css/main/fresco.css"/>
	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="${root}/css/main/style.css"/>
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<style type="text/css">
	.gallery__page{
	text-align: center;
	font-size: 30px;
	}
	.cursorpointer{
	cursor: pointer;
	}
	</style>
</head>
<body>
	<!-- header -->
	<c:import url="/etc/headerd"></c:import>
	
	<!-- About Page -->
	<div class="gallery__page">
		<div class="gallery__warp">
			<div class="row">
			 <c:forEach var="list" items="${list}">
				<div class="col-lg-3 col-md-4 col-sm-6 cursorpointer">
				<a>${list.dday}</a>
					<a onclick="location.href='${root}/nmd?midx=${list.midx}'">
						<img src="${list.image}" alt="">
						${list.title}
					</a>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
	<!-- About Page end -->

	<!-- Footer Section -->
	<footer class="footer__section">
		<div class="container">
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			<div class="footer__copyright__text">
				<p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
			</div>
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		</div>
	</footer>
	<!-- Footer Section end -->

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->

	<!--====== Javascripts & Jquery ======-->
	<script src="${root}/js/main/vendor/jquery-3.2.1.min.js"></script>
	<script src="${root}/js/main/jquery.slicknav.min.js"></script>
	<script src="${root}/js/main/slick.min.js"></script>
	<script src="${root}/js/main/fresco.min.js"></script>
	<script src="j${root}/js/main/main.js"></script>

	</body>
</html>
