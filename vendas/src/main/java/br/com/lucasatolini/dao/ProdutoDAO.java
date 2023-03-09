package br.com.lucasatolini.dao;

import br.com.lucasatolini.dao.interfaces.IProdutoDAO;
import br.com.lucasatolini.domain.Produto;
import jakarta.ejb.Stateless;

@Stateless
public class ProdutoDAO extends GenericDAO<Produto, Long> implements IProdutoDAO {
    public ProdutoDAO() {
        super.persistenteClass = Produto.class;
    }
}
