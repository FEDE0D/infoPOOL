package com.tp.uml;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Recorrido {

	@Id
	@GeneratedValue
	private Long id;

	private boolean baja;

	@ManyToOne
	private Usuario creador;

	@ManyToOne
	private Evento evento;

	@OneToMany(mappedBy = "recorrido", fetch = FetchType.EAGER)
	private List<Dia> periodicidad;

	private String direccion_desde;

	private String direccion_hasta;

	private int total_asientos;

	private Date fecha_inicio;

	private Date fecha_fin;

	private String desdePosition;
	private String hastaPosition;

	// LINK CON LAS OTRAS CLASES
	@ManyToMany
	private List<Usuario> participantes;

	@OneToMany
	private List<Propuesta> propuestas;

	@OneToMany(mappedBy = "recorrido")
	private List<Comentario> comentarios;

	@OneToMany(mappedBy="recorrido")
	private List<Calificacion> calificaciones;

	@OneToMany
	private List<Denuncia> denuncias;

	public Recorrido() {
		periodicidad = new LinkedList<Dia>();
		participantes = new LinkedList<Usuario>();
		propuestas = new LinkedList<Propuesta>();
		comentarios = new LinkedList<Comentario>();
		calificaciones = new LinkedList<Calificacion>();
		denuncias = new LinkedList<Denuncia>();
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

	public Evento getEvento() {
		return evento;
	}

	public void setEvento(Evento evento) {
		this.evento = evento;
	}

	public List<Dia> getPeriodicidad() {
		return periodicidad;
	}

	public void setPeriodicidad(List<Dia> periodicidad) {
		this.periodicidad = periodicidad;
	}

	public String getDireccion_desde() {
		return direccion_desde;
	}

	public void setDireccion_desde(String direccion_desde) {
		this.direccion_desde = direccion_desde;
	}

	public String getDireccion_hasta() {
		return direccion_hasta;
	}

	public void setDireccion_hasta(String direccion_hasta) {
		this.direccion_hasta = direccion_hasta;
	}

	public int getTotal_asientos() {
		return total_asientos;
	}

	public void setTotal_asientos(int total_asientos) {
		this.total_asientos = total_asientos;
	}

	public Date getFecha_inicio() {
		return fecha_inicio;
	}

	public void setFecha_inicio(Date fecha_inicio) {
		this.fecha_inicio = fecha_inicio;
	}

	public Date getFecha_fin() {
		return fecha_fin;
	}

	public void setFecha_fin(Date fecha_fin) {
		this.fecha_fin = fecha_fin;
	}

	public String getDesdePosition() {
		return desdePosition;
	}

	public void setDesdePosition(String desdePosition) {
		this.desdePosition = desdePosition;
	}

	public String getHastaPosition() {
		return hastaPosition;
	}

	public void setHastaPosition(String hastaPosition) {
		this.hastaPosition = hastaPosition;
	}

	public List<Usuario> getParticipantes() {
		return participantes;
	}

	public void setParticipantes(List<Usuario> participantes) {
		this.participantes = participantes;
	}

	public List<Propuesta> getPropuestas() {
		return propuestas;
	}

	public void setPropuestas(List<Propuesta> propuestas) {
		this.propuestas = propuestas;
	}

	public List<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}

	public List<Calificacion> getCalificaciones() {
		return calificaciones;
	}

	public void setCalificaciones(List<Calificacion> calificaciones) {
		this.calificaciones = calificaciones;
	}

	public List<Denuncia> getDenuncias() {
		return denuncias;
	}

	public void setDenuncias(List<Denuncia> denuncias) {
		this.denuncias = denuncias;
	}

	public Long getId() {
		return id;
	}

	public Boolean isPuntual() {
		return periodicidad.get(0).getFecha() != null;
	}

	public Boolean tieneEvento() {
		return evento != null;
	}
	
	public int getAsientosDisponibles(){
		return total_asientos - this.getParticipantes().size();
	}

}
