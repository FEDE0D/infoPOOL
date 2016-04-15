package com.tp.actions;

import java.sql.Date;
import java.sql.Time;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tp.daos.DAOFactory;
import com.tp.daos.PropuestaDAO;
import com.tp.uml.Mensaje;
import com.tp.uml.Propuesta;
import com.tp.uml.Recorrido;
import com.tp.uml.Usuario;

public class PropuestaAction extends ActionSupport implements ModelDriven<Propuesta>{


	private static final long serialVersionUID = -3406040752542869174L;
	
	private Propuesta propuesta = new Propuesta();
	private PropuestaDAO propuestaDAO;
	
	
	public void setPropuestaDAO(PropuestaDAO propuestaDAO) {
		this.propuestaDAO = propuestaDAO;
	}

	@Override
	public Propuesta getModel() {
		return propuesta;
	}
	
	/* ALTA */
	
	public String alta(){
		propuesta.setCandidato((Usuario)ActionContext.getContext().getSession().get("user"));
		String recId = ServletActionContext.getRequest().getParameter("recorrido_id");
		if (recId == null) recId = "-1";
		Recorrido recorridoProp = DAOFactory.getRecorrido().getById(Long.valueOf(recId));
		propuesta.setRecorrido(recorridoProp);
		propuestaDAO.create(propuesta);
		
		return SUCCESS;
//		evento.setCreador((Usuario)ActionContext.getContext().getSession().get("user"));
//		Evento eventoNuevo = eventoDAO.create(evento);
//		if (eventoNuevo != null){
//			eventoId = evento.getId();
//			return SUCCESS;
//		}else
//			return INPUT;
	}
	

	/* ACEPTAR */
	
	public String aceptar(){
		
		String id = ServletActionContext.getRequest().getParameter("id"); if (id == null) id = "-1";
		Propuesta propuesta = propuestaDAO.getById(Long.valueOf(id));
		
		propuesta.setVisto(true);
		propuesta.setAprobado(true);
		
		Mensaje mensaje = new Mensaje();
		mensaje.setEmisor((Usuario)ActionContext.getContext().getSession().get("user"));
		mensaje.setReceptor(propuesta.getCandidato());
		mensaje.setFecha(new Date(new java.util.Date().getTime()));
		mensaje.setHora(new Time(new java.util.Date().getTime()));
		mensaje.setMensaje("Su propuesta al recorrido fue aceptada :)");
		
		DAOFactory.getMensaje().create(mensaje);
		propuesta.getCandidato().getMsg_recibidos().add(mensaje);
		
		propuesta.getRecorrido().getParticipantes().add(propuesta.getCandidato());
		propuesta = propuestaDAO.update(propuesta);
		DAOFactory.getRecorrido().update(propuesta.getRecorrido());
		
		return SUCCESS;
		
	}
	
	/* CANCELAR */
	
	public String cancelar(){
		
		String id = ServletActionContext.getRequest().getParameter("id"); if (id == null) id = "-1";
		Propuesta propuesta = propuestaDAO.getById(Long.valueOf(id));
		
		propuesta.setVisto(true);
		propuesta.setAprobado(false);
		
		Mensaje mensaje = new Mensaje();
		mensaje.setEmisor((Usuario)ActionContext.getContext().getSession().get("user"));
		mensaje.setReceptor(propuesta.getCandidato());
		mensaje.setFecha(new Date(new java.util.Date().getTime()));
		mensaje.setHora(new Time(new java.util.Date().getTime()));
		mensaje.setMensaje("Su propuesta al recorrido fue rechazada :(");
		DAOFactory.getMensaje().create(mensaje);
		
		propuesta = propuestaDAO.update(propuesta);
		
		return SUCCESS;
	}
	

	public void validate() {}
	
	public void validateAlta(){
		
		Usuario user = (Usuario) ActionContext.getContext().getSession().get("user");
		if (user == null || user.isAdministrador() ) this.addActionError("No posee permisos para realizar la operación");
		
	}
	
	
}
