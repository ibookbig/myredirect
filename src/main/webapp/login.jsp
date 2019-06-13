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
          <li class="nav-item">
            <a class="nav-link" href="/">Home
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Login
                <span class="sr-only">(current)</span>
            </a>
          </li>
            <li class="nav-item">
                <a class="nav-link" href="/register">Register</a>
            </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <div style="height:80px;"></div>

  <main class="login-form">
      <div class="cotainer">
          <div class="row justify-content-center">
              <div class="col-md-8">
                  <div class="card">
                      <div class="card-header">Login</div>
                      <div class="card-body">
                          <form action="${contextPath}/login" method="POST">
                              <div class="form-group row">
                                  <span>${message}</span>
                              </div>
                              <div class="form-group row">
                                  <label for="username" class="col-md-4 col-form-label text-md-right">Username</label>
                                  <div class="col-md-6">
                                      <input type="text" id="username" class="form-control" name="username" required autofocus>
                                  </div>
                              </div>
  
                              <div class="form-group row">
                                  <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                  <div class="col-md-6">
                                      <input type="password" id="password" class="form-control" name="password" required>
                                      <span>${error}</span>
                                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                  </div>
                              </div>
  
                              <div class="form-group row">
                                  <div class="col-md-6 offset-md-4">
                                      <div class="checkbox">
                                          <label>
                                              <input type="checkbox" name="remember"> Remember Me
                                          </label>
                                      </div>
                                  </div>
                              </div>
  
                              <div class="row justify-content-center">
                                  <button type="submit" class="btn btn-primary">
                                      Login
                                  </button> 
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