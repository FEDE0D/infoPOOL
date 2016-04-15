package com.tp.actions;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tp.daos.DAOFactory;
import com.tp.uml.Mensaje;
import com.tp.uml.Usuario;

public class MensajeAction extends ActionSupport {

	private static final long serialVersionUID = 5914186134356014940L;
	
	private String emisor;
	private String receptor;
	private String contenido;
	
	public String getEmisor(){ return emisor; }
	public String getReceptor(){ return receptor; }
	public String getContenido(){ return contenido; }
	public void setEmisor(String emisor){ this.emisor = emisor; }
	public void setReceptor(String receptor){ this.receptor = receptor; }
	public void setContenido(String contenido){ this.contenido = contenido; }
	
	public String alta(){
		
		Mensaje m = new Mensaje();
		m.setEmisor((Usuario) ActionContext.getContext().getSession().get("user"));
		m.setReceptor(DAOFactory.getUsuario().getById(Long.valueOf(receptor)));
		m.setMensaje(contenido);
		m.setFecha(new Date(new java.util.Date().getTime()));
		m.setHora(new Time(new java.util.Date().getTime()));
		
		DAOFactory.getMensaje().create(m);
		
		return SUCCESS;
	}
	
	public String vistos(){
		
		Usuario u = (Usuario) ActionContext.getContext().getSession().get("user");
		List<Mensaje> mensajes = u.getMsg_recibidos();
		for (Mensaje m : mensajes){
			m.setVisto(true);
			DAOFactory.getMensaje().update(m);
		}
		
		return NONE;
	}

}
