<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shorten URL</title>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" >

</head>
<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
      <a class="navbar-brand" href="/">Shorten URL</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="/">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>


            <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name != null}">
              <li class="nav-item">
              <a class="nav-link">Logged in as ${pageContext.request.userPrincipal.name}</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/profile">My links</a>
              </li>
          <li class="nav-item">
              <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              </form>

              <a class="nav-link" onclick="document.forms['logoutForm'].submit()">Logout</a>
          </li>
            </c:when>
              <c:otherwise>
            <li class="nav-item">
                <a class="nav-link" href="/login">Login</a>

                </li>
          <li class="nav-item">
                <a class="nav-link" href="/register">Register</a>
          </li>
              </c:otherwise>
            </c:choose>

        </ul>
      </div>
    </div>
  </nav>
  
  <div style="height:80px;"></div>

  <main class="shorten-form">
    <div class="cotainer">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card">
            <div class="card-header">Shorten URL</div>
            <div class="card-body">
              <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-7">
                <h5>${message} <a href="${new_url}">${new_url}</a></h5>
                </div>
              </div>
              <form method="post" action="/shorten">
                <div class="form-group row">

                    <div class="col-md-2"></div>
                    <div class="col-md-7">
                      <input type="text" name="url" class="form-control" id="basic-url" placeholder="Shorten Your Link" value="https://">
                    </div>
                    <div class="col-md-1">
                      <input id="shorten_btn" class="btn btn-primary" type="submit" value="Shorten">
                    </div>

                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

	<script src="assets/js/jquery-3.4.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>