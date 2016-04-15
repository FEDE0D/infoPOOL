package com.tp.daos.hib;

import com.tp.daos.ComentarioDAO;
import com.tp.uml.Comentario;

public class ComentarioDAOHib extends GenericDAOHib<Comentario> implements ComentarioDAO{

	public ComentarioDAOHib() {
		super(Comentario.class);
	}
	
}
