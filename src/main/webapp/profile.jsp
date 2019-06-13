<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <c:if test="${pageContext.request.userPrincipal.name != null}">
            <li class="nav-item">
              <a class="nav-link">Logged in as ${pageContext.request.userPrincipal.name}</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="/profile">My links
                <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
              </form>

              <a class="nav-link" onclick="document.forms['logoutForm'].submit()">Logout</a>
            </li>
          </c:if>
        </ul>
      </div>
    </div>
  </nav>
  
  <div style="height:80px;"></div>

  <main class="table-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                  <div class="card-header">Url Click Count</div>
                  <div class="card-body">
                    <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">#</th>
                        <th scope="col">Shorten Url</th>
                        <th scope="col">Full Url</th>
                        <th scope="col">Count</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="link" items="${links}" varStatus="loop">
                      <tr>
                        <th scope="row">${loop.index + 1}</th>
                        <td><a href="/l/${link.name}">/l/${link.name}</a></td>
                        <td><a href="${link.url}">${link.url}</a></td>
                        <td>${link.count}</td>
                      </tr>
                    </c:forEach>
                    </tbody>
                    </table>
                  </div>
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