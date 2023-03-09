<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>Vendas Online App - Produtos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: rgb(40, 120, 185)">
        <div> <a href="<%=request.getContextPath()%>/" class="navbar-brand"> Vendas App </a> </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/cliente" class="nav-link">Clientes</a></li>
            <li><a href="<%=request.getContextPath()%>/produto" class="nav-link">Produtos</a></li>
        </ul>
    </nav>
</header>

<br>

<div class="container col-md-10">
    <div class="container">
        <h3 class="text-center">Lista de Produtos</h3>
        <hr>
        <div>
            <a href="<%=request.getContextPath()%>/produto-form" class="btn btn-success">+ Novo Produto</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Codigo</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Valor</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${todosProdutos}">
                    <tr>
                        <td> <c:out value="${p.id}" /> </td>
                        <td> <c:out value="${p.codigo}" /> </td>
                        <td> <c:out value="${p.nome}" /> </td>
                        <td> <c:out value="${p.descricao}" /> </td>
                        <td> <c:out value="${p.valor}" /> </td>
                        <td> <a href="<%=request.getContextPath()%>/produto-edit?id=<c:out value='${p.id}' />">Alterar</a> </td>
                        <td> <a href="<%=request.getContextPath()%>/produto-delete?id=<c:out value='${p.id}' />">Excluir</a> </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>