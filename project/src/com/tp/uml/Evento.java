package com.tp.uml;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
public class Evento {
	//asdsadsadasd
	@Id @GeneratedValue
	private Long id;
	
	private boolean baja;
	
	@ManyToOne
	private Usuario creador;
	
	private String nombre;
	
	private String descripcion;
	
	private String direccion;
	
	private String mapPosition;
	
	private String fecha;
	
	private String hora;
	
	
	//LINK CON LAS OTRAS CLASES
	@OneToMany(mappedBy="evento") @LazyCollection(LazyCollectionOption.FALSE)
	private List<Recorrido> recorridos;
	
	@OneToMany(mappedBy="evento") @LazyCollection(LazyCollectionOption.FALSE)
	private List<Comentario> comenarios;
	
	public Evento(){
		recorridos = new LinkedList<Recorrido>();
		comenarios = new LinkedList<Comentario>();
	}
	
	public boolean isBaja() {
		return baja;
	}

	public void setBaja(boolean baja) {
		this.baja = baja;
	}

	public Usuario getCreador() {
		return creador;
	}

	public void setCreador(Usuario creador) {
		this.creador = creador;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getMapPosition() {
		return mapPosition;
	}

	public void setMapPosition(String mapPosition) {
		this.mapPosition = mapPosition;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public List<Recorrido> getRecorridos() {
		return recorridos;
	}

	public void setRecorridos(List<Recorrido> recorridos) {
		this.recorridos = recorridos;
	}

	public List<Comentario> getComenarios() {
		return comenarios;
	}

	public void setComenarios(List<Comentario> comenarios) {
		this.comenarios = comenarios;
	}

	public Long getId() {
		return id;
	}
	
}
