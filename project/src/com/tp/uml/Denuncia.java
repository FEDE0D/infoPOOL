package com.tp.uml;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Denuncia {

	@Id @GeneratedValue
	private Long id;
	
	private boolean baja;
	
	@ManyToOne
	private Usuario denunciante;//FIXME Revisar ver Usuario
	
	private String motivo;
	
	private Date fecha;
	
	private Time hora;
	
	private boolean visto;
	
	
	//LINK CON LAS OTRAS CLASES
	@ManyToOne
	private Comentario comentario;
	
	@ManyToOne
	private Usuario usuario;
	
	@ManyToOne
	private Recorrido recorrido;
	
	
	public boolean isBaja() {
		return baja;
	}

	public void setBaja(boolean baja) {
		this.baja = baja;
	}

	public Usuario getDenunciante() {
		return denunciante;
	}

	public void setDenunciante(Usuario denunciante) {
		this.denunciante = denunciante;
	}

	public String getMotivo() {
		return motivo;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Time getHora() {
		return hora;
	}

	public void setHora(Time hora) {
		this.hora = hora;
	}

	public boolean isVisto() {
		return visto;
	}

	public void setVisto(boolean visto) {
		this.visto = visto;
	}

	public Comentario getComentario() {
		return comentario;
	}

	public void setComentario(Comentario comentario) {
		this.comentario = comentario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Recorrido getRecorrido() {
		return recorrido;
	}

	public void setRecorrido(Recorrido recorrido) {
		this.recorrido = recorrido;
	}

	public Long getId() {
		return id;
	}
	
}
