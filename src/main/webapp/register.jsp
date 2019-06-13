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
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/register">Register
                        <span class="sr-only">(current)</span></a>
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
                    <div class="card-header">Register</div>
                    <div class="card-body">
                        <form:form method="POST" modelAttribute="userForm">
                            <spring:bind path="username">
                                <div class="form-group row">

                                    <label for="username" class="col-md-4 col-form-label text-md-right">Username</label>
                                    <div class="col-md-6">
                                        <form:input type="text" path="username" id="username" class="form-control" required="true" autofocus="true"></form:input>
                                    </div>
                                    <form:errors path="username"></form:errors>
                                </div>
                            </spring:bind>

                            <spring:bind path="password">
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                <div class="col-md-6">
                                    <form:input type="password" path="password" id="password" class="form-control" required="true"></form:input>
                                    <form:errors path="password"></form:errors>
                                </div>
                            </div>
                            </spring:bind>

                            <spring:bind path="passwordConfirm">
                                <div class="form-group row">
                                    <label for="passwordConfirm" class="col-md-4 col-form-label text-md-right">Confirm Password</label>
                                    <div class="col-md-6">
                                        <form:input type="password" path="passwordConfirm" id="passwordConfirm" class="form-control" required="true"></form:input>
                                        <form:errors path="passwordConfirm"></form:errors>
                                    </div>
                                </div>
                            </spring:bind>

                            <div class="row justify-content-center">
                                <button type="submit" class="btn btn-primary">
                                    Register
                                </button>
                            </div>
                    </div>
                    </form:form>
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