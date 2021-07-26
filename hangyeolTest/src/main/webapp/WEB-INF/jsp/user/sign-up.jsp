<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
       <!-- root Route -->
   <c:set var="root" value="${pageContext.request.contextPath}" /> 
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    Soft UI Dashboard by Creative Tim
  </title>

   <!-- signup script -->
   <script type="text/javascript" src="${root}/js/user/signUp.js"></script>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="${root}/css/user/nucleo-icons.css" rel="stylesheet" />
  <link href="${root}/css/user/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${root}/css/user/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
 <link id="pagestyle" href="${root}/css/user/soft-ui-dashboard.css?v=1.0.2" rel="stylesheet" />
 
   
  <!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="${root}/css/user/bootstrap-datepicker.css">

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!--한국어  달력 쓰려면 추가 로드-->
<script src="${root}/js/user/bootstrap-datepicker.ko.min.js"></script> 


 
</head>

<body class="g-sidenav-show   bg-gray-100">
  <section class="h-100-vh mb-8">
  <video id="video" src="./img/sign-up/sign-up.mp4" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
</video>
      <div class="container">
        <div class="row">
          <div class="col-xl-4 col-lg-5 col-md-6 d-flex flex-column mx-auto">
            <div class="card card-plain mt-8">
              <div class="card-header pb-0 text-left bg-transparent">
                <h3 class="font-weight-bolder text-info text-gradient"><!-- 로그인 큰제목 --></h3>
                <p class="mb-0"><!-- 로그인 부제목 --></p>
              </div>
              <br>
               <div class="container">
      <div class="row mt-lg-n10 mt-md-n11 mt-n10">
        <div class="col-xl-4 col-lg-5 col-md-7 mx-auto">
      <h5>Sign UP</h5>
       </div>
       <br>
       <br>
       <br>
       <br>
              <div class="card-body">
              <form role="form text-left" id="joinform" name="joinform" action="registUser" method="post" onsubmit="return createFrom(this)">
               <!--  ID  -->
                <div class="mb-3">
                   <div>아이디</div>
                  <input type="text" class="form-control_a"  placeholder="ID" name="id" id="id" aria-label="ID" aria-describedby="ID"><button type="button" onclick="idCheck(joinform, '${root}')" class="btn btn-primary">중복체크</button>
                </div>
                 <!--  PASSWORD  -->
                <div class="mb-3">
                   <div>비밀번호</div>
                  <input type="password" class="form-control_b"  placeholder="Password" name="pass" id="password" aria-label="Password" aria-describedby="password-addon">
                </div>
                
                <!--  PASSWORD CHECK  -->
                <div class="mb-3">
                <div>비밀번호 재확인</div>
                  <input type="password" class="form-control_b" placeholder="CheckPassWord" id="passwordCheck" aria-label="Password" aria-describedby="password-addon">
                </div>
                
                <!--  이메일 입력  -->
                <div class="mb-3">
                <div>이메일</div>
                  <input type="email" class="form-control_b" placeholder="you@example.com" name="email" id="email" aria-label="email" aria-describedby="email-addon">
                </div>
                
                <!--  이름 입력  -->                
                <div class="mb-3">
                <div>이름</div>
                  <input type="text" class="form-control_b" placeholder="name" name="name" id="name" aria-label="name" aria-describedby="name">
                </div>
                
                <!--  생년월일 입력  -->
                <div class="mb-3">
                <div>생년월일</div>
                <input type="text" id="datePicker" name="birthday" class="form-control" value="2019-06-27">
                </div>
                
                <!--  성별 입력  -->
                <div class="mb-3">
                <div>성별</div>
                  <input class="form-radio-input" type="radio" value="1" name="gender" id="gender">
                  <label class="form-radio-label" >
                   남자
                  </label>
                   <input class="form-radio-input" type="radio" value="2" name="gender" id="gender">
                  <label class="form-radio-label" >
                   여자
                  </label>
                </div>        
                
                
                <div class="form-check form-check-info text-left">
                  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
                  <label class="form-check-label" for="flexCheckDefault">
                    I agree the <a href="javascript:;" class="text-dark font-weight-bolder">Terms and Conditions</a>
                  </label>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2">가입하기</button>
                </div>
                <p class="text-sm mt-3 mb-0">Already have an account? <a href="login" class="text-dark font-weight-bolder">로그인</a></p>
              </form>
            </div>
              <div class="card-footer text-center pt-0 px-lg-2 px-1">
              </div>
            </div>
          </div>
        </div>
      </div>
  </section>
  <!-- -------- START FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
  <footer class="footer py-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mb-4 mx-auto text-center">
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            Company
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            About Us
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            Team
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            Products
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            Blog
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            Pricing
          </a>
        </div>
        <div class="col-lg-8 mx-auto text-center mb-4 mt-2">
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-4 me-4">
            <span class="text-lg fab fa-dribbble"></span>
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-4 me-4">
            <span class="text-lg fab fa-twitter"></span>
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-4 me-4">
            <span class="text-lg fab fa-instagram"></span>
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-4 me-4">
            <span class="text-lg fab fa-pinterest"></span>
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-4 me-4">
            <span class="text-lg fab fa-github"></span>
          </a>
        </div>
      </div>
      <div class="row">
        <div class="col-8 mx-auto text-center mt-1">
          <p class="mb-0 text-secondary">
            Copyright Â© <script>
              document.write(new Date().getFullYear())
            </script> Soft by Creative Tim.
          </p>
        </div>
      </div>
    </div>
  </footer>
  <!-- -------- END FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
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