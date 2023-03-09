package br.com.lucasatolini.dao;

import br.com.lucasatolini.dao.interfaces.IGenericDAO;
import br.com.lucasatolini.domain.Persistence;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

@Stateless
public class GenericDAO<T extends Persistence, E extends Serializable> implements IGenericDAO<T, E> {
    @PersistenceContext
    private EntityManager entityManager;

    protected Class<T> persistenteClass;

    public GenericDAO() {}

    public T cadastrar(T entity) throws SQLException {
        entityManager.persist(entity);
        return entity;
    }

    public void excluir(T entity) throws SQLException {
        if (entityManager.contains(entity)) {
            entityManager.remove(entity);
        } else {
            T managedCustomer = entityManager.find(this.persistenteClass, entity.getId());
            if (managedCustomer != null) {
                entityManager.remove(managedCustomer);
            }
        }

    }

    public T alterar(T entity) throws SQLException {
        entity = entityManager.merge(entity);
        return entity;
    }

    public T buscar(E valor) throws SQLException {
        try {
            T entity = (T) entityManager.find(this.persistenteClass, valor);
            return entity;
        } catch (Exception e) {
            return null;
        }
    }

    public Collection<T> buscarTodos() throws SQLException {
        List<T> list =
                entityManager.createQuery(getSelectSql(), this.persistenteClass).getResultList();
        return list;
    }

    private String getSelectSql() {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT obj FROM ");
        sb.append(this.persistenteClass.getSimpleName());
        sb.append(" obj");
        return sb.toString();
    }
}