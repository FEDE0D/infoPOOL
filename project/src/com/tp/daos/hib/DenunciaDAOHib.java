package com.tp.daos.hib;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.tp.daos.DenunciaDAO;
import com.tp.datasource.EMF;
import com.tp.uml.Denuncia;

public class DenunciaDAOHib extends GenericDAOHib<Denuncia> implements DenunciaDAO {

	public DenunciaDAOHib() {
		super(Denuncia.class);
	}

	@Override
	public List<Denuncia> getDenunciasRecorridos() {
		
		List<Denuncia> resultado = null;
		
		EntityManager em = EMF.getEMF().createEntityManager();
		Query consulta= em.createQuery("select e from " +this.persistentClass.getSimpleName()+ " e where (recorrido_id > 0) order by e. id");
		resultado = (List<Denuncia>) consulta.getResultList();
		em.close();
		
		return resultado;
	}
	
}
