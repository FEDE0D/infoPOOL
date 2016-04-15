package com.tp.actions;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tp.daos.DAOFactory;
import com.tp.uml.Denuncia;
import com.tp.uml.Usuario;

public class UserManager extends ActionSupport {

	private static final long serialVersionUID = -4617808210730127224L;
	
	public List<Denuncia> denuncias;
	public List<Denuncia> getDenuncias(){ return denuncias; }
	
	public String vUserManager(){
		denuncias = DAOFactory.getDenuncia().getDenunciasRecorridos();
		return SUCCESS;
	}
	
	public void validateVUserManager(){
		Usuario user = (Usuario) ActionContext.getContext().getSession().get("user");
		if (user == null || !user.isAdministrador() ) this.addActionError("No posee permisos para realizar la operación");
	}
	
	
	
	/**UserId para borrado*/
	public Long id;
	public void setId(Long id){ this.id = id; }
	
	public String aUserManagerDelete(){
		// TODO Validar usuario es administrador
		Usuario u = DAOFactory.getUsuario().getById(id);
		if (u!=null){
			u.setBaja(true);
			DAOFactory.getUsuario().update(u);
			// TODO Borrar sesión del usuario borrado?
		}
		return SUCCESS;
	}

}
