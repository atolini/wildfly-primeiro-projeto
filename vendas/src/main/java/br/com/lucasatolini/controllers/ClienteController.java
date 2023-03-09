package br.com.lucasatolini.controllers;

import br.com.lucasatolini.dao.interfaces.IClienteDAO;

import br.com.lucasatolini.domain.Cliente;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class ClienteController extends HttpServlet {
    @EJB
    public IClienteDAO clienteDAO;

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
                case "/cliente-form-new":
                    cadastrarCliente(request, response);
                    break;
                case "/cliente-form-edit":
                    alterarCliente(request, response);
                    break;
                case "/cliente-delete":
                    excluirCliente(request, response);
                    break;
                case "/cliente-edit":
                    editarCliente(request, response);
                    break;
                case "/cliente-form":
                    mostrarForm(request, response);
                    break;
                case "/cliente":
                    listarCliente(request, response);
                    break;
            }
        } catch (SQLException ex) {
            response.sendRedirect("cliente");
        }
    }

    public void mostrarForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("cliente-form.jsp");
        dispatcher.forward(request, response);
    }

    public void listarCliente(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Cliente> todosClientes = (List<Cliente>) this.clienteDAO.buscarTodos();
        request.setAttribute("todosClientes", todosClientes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cliente-lista.jsp");
        dispatcher.forward(request, response);
    }

    public void editarCliente(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Cliente c = this.clienteDAO.buscar(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cliente-form.jsp");
        request.setAttribute("cliente", c);
        dispatcher.forward(request, response);
    }

    public void excluirCliente(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Cliente c = this.clienteDAO.buscar(id);
        this.clienteDAO.excluir(c);
        response.sendRedirect("cliente");
    }

    public void alterarCliente(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String id = request.getParameter("id");
        if (id == null) {
            response.sendRedirect("cliente");
        }
        String nome = request.getParameter("nome");
        Long cpf = Long.parseLong(request.getParameter("cpf"));
        Long tel = Long.parseLong(request.getParameter("tel"));
        String end = request.getParameter("end");
        Integer numero = Integer.parseInt(request.getParameter("numero"));
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");

        Cliente c = new Cliente(Long.valueOf(id), nome, cpf, tel, end, numero, cidade, estado);
        this.clienteDAO.alterar(c);
        response.sendRedirect("cliente");
    }

    public void cadastrarCliente(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String tel = request.getParameter("tel");
        String end = request.getParameter("end");
        String numero = request.getParameter("numero");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");

        if (nome == null ||
                cpf == null ||
                tel == null ||
                end == null ||
                numero == null ||
                cidade == null ||
                estado == null) {
            response.sendRedirect("cliente");
        }

        Cliente c = new Cliente(nome, Long.parseLong(cpf), Long.valueOf(tel),
                end, Integer.valueOf(numero), cidade, estado);
        this.clienteDAO.cadastrar(c);
        response.sendRedirect("cliente");
    }
}
