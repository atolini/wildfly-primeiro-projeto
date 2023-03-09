<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>Vendas Online App - Clientes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: rgb(40, 120, 185)">
        <a href="<%=request.getContextPath()%>/" class="navbar-brand"> Vendas App </a> </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/cliente" class="nav-link">Clientes</a></li>
            <li><a href="<%=request.getContextPath()%>/produto" class="nav-link">Produtos</a></li>
        </ul>
    </nav>
</header>

<br>

<div class="container col-md-10">
    <div class="container">
        <h3 class="text-center">Seja bem vindo!</h3>

       <a href="<%=request.getContextPath()%>/cliente" class="nav-link">Clientes</a>
       <a href="<%=request.getContextPath()%>/produto" class="nav-link">Produtos</a>
    </div>
</div>
</body>

</html>