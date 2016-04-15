package com.tp.uml;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Calificacion {
	
	@Id @GeneratedValue
	private Long id;
	
	private boolean baja;
	
	@ManyToOne
	private Recorrido recorrido;
	
	@ManyToOne
	private Usuario calificador;
	
	@ManyToOne
	private Usuario calificado;
	
	private int puntaje;
	
	public boolean isBaja() {
		return baja;
	}

	public void setBaja(boolean baja) {
		this.baja = baja;
	}

	public Recorrido getRecorrido() {
		return recorrido;
	}

	public void setRecorrido(Recorrido recorrido) {
		this.recorrido = recorrido;
	}

	public Usuario getCalificador() {
		return calificador;
	}

	public void setCalificador(Usuario calificador) {
		this.calificador = calificador;
	}

	public Usuario getCalificado() {
		return calificado;
	}

	public void setCalificado(Usuario calificado) {
		this.calificado = calificado;
	}

	public int getPuntaje() {
		return puntaje;
	}

	public void setPuntaje(int puntaje) {
		this.puntaje = puntaje;
	}

	public Long getId() {
		return id;
	}
	
}
