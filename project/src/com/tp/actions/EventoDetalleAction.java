package com.tp.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.tp.daos.EventoDAO;
import com.tp.uml.Evento;

public class EventoDetalleAction extends ActionSupport {

	private static final long serialVersionUID = -5214508085974246531L;
	
	private Long eventoId;
	private Evento evento = new Evento();
	private EventoDAO eventoDAO;
	
	public void setEventoDAO(EventoDAO eventoDAO) {
		this.eventoDAO = eventoDAO;
	}

	public String execute(){
		Evento e = eventoDAO.getById(eventoId);
		if (e != null){
			evento = e;
			return SUCCESS;
		}
		return ERROR;
	}
	
	public Evento getEvento(){
		return this.evento;
	}
	
	public Long getEventoId() {
		return eventoId;
	}

	public void setEventoId(Long eventoId) {
		this.eventoId = eventoId;
	}
	
	

}
