package com.tp.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tp.daos.UsuarioDAO;
import com.tp.uml.Usuario;

public class RegisterAction extends ActionSupport implements ModelDriven<Usuario> {

	private static final long serialVersionUID = 5562522260254529991L;
	
	private Usuario usuario = new Usuario();
	private String password2;
	private UsuarioDAO usuarioDAO;
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}

	@Override
	public Usuario getModel() {
		return usuario;
	}
	
	public String getPassword2() {
		return password2;
	}
	
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
	public String execute() throws Exception {
		if (usuarioDAO.getByString("username", usuario.getUsername()).size() == 0) {
			usuarioDAO.create(usuario);
			// login
			return SUCCESS;
		} else {
			addFieldError("username", "El nombre de usuario se encuentra en uso");
			return INPUT;
		}

	}

	
	public boolean isValidEmailAddress(String email) {
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);
        return m.matches();
 }
	
	
	
	public void validate() {
		
		if (usuario.getUsername().isEmpty()) {
			addFieldError("username", "El nombre de usuario es obligatorio");
			return;
		}
		if ((usuario.getUsername().length() > 20)||(usuario.getUsername().length() < 5)) {
			addFieldError("username", "El nombre de usuario debe contener entre 5 y 20 caracteres");
			return;
		}
		if (usuario.getPassword().isEmpty()) {
			addFieldError("password", "La contraseña es obligatoria");
			return;
		}
		if (!usuario.getPassword().equals(getPassword2())) {
			addFieldError("password", "Las contraseñas deben ser iguales");
			return;
		}
		if (usuario.getEmail().isEmpty()) {
			addFieldError("email", "El email es obligatorio");
			return;
		}
		if(!isValidEmailAddress(usuario.getEmail())){
			addFieldError("email", "Formato invalido");
			return;
		}
		if (usuario.getApellido().isEmpty()) {
			addFieldError("apellido", "El apellido es obligatorio");
			return;
		}
		if ((usuario.getApellido().length() > 50)) {
			addFieldError("apellido", "El apellido no puede superar los 50 caracteres");
			return;
		}
		if (usuario.getNombre().isEmpty()) {
			addFieldError("nombre", "El nombre es obligatorio");
			return;
		}
		if (usuario.getNombre().length() > 50) {
			addFieldError("nombre", "El nombre no puede superar los 50 caracteres");
			return;
		}
	}
}
