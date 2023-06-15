<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit User</title>
</head>
<body>
<h2>Edit User</h2>
<form action="${pageContext.request.contextPath}/users/edit" method="post">
  <input type="hidden" name="id" value="${id}">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" value="${user.name}">
  <label for="age">Age:</label>
  <input type="text" id="age" name="age" value="${user.age}">
  <input type="submit" value="Save">
</form>
</body>
</html>
