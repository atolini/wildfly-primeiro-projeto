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

<div class="container col-md-5">
    <div>
        <a href="<%=request.getContextPath()%>/cliente" class="btn btn-success">⮐ Voltar</a>
    </div>
    <br>
    <div class="card">
        <div class="card-body">
            <c:if test="${cliente != null}">
                <form action="<%=request.getContextPath()%>/cliente-form-edit" method="post">
                </c:if>
                <c:if test="${cliente == null}">
                    <form action="<%=request.getContextPath()%>/cliente-form-new" method="post">
                    </c:if>

                    <caption>
                        <h2>
                            <c:if test="${cliente != null}">
                                Alterar Cliente
                            </c:if>
                            <c:if test="${cliente == null}">
                                Novo Cliente
                            </c:if>
                        </h2>
                    </caption>

                    <c:if test="${cliente != null}">
                        <input type="hidden" name="id" value="<c:out value='${cliente.id}' />" />
                    </c:if>

                    <fieldset class="form-group">
                        <label>Nome</label> <input type="text" value="<c:out value='${cliente.nome}' />" class="form-control" name="nome" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>CPF</label> <input type="text" pattern="\w{11,11}" value="<c:out value='${cliente.cpf}' />" class="form-control" name="cpf">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Tel</label> <input type="text" value="<c:out value='${cliente.tel}' />" class="form-control" name="tel">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Endereço</label> <input type="text" value="<c:out value='${cliente.end}' />" class="form-control" name="end">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Número</label> <input type="text" value="<c:out value='${cliente.numero}' />" class="form-control" name="numero">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Cidade</label> <input type="text" value="<c:out value='${cliente.cidade}' />" class="form-control" name="cidade">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Estado</label> <input type="text" value="<c:out value='${cliente.estado}' />" class="form-control" name="estado">
                    </fieldset>

                    <button type="submit" class="btn btn-success">Salvar</button>
                </form>
        </div>
    </div>
</div>
</body>

</html>