package com.tp.daos.hib;

import com.tp.daos.CalificacionDAO;
import com.tp.uml.Calificacion;

public class CalificacionDAOHib extends GenericDAOHib<Calificacion> implements CalificacionDAO{

	public CalificacionDAOHib() {
		super(Calificacion.class);
	}

	
	
	
}
