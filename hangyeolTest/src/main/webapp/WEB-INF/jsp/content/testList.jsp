<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  				<!--  검색 -->
				<form method="post">
				<div>
					<select name="f">
						<option ${(param.f=="title")?"selected":""} value="title">제목</option>
						<option ${(param.f=="writeid")?"selected":""} value="writeid">글쓴이</option>
					</select> <input type="text" name="q" /> <span><input type="submit" value="검색"></span>
				</div>
				</form>
				  <table border="1">
          <thead>
            <tr>
				<th>ID</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>등록일</th>
				<th>조회수</th>
            </tr>
          </thead>
          <tbody>
              <c:forEach var="li" items="${list}">
            <tr>
              <td>${li.id}</td>
              <td>${li.title}</td>
              <td>${li.writeid}</td>
              <td><fmt:formatDate pattern="yy/MM/dd/ hh:mm" value="${li.regdate}" /></td>
              <td>${li.hit}</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
</body>
</html>