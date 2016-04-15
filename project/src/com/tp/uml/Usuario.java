package com.tp.uml;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.tp.daos.DAOFactory;

@Entity
public class Usuario {

	@Id @GeneratedValue
	private Long id;
	
	private boolean baja;
	
	private boolean bloquado;
	
	private boolean isAdministrador;
	
	private String username;
	
	private String password;
	
	private String email;
	
	private String foto_path;
	
	private String nombre;
	
	private String apellido;
	
	private String telefono;
	
	
	//LINK CON LAS OTRAS CLASES
	@OneToMany(mappedBy="creador")
	private List<Recorrido> recorridos;//recorridos creados por el usuario

	@OneToMany
	private List<Denuncia> denuncias;//denuncias hechas al usuario
	
//	@OneToMany
//	private List<Mensaje> mensajes;
//	
	@OneToMany(mappedBy="receptor")
	private List<Mensaje> msg_recibidos;
	
	@OneToMany (mappedBy="candidato")
	private List<Propuesta> propuestas;//propuestas hechas por el usuario
	
	@OneToMany
	private List<Evento> eventos;//eventos creados por el usuario

	@OneToMany
	private List<Comentario> comentarios;//comentarios hechos por el usuario
	
//	@OneToMany
//	private List<Calificacion> calificaciones;//calificaciones hechas al usuario
	
//	@OneToMany
//	private List<Calificacion> calificaciones_xmi;//calificaciones hechas por el usuario

	//FIXME Revisar ver Denuncia, lista de denuncias hechas por mi?
	
	public boolean isBaja() {
		return baja;
	}

	public void setBaja(boolean baja) {
		this.baja = baja;
	}

	public boolean isBloquado() {
		return bloquado;
	}

	public void setBloquado(boolean bloquado) {
		this.bloquado = bloquado;
	}

	public boolean isAdministrador() {
		return isAdministrador;
	}

	public void setAdministrador(boolean isAdministrador) {
		this.isAdministrador = isAdministrador;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFoto_path() {
		return foto_path;
	}

	public void setFoto_path(String foto_path) {
		this.foto_path = foto_path;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public List<Recorrido> getRecorridos() {
		return recorridos;
	}

	public void setRecorridos(List<Recorrido> recorridos) {
		this.recorridos = recorridos;
	}
	
	public List<Denuncia> getDenuncias() {
		return denuncias;
	}

	public void setDenuncias(List<Denuncia> denuncias) {
		this.denuncias = denuncias;
	}

//	public List<Mensaje> getMensajes() {
//		return mensajes;
//	}
//
//	public void setMensajes(List<Mensaje> mensajes) {
//		this.mensajes = mensajes;
//	}
//
	public List<Mensaje> getMsg_recibidos() {
		return msg_recibidos;
	}

	public void setMsg_recibidos(List<Mensaje> msg_recibidos) {
		this.msg_recibidos = msg_recibidos;
	}

	public List<Propuesta> getPropuestas() {
		return propuestas;
	}
	
	public List<Propuesta> getPropuestasHechasAMi(){
		List<Propuesta> propuestas = DAOFactory.getPropuesta().getAll("id");
		List<Propuesta> ami = new LinkedList<Propuesta>();
		for (Propuesta p : propuestas) if (p.getRecorrido().getCreador().getUsername().equals(this.getUsername())) ami.add(p);
		
		return ami;
	}

	public void setPropuestas(List<Propuesta> propuestas) {
		this.propuestas = propuestas;
	}

	public int getCalificacion(){
		int puntos = 0;
		
		for (Recorrido r : getRecorridos()){
			for (Calificacion c : r.getCalificaciones()){
				puntos += c.getPuntaje();
			}
		}
		
		return puntos;
	}
	
	public Long getId() {
		return id;
	}
	
}
