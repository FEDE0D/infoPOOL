package com.tp.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tp.daos.UsuarioDAO;
import com.tp.uml.Usuario;

public class LoginAction extends ActionSupport implements ModelDriven<Usuario>{

	private static final long serialVersionUID = -6408892934194388617L;

	private Usuario usuario;
	private UsuarioDAO usuarioDAO;

	public LoginAction() {
		usuario = new Usuario();
	}
	
	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Usuario getModel() {
		return usuario;
	}

	/** LOGIN */
	
	public String login() throws Exception {
		Usuario login = usuarioDAO.match(usuario.getUsername(), usuario.getPassword()); 
		if ( login != null){
			if (login.isBaja()) return INPUT;
			ActionContext.getContext().getSession().put("user", login);
			return SUCCESS;
		}
		return INPUT;
		
	}
	
	/** LOGOUT */
	
	public String logout(){
		ActionContext.getContext().getSession().clear();
		//TODO con esto es suficiente?
		return SUCCESS;
	}

	public void validateLogin() {
		if (usuario.getUsername().isEmpty()) addFieldError("username", "El nombre de usuario no puede estar vacío");
		if (usuario.getPassword().isEmpty()) addFieldError("password", "La contraseña no puede estar vacía");
	}

	
	
	
}
