package com.tp.daos.hib;

import com.tp.daos.PropuestaDAO;
import com.tp.uml.Propuesta;

public class PropuestaDAOHib extends GenericDAOHib<Propuesta> implements PropuestaDAO{

	public PropuestaDAOHib() {
		super(Propuesta.class);
	}
	
}
