package com.tp.daos.hib;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.tp.daos.GenericDAO;
import com.tp.datasource.EMF;

public class GenericDAOHib<T> implements GenericDAO<T> {

protected Class<T> persistentClass;
	
	public GenericDAOHib(Class<T> clase){
		this.persistentClass = clase;
	}
	
	public List<T> getAll(String columnOrder) {
		List<T> resultado = null;
		
		EntityManager em = EMF.getEMF().createEntityManager();
		Query consulta= em.createQuery("select e from " +this.persistentClass.getSimpleName()+ " e order by e. "+columnOrder);
		resultado = (List<T>) consulta.getResultList();
		em.close();
		
		return resultado;
	}

	public List<T> getActives(String columnOrder) {
		List<T> resultado = null;
		
		EntityManager em = EMF.getEMF().createEntityManager();
		Query consulta= em.createQuery("select e from " +this.persistentClass.getSimpleName()+ " e where (baja = false) order by e. "+columnOrder);
		resultado = (List<T>) consulta.getResultList();
		em.close();
		
		return resultado;
	}
	
	public List<T> getInactives(String columnOrder) {
		List<T> resultado = null;
		
		EntityManager em = EMF.getEMF().createEntityManager();
		Query consulta= em.createQuery("select e from " +this.persistentClass.getSimpleName()+ " e where (baja = true) order by e. "+columnOrder);
		resultado = (List<T>) consulta.getResultList();
		em.close();
		
		return resultado;
	}

	public boolean exists(Long id) {
		
		return getById(id) != null;
		
	}

	public T getById(Long id) {
		EntityManager em = EMF.getEMF().createEntityManager();
		return em.find(persistentClass, id);
	}

	public T create(T entity) {
		
		EntityManager em = EMF.getEMF().createEntityManager();
		EntityTransaction tx = null;
		try {
			tx = em.getTransaction();
			tx.begin();
			em.persist(entity);
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null && tx.isActive())
				tx.rollback();
			throw e; // escribir en un log o mostrar un mensaje
		} finally {
			em.close();
		}
		
		return entity;
		
	}

	public T update(T entity) {
		
		EntityManager em = EMF.getEMF().createEntityManager();
		EntityTransaction etx = em.getTransaction();
		etx.begin();
		em.merge(entity);
		etx.commit();
		return entity;
		
	}

	public T delete(Long id) {
		
		EntityManager em = EMF.getEMF().createEntityManager();
		EntityTransaction etx = em.getTransaction();
		etx.begin();
		//Query consulta= EMF.getEMF().createEntityManager().createQuery("select e from " +this.persistentClass.getSimpleName()+ " e where ( id = :id)");
		Query consulta= em.createQuery("update " +this.persistentClass.getSimpleName()+ " e set e.baja = true where ( id = :id)");
		consulta.setParameter("id", id);
		consulta.executeUpdate();
		
		em.flush();
		etx.commit();
		T entity = em.find(persistentClass, id);
		em.close();
		
		return entity;
	}
	
	
	public T recover(Long id) {
		
		EntityManager em = EMF.getEMF().createEntityManager();
		EntityTransaction etx = em.getTransaction();
		etx.begin();
		Query consulta= em.createQuery("update " +this.persistentClass.getSimpleName()+ " e set e.baja = false where ( id = :id)");
		consulta.setParameter("id", id);
		consulta.executeUpdate();
		
		em.flush();
		etx.commit();
		T entity = em.find(persistentClass, id);
		em.close();
		
		return entity;
	}
	
	public List<T> getByString(String columName, String value) {
        
		List<T> resultado = null;
	    EntityManager em = EMF.getEMF().createEntityManager();
		Query consulta= em.createQuery("select e from " +this.persistentClass.getSimpleName()+ " e where ( :columName = :value)");
		consulta.setParameter("columName", columName);
		consulta.setParameter("value", value);
		resultado = (List<T>) consulta.getResultList();
		em.close();
		
		return resultado;
	}

	
}