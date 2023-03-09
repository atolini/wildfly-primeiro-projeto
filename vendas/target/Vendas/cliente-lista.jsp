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
        <h3 class="text-center">Lista de Clientes</h3>
        <hr>
        <div>
            <a href="<%=request.getContextPath()%>/cliente-form" class="btn btn-success">+ Novo Cliente</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Tel</th>
                    <th>Endereço</th>
                    <th>Número</th>
                    <th>Cidade</th>
                    <th>Estado</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${todosClientes}">
                    <tr>
                        <td> <c:out value="${c.id}" /> </td>
                        <td> <c:out value="${c.nome}" /> </td>
                        <td> <c:out value="${c.cpf}" /> </td>
                        <td> <c:out value="${c.tel}" /> </td>
                        <td> <c:out value="${c.end}" /> </td>
                        <td> <c:out value="${c.numero}" /> </td>
                        <td> <c:out value="${c.cidade}" /> </td>
                        <td> <c:out value="${c.estado}" /> </td>
                        <td> <a href="<%=request.getContextPath()%>/cliente-edit?id=<c:out value='${c.id}' />">Alterar</a> </td>
                        <td> <a href="<%=request.getContextPath()%>/cliente-delete?id=<c:out value='${c.id}' />">Excluir</a> </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>