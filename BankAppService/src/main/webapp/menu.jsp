<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
    	<c:forEach items="${sessionScope.menus}" var="row">
    		<li><a href="${row.menuUrl}">${row.menuName}</a></li>
    	</c:forEach>
    	
    	<li><a href="logout">Logout</a></li>
    </ul>
  </div>
</nav>