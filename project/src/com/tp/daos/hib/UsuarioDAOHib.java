package com.tp.daos.hib;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.mysql.jdbc.PreparedStatement;
import com.tp.daos.UsuarioDAO;
import com.tp.datasource.EMF;
import com.tp.uml.Evento;
import com.tp.uml.Propuesta;
import com.tp.uml.Recorrido;
import com.tp.uml.Usuario;

public class UsuarioDAOHib extends GenericDAOHib<Usuario> implements UsuarioDAO {

	public UsuarioDAOHib() {
		super(Usuario.class);
	}

	@Override
	public List<Evento> getMisEventos() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Recorrido> getMisRecorridos(Usuario viajero) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getPuntajeTotal(Usuario viajero) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Propuesta> getPropuestas(Usuario viajero) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Usuario match(String usuario, String password) {
		EntityManager em = EMF.getEMF().createEntityManager();
		Query query = em.createQuery("select e from "+this.persistentClass.getSimpleName()+" e where (username = :usuario) and (password = :pass)");
		query.setParameter("usuario", usuario);
		query.setParameter("pass", password);
		List<Usuario> resultado = query.getResultList();
		return resultado.isEmpty()? null : resultado.get(0);
	}
	
	
	
}