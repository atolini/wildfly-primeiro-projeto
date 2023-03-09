package br.com.lucasatolini.dao.interfaces;

import br.com.lucasatolini.domain.Persistence;
import jakarta.ejb.Local;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Collection;

@Local
public interface IGenericDAO <T extends Persistence, E extends Serializable> {
    public T cadastrar(T entity) throws SQLException;
    public void excluir(T entity) throws SQLException;
    public T alterar(T entity) throws SQLException;
    public T buscar(E value) throws SQLException;
    public Collection<T> buscarTodos() throws SQLException;
}