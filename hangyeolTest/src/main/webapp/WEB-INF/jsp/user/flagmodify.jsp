<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
  	<!-- root Route -->
	<c:set var="root" value="${pageContext.request.contextPath}" />
<head>
<meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <link rel="apple-touch-icon" sizes="76x76" href="${root}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${root}/assets/img/favicon.png">
  <title>
    Soft UI Dashboard by Creative Tim
  </title>

  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="${root}/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${root}/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="${root}/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${root}/css/soft-ui-dashboard.css?v=1.0.2" rel="stylesheet" />

<style>
table {
	margin-left: auto;
	margin-right: auto;
}
</style>

</head>
<body class="g-sidenav-show   bg-gray-100">

	<!-- header -->
	<jsp:include page="/WEB-INF/jsp/etc/header.jsp"></jsp:include>

		<c:forEach var="nt3"  items="${nt3}">
			

			<form action="${root}/CommentFlagSave" method="post">
				<table border="1">
					<tr>
						<td>
						유저 ${nt3.id} 를 댓글 쓸수있게 할래? <br />
						
						<label for="y">예</label>
						<input type="radio" name="cf" id="y" value="Y" <c:if test="${nt3.commentFlag eq 'Y'}"> checked </c:if>>
						
						<label for="n">아니요</label>
						<input type="radio" name="cf" id="n" value="N" <c:if test="${nt3.commentFlag eq 'N'}"> checked </c:if>>
						
						
						
						</td>
					</tr>
					<tr>
						<td>
						<input type="hidden" name="id" value="${nt3.id}">					
							<input type="submit" value="승인">
						</td>
					</tr>

				</table>
			</form>
		
		</c:forEach>
</body>
</html>