<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" >
		<title>login</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" href="i/favicon.png" type="image/x-icon">
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@100;200;300;400;500;600;700;800;900&family=DM+Sans:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
		<!-- Bootstrap 4.5.2 CSS -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		<!-- Slick 1.8.1 jQuery plugin CSS (Sliders) -->
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
		<!-- Fancybox 3 jQuery plugin CSS (Open images and video in popup) -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
		<!-- AOS 2.3.4 jQuery plugin CSS (Animations) -->
		<link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
		<!-- FontAwesome CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
		<!-- Startup CSS (Styles for all blocks) - Remove ".min" if you would edit a css code -->
				
				 <!-- root Route -->
		 <c:set var="root" value="${pageContext.request.contextPath}" />
		
		<link href="${root}/css/login/style.min.css" rel="stylesheet" />
		<!-- jQuery 3.5.1 -->
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		 
	</head> 
	<body>
<!-- Form 2 -->

<footer class="pt-70 pb-65 bg-light text-center footer_2">
			<div class="container px-xl-0">
				<div class="row justify-content-center">
					<div class="mt-20 col-12" data-aos="fade-down" data-aos-delay="250">
						<div class="color-heading text-adaptive">
						<a href="main"><img src="${root}/img/icon/house.svg" width="100"></a>		
						</div>
					</div>
				</div>
			</div>
		</footer>
		
	<section class="bg-light form_2">
		<div class="container px-xl-0">
			<div class="row justify-content-center text-center text-md-left">
				<div class="col-lg-5 col-md-6 col-sm-10">
					<form action="loginCheck" method="post" class="pt-105 pb-100">
						<h2 class="mb-45 small" data-aos="fade-down" data-aos-delay="0">
							Login
						</h2>
						<div data-aos="fade-down" data-aos-delay="0">
						</div>
						<div data-aos="fade-down" data-aos-delay="0">
							<div class="mb-10 f-14 semibold text-uppercase sp-20">
								ID
								<input type="text" id="id" name="id" placeholder="Your ID" required="required" value="<c:out value='${id}'/>" class="input mb-25 w-full lg border-gray focus-action-1 color-heading placeholder-gray text-center text-md-left">
							</div>
						</div>
						<div data-aos="fade-down" data-aos-delay="0">
							<div class="mb-10 f-14 semibold text-uppercase sp-20">
								Password
								<input type="password" id="pass" name="pass" placeholder="Your password" required="required" class="input mb-25 w-full lg border-gray focus-action-1 color-heading placeholder-gray text-center text-md-left">
							</div>
											<div>${ment}</div>
						</div>
						<div class="mt-25 d-flex flex-wrap align-items-center buttons" data-aos="fade-down" data-aos-delay="0">
							<button class="btn mr-20 mb-20 mb-xl-0 w-210 lg action-gray" type="submit">
								로그인
							</button>
							
							<button class="btn mr-20 mb-20 mb-xl-0 w-210 lg action-white" onclick="location.href='signup'" >
								회원가입	
							</button>
							<div class="color-heading text-adaptive">
								<label> <input type="checkbox" value="Y"
									<c:if test='${id !=null && id!=""}'>checked</c:if>>
									Remember me
								</label>
							</div>
						</div>
					</form>
				</div>
				<div class="col-sm-1">
				</div>
				<div class="col-lg-6 col-md-5 d-none d-md-block overflow-hidden img_holder" data-aos="fade-down" data-aos-delay="750">
					<img src="${root}/img/login/original.jpg" srcset="${root}/img/login/original.jpg 2x" alt="" class="h-full absolute">
				</div>
			</div>
		</div>
	</section>
	<!-- Footer 2 -->
		<footer class="pt-70 pb-65 bg-light text-center footer_2">
			<div class="container px-xl-0">
				<div class="row justify-content-center">
					<div class="col-12 lh-40" data-aos="fade-down" data-aos-delay="0">
						<a href="#" class="link color-main mx-20">
							Portfolio
						</a>
						<a href="#" class="link color-main mx-20">
							How it Works
						</a>
						<a href="#" class="link color-main mx-20">
							Pricing
						</a>
						<a href="#" class="link color-main mx-20">
							About
						</a>
						<a href="#" class="link color-main mx-20">
							Contacts
						</a>
					</div>
					<div class="mt-20 col-12" data-aos="fade-down" data-aos-delay="250">
						<div class="color-heading text-adaptive">
							Be sure to take a look at our Terms of Use and Privacy Policy
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- forms alerts -->
		<div class="alert alert-success alert-dismissible fixed-top alert-form-success" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			Thanks for your message!
		</div>
		<div class="alert alert-warning alert-dismissible fixed-top alert-form-check-fields" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			Please, fill in required fields.
		</div>
		<div class="alert alert-danger alert-dismissible fixed-top alert-form-error" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<div class="message">An error occurred while sending data :( Please, check if your hosting supports PHP and check how to set form data sending <a href="https://designmodo.com/startup/documentation/#form-handler" target="_blank" class="link color-transparent-white">here</a>.</div>
		</div>

		<!-- gReCaptcha popup (uncomment if you need a recaptcha integration) -->
		<!--
		<div class="bg-dark op-8 grecaptcha-overlay"></div>
		<div class="bg-light radius10 w-350 h-120 px-20 pt-20 pb-20 grecaptcha-popup">
			<div class="w-full h-full d-flex justify-content-center align-items-center">
				<div id="g-recaptcha" data-sitekey="PUT_YOUR_SITE_KEY_HERE"></div>
			</div>
		</div>
		<script src="https://www.google.com/recaptcha/api.js?render=explicit" async defer></script>
		-->
		<!-- Bootstrap 4.5.2 JS -->
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
		<!-- Fancybox 3 jQuery plugin JS (Open images and video in popup) -->
		<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
		<!-- 
			Google maps JS API 
			Don't forget to replace the key "AIzaSyDP6Ex5S03nvKZJZSvGXsEAi3X_tFkua4U" to your own!
			Learn how to get a key: https://help.designmodo.com/article/startup-google-maps-api/ 
		-->
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyDP6Ex5S03nvKZJZSvGXsEAi3X_tFkua4U"></script>
		<!-- Slick 1.8.1 jQuery plugin JS (Sliders) -->
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<!-- AOS 2.3.4 jQuery plugin JS (Animations) -->
		<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
		<!-- Maskedinput jQuery plugin JS (Masks for input fields) -->
		<script src="${root}/js/login/jquery.maskedinput.min.js"></script>
		<!-- Startup JS (Custom js for all blocks) -->
		<script src="${root}/js/login/script.js"></script>
	</body>
</html>