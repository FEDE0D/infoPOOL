package com.tp.daos.hib;

import com.tp.daos.DiaDAO;
import com.tp.uml.Dia;

public class DiaDAOHib extends GenericDAOHib<Dia> implements DiaDAO{

	public DiaDAOHib() {
		super(Dia.class);
	}
	
}
