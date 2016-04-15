package com.tp.daos.hib;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.tp.daos.MensajeDAO;
import com.tp.datasource.EMF;
import com.tp.uml.Mensaje;
import com.tp.uml.Usuario;

public class MensajeDAOHib extends GenericDAOHib<Mensaje> implements MensajeDAO{

	public MensajeDAOHib() {
		super(Mensaje.class);
	}

	@Override
	public List<Mensaje> getConversation(Usuario from, Usuario to) {
		
		List<Mensaje> resultado = null;
		
		EntityManager em = EMF.getEMF().createEntityManager();
		Query consulta= em.createQuery("select e from " +this.persistentClass.getSimpleName()+ " e where ((emisor_id = "+from.getId()+" and receptor_id="+to.getId()+") or (emisor_id = "+to.getId()+" and receptor_id = "+from.getId()+")) order by e. fecha, hora");
		resultado = (List<Mensaje>) consulta.getResultList();
		em.close();
		
		return resultado;
	}

	@Override
	public List<Mensaje> getMyConversations(Usuario u) {
		return new LinkedList<Mensaje>();
	}
		
}
