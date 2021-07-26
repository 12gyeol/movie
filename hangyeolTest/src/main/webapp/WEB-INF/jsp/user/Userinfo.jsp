<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
	<c:forEach var="l1" items="${l1}">
		<tr>
			<td>ID</td>
			<td>${l1.id}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${l1.name}</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>${l1.regdate}</td>
		</tr>
		<tr>
			<td>등급</td>
			<td>${l1.rank}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
