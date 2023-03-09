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

<div class="container col-md-5">
    <div>
        <a href="<%=request.getContextPath()%>/produto" class="btn btn-success">⮐ Voltar</a>
    </div>
    <br>
    <div class="card">
        <div class="card-body">
            <c:if test="${produto != null}">
                <form action="<%=request.getContextPath()%>/produto-form-edit" method="post">
                </c:if>
                <c:if test="${produto == null}">
                    <form action="<%=request.getContextPath()%>/produto-form-new" method="post">
                    </c:if>

                    <caption>
                        <h2>
                            <c:if test="${produto != null}">
                                Alterar Produto
                            </c:if>
                            <c:if test="${produto == null}">
                                Novo Produto
                            </c:if>
                        </h2>
                    </caption>

                    <c:if test="${produto != null}">
                        <input type="hidden" name="id" value="<c:out value='${produto.id}' />" />
                    </c:if>

                    <fieldset class="form-group">
                        <label>Nome</label> <input type="text" value="<c:out value='${produto.nome}' />" class="form-control" name="nome" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Código</label> <input type="text" value="<c:out value='${produto.codigo}' />" class="form-control" name="codigo">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Descrição</label> <input type="text" value="<c:out value='${produto.descricao}' />" class="form-control" name="descricao">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Valor</label> <input type="text" value="<c:out value='${produto.valor}' />" class="form-control" name="valor">
                    </fieldset>

                    <button type="submit" class="btn btn-success">Salvar</button>
                </form>
        </div>
    </div>
</div>
</body>

</html>