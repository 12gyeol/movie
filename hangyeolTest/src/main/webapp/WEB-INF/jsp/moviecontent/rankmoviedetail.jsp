<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="utf-8">
<head>
	<title>Movie</title>
		<!-- root Route -->
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<meta charset="UTF-8">
	<meta name="description" content="Boto Photo Studio HTML Template">
	<meta name="keywords" content="photo, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Stylesheets -->
	<link rel="stylesheet" href="${root}/css/main/bootstrap.min.css"/>
	<link rel="stylesheet" href="${root}/css/main/font-awesome.min.css"/>
	<link rel="stylesheet" href="${root}/css/main/slicknav.min.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="${root}/css/main/style.css"/>


	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<!-- header -->
	<c:import url="/etc/headerd"></c:import>
	<!-- Header Section end -->

	<!-- About Page -->
	<section class="about__page">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4">
					<div class="about__text">
						<h3 class="about__title">제목 : ${list.title}</h3>
							 <img src="${list.image}"> 
							<div class="about__meta__info">
							</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="experience__text">
						<h3 class="about__title">줄거리</h3>
						<div class="experience__item">
							<p>${list.content}</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="skills__text">
						<h3 class="about__title">영화정보</h3>
						<p>${list.spec}</p>
<!-- 						<div class="single-progress-item">
							<h6>Development</h6>
							<div class="progress-bar-style" data-progress="70"></div>
						</div>
						<div class="single-progress-item">
							<h6>APP Design</h6>
							<div class="progress-bar-style" data-progress="70"></div>
						</div>
						<div class="single-progress-item">
							<h6>Graphic Design</h6>
							<div class="progress-bar-style" data-progress="70"></div>
						</div>
						<div class="single-progress-item">
							<h6>Photography</h6>
							<div class="progress-bar-style" data-progress="70"></div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
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
	<script src="js/vendor/jquery-3.2.1.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/main.js"></script>

	</body>
</html>
