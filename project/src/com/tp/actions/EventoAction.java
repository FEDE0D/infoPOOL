package com.tp.actions;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tp.daos.EventoDAO;
import com.tp.uml.Evento;
import com.tp.uml.Usuario;

public class EventoAction extends ActionSupport implements ModelDriven<Evento>{

	private static final long serialVersionUID = 2386502557615552411L;
	
	private Long eventoId;
	private Evento evento = new Evento();
	private EventoDAO eventoDAO;
	
	
	public void setEventoDAO(EventoDAO eventoDAO) {
		this.eventoDAO = eventoDAO;
	}

	@Override
	public Evento getModel() {
		return evento;
	}
	
	public String execute(){
		Evento e = eventoDAO.getById(eventoId);
		if (e != null){
			evento = e;
			return SUCCESS;
		}
		return ERROR;
	}
	
	/* ALTA */
	
	
	public String alta(){
		evento.setCreador((Usuario)ActionContext.getContext().getSession().get("user"));
		Evento eventoNuevo = eventoDAO.create(evento);
		if (eventoNuevo != null){
			eventoId = evento.getId();
			return SUCCESS;
		}else
			return INPUT;
	}
	
	
	/* MODIFICACION */
	
	public String modificacion(){
		Evento eventoModificado = eventoDAO.getById(evento.getId() != null? evento.getId() : 0);
		if (eventoModificado != null){
			eventoDAO.update(evento);
			eventoId = evento.getId();
			return SUCCESS;
		}else
			return INPUT;
	}
	
	/* LISTADO */
	
	private List<Evento> eventos;
	public String listado(){
		this.eventos = eventoDAO.getAll("id");
		return SUCCESS;
	}
	
	public List<Evento> getEventos(){
		return this.eventos;
	}
	
	/* DETALLE */
	
	public String detalle(){
		Evento e = eventoDAO.getById(evento.getId() != null? evento.getId() : 0);
		if (e != null) return SUCCESS;
		else return ERROR;
	}

	public void validate() {}
	
	public void validateAlta(){
		
		Usuario user = (Usuario) ActionContext.getContext().getSession().get("user");
		if (user == null || !user.isAdministrador() ) this.addActionError("No posee permisos para realizar la operación");
		
		if (evento.getNombre().isEmpty()) addFieldError("nombre", "Ingrese un nombre para el evento");
		if (evento.getDescripcion().isEmpty()) addFieldError("descripcion", "Ingrese una descripción para el evento");
//		if (evento.getFecha() == null) addFieldError("fecha", "Por favor ingrese una fecha para el evento");
		//XXX Faltan validaciones
//		
//		if (evento.getNombre().isEmpty()) {
//			addFieldError("nombre",
//					"Por favor ingrese un nombre para el evento");
//		}
//
//		if (evento.getDireccion().isEmpty()) {
//			addFieldError("direccion",
//					"Por favor ingrese una direccion para el evento");
//		}
//
//		
//
//		if (evento.getDescripcion().isEmpty()) {
//			addFieldError("descripcion",
//					"Por favor ingrese una descripcion para el evento");
//		}
	}
	
	public void validateModificacion(){
		
		Usuario user = (Usuario) ActionContext.getContext().getSession().get("user");
		if (user == null || !user.isAdministrador() ) this.addActionError("No posee permisos para realizar la operación");
		
//		if (evento.getNombre().isEmpty()) addFieldError("nombre", "Ingrese un nombre para el evento");
//		if (evento.getDescripcion().isEmpty()) addFieldError("descripcion", "Ingrese una descripción para el evento");
		
	}
	
	public Long getEventoId(){
		return eventoId;
	}
	
	public void setEventoId(Long eventoId) {
		this.eventoId = eventoId;
	}

	Evento getEvento() {
		return evento;
	}

	EventoDAO getEventoDAO() {
		return eventoDAO;
	}
	
	
	
	
}
