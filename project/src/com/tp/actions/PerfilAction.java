package com.tp.actions;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tp.daos.DAOFactory;
import com.tp.uml.Mensaje;
import com.tp.uml.Usuario;

public class PerfilAction extends ActionSupport{

	private static final long serialVersionUID = -1688809068806580763L;
	
	
	private Usuario usuario;
	public Usuario getUsuario(){ return usuario; }
	
	private List<Mensaje> conversacion;
	public List<Mensaje> getConversacion(){ return conversacion; }
	
	public String ver(){
		
		Long id = Long.valueOf(ServletActionContext.getRequest().getParameter("uid"));
		usuario = DAOFactory.getUsuario().getById(id);
		
		if (usuario != null){
			Usuario log = (Usuario) ActionContext.getContext().getSession().get("user");
			if (log != null){
				conversacion = DAOFactory.getMensaje().getConversation(usuario, log);
				return SUCCESS;
			}			
		}
		return ERROR;
	}
	
	public void validateVer(){
		
		Object i = ServletActionContext.getRequest().getParameter("uid");
		if (i == null){
			this.addActionError("E: wrong parameter");
			return;
		}
		
		Long id = Long.valueOf(ServletActionContext.getRequest().getParameter("uid"));
		Usuario u = DAOFactory.getUsuario().getById(id);
		if (u == null) this.addActionError("E: el usuario no existe");
		
	}

	
	
}
