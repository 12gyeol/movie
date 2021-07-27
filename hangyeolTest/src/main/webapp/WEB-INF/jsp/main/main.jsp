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
	<link rel="stylesheet" href="${root}/css/main/slick.css"/>
	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="${root}/css/main/style.css"/>


	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>	
<style>
	.cursorpointer{
	cursor: pointer;
	font-size: 50px;
	}

.modal1 {
	position: fixed;
	left: 0;
	top: 0;
	width: 80%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	opacity: 0;
	visibility: hidden;
	transform: scale(1.1);
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform
		0.25s;
}

.modal-content {
	position: absolute;
	top: 30%;
	left: 60%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 1rem 1.5rem;
	width: 800px;
	height: 500px;
	border-radius: 0.5rem;
}

.modal-content .trailer {
	width: 100%;
	position: relative;
}

.close-button {
	float: right;
	width: 1.5rem;
	line-height: 1.5rem;
	text-align: center;
	cursor: pointer;
	border-radius: 0.25rem;
	background-color: lightgray;
}

.close-button:hover {
	background-color: darkgray;
}
.show-modal {
	opacity: 1;
	visibility: visible;
	transform: scale(1.0);
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;
}
.slider{
border-style:none;
}
</style>
<body>
	<!-- header -->
	<c:import url="/etc/headerd"></c:import>

	<!-- Hero Section -->
	<section class="hero__section">
		<div class="hero-text-slider">
			<c:forEach var="list" items="${list}">
				<div class="text-item">
					<h2>${list.rank}</h2>
				</div>
				
			</c:forEach>
		</div>
		<div class="hero-slider">
			<c:forEach var="list" items="${list}" varStatus="t">
				<div class="slide-item">
					<button  class="slider" id="${t.count}" onclick=" toggleTrailer(this.id)" value="${list.midx}/${list.midx}_${list.idx}">
						<img src="${list.image}">
					</button>
				</div>
			</c:forEach>
		</div>

			<!-- 팝업 될 레이어 -->
		<div class="modal1">
			<div class="modal-content">
				<span class="close-button">&times;</span>
				<video id="trailer_id" class="trailer" src='' controls autoplay></video>
			</div>
		</div>
		
		<div class="hero-text-slider">
			<c:forEach var="list" items="${list}" varStatus="t">
				<div class="text-item cursorpointer">
					<a  onclick="location.href='${root}/rmd?midx=${list.midx}'">${list.title}</a>		
					<p>예매율 : ${list.percent}</p>
				</div>
			</c:forEach>
		</div>
	</section>
	<!-- Hero Section end -->

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
	
	<script type="text/javascript">
		const modal = document.querySelector(".modal1");
		const closeButton = document.querySelector(".close-button");
		const cancelButton = document.querySelector("#cancel");

		function toggleOpenClose() {
			modal.classList.toggle("show-modal");
		}

		function toggleTrailer(id) {
			const src = document.getElementById(id).value;
			const videosrc = document.getElementById('trailer_id');
			videosrc.setAttribute("src", "http://h.vod.cgv.co.kr/vodCGVa/"
					+ src + "_1200_128_960_540.mp4");
			modal.classList.toggle("show-modal");
		}

		function windowOnClick(event) {
			if (event.target === modal) {
				toggleOpenClose();
			}
		}

		closeButton.addEventListener("click", toggleOpenClose);
		window.addEventListener("click", windowOnClick);
	</script>

	<!--====== Javascripts & Jquery ======-->
	<script src="${root}/js/main/vendor/jquery-3.2.1.min.js"></script>
	<script src="${root}/js/main/jquery.slicknav.min.js"></script>
	<script src="${root}/js/main/slick.min.js"></script>
	<script src="${root}/js/main/fresco.min.js"></script>
	<script src="${root}/js/main/main.js"></script>
	
	</body>
</html>