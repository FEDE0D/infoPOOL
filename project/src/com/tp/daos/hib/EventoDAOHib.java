package com.tp.daos.hib;

import com.tp.daos.EventoDAO;
import com.tp.uml.Evento;

public class EventoDAOHib extends GenericDAOHib<Evento> implements EventoDAO{

	public EventoDAOHib() {
		super(Evento.class);
	}
	
}
