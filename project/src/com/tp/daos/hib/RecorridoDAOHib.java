package com.tp.daos.hib;

import com.tp.daos.RecorridoDAO;
import com.tp.uml.Recorrido;

public class RecorridoDAOHib extends GenericDAOHib<Recorrido> implements RecorridoDAO {

	public RecorridoDAOHib() {
		super(Recorrido.class);
	}
	
}
