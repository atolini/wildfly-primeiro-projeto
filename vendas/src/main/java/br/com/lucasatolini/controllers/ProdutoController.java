package br.com.lucasatolini.controllers;

import br.com.lucasatolini.dao.interfaces.IProdutoDAO;
import br.com.lucasatolini.domain.Produto;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

public class ProdutoController extends HttpServlet {
    @EJB
    public IProdutoDAO produtoDAO;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/produto-form-new":
                    cadastrarProduto(request, response);
                    break;
                case "/produto-form-edit":
                    alterarProduto(request, response);
                    break;
                case "/produto-delete":
                    excluirProduto(request, response);
                    break;
                case "/produto-edit":
                    editarProduto(request, response);
                    break;
                case "/produto-form":
                    mostrarForm(request, response);
                    break;
                case "/produto":
                    listarProduto(request, response);
                    break;
            }
        } catch (SQLException ex) {
            response.sendRedirect("produto");
        }
    }

    public void mostrarForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("produto-form.jsp");
        dispatcher.forward(request, response);
    }

    public void listarProduto(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Produto> todosProdutos = (List<Produto>) this.produtoDAO.buscarTodos();
        request.setAttribute("todosProdutos", todosProdutos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("produto-lista.jsp");
        dispatcher.forward(request, response);
    }

    public void editarProduto(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Produto p = this.produtoDAO.buscar(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("produto-form.jsp");
        request.setAttribute("produto", p);
        dispatcher.forward(request, response);
    }

    public void excluirProduto(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Produto p = this.produtoDAO.buscar(id);
        this.produtoDAO.excluir(p);
        response.sendRedirect("produto");
    }

    public void alterarProduto(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String id = request.getParameter("id");
        if (id == null) {
            response.sendRedirect("cliente");
        }
        String nome = request.getParameter("nome");
        String codigo = request.getParameter("codigo");
        String descricao = request.getParameter("descricao");
        Double valor = Double.valueOf(request.getParameter("valor"));
        Produto p = new Produto(Long.valueOf(id), codigo, nome, descricao, BigDecimal.valueOf(valor));
        this.produtoDAO.alterar(p);
        response.sendRedirect("produto");
    }

    public void cadastrarProduto(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String nome = request.getParameter("nome");
        String codigo = request.getParameter("codigo");
        String descricao = request.getParameter("descricao");
        String valor = request.getParameter("valor");

        if (nome == null || codigo == null || descricao == null || valor == null) {
            response.sendRedirect("produto");
        }

        Produto p = new Produto(codigo, nome, descricao, BigDecimal.valueOf(Long.parseLong(valor)));
        this.produtoDAO.cadastrar(p);
        response.sendRedirect("produto");
    }
}
