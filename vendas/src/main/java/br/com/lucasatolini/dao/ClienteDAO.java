package br.com.lucasatolini.dao;

import br.com.lucasatolini.dao.interfaces.IClienteDAO;
import br.com.lucasatolini.domain.Cliente;
import jakarta.ejb.Stateless;

@Stateless
public class ClienteDAO extends GenericDAO<Cliente, Long> implements IClienteDAO {
    public ClienteDAO() {
        super.persistenteClass = Cliente.class;
    }
}
