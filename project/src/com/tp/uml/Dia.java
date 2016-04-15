package com.tp.uml;

import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Dia {

	public enum DiaSemana{DOMINGO, LUNES, MARTES, MIERCOLES, JUEVES, VIERNES, SABADO};
	
	@Id @GeneratedValue
	private Long id;
	
	@ManyToOne
	private Recorrido recorrido;
	
	private DiaSemana dia;
	
	private Date fecha;
	
	private Time hora_ida;
	
	private Time hora_vuelta;
	
	
	
	public Recorrido getRecorrido() {
		return recorrido;
	}

	public void setRecorrido(Recorrido recorrido) {
		this.recorrido = recorrido;
	}

	public DiaSemana getDia() {
		return dia;
	}

	public void setDia(DiaSemana dia) {
		this.dia = dia;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Time getHora_ida() {
		return hora_ida;
	}

	public void setHora_ida(Time hora_ida) {
		this.hora_ida = hora_ida;
	}

	public Time getHora_vuelta() {
		return hora_vuelta;
	}

	public void setHora_vuelta(Time hora_vuelta) {
		this.hora_vuelta = hora_vuelta;
	}

	public Long getId() {
		return id;
	}
	
	
	public String getFechaBrowser(){
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(fecha);
	}
	
	public String getHora_idaBrowser(){
		DateFormat df = new SimpleDateFormat("HH:mm");
		return df.format(hora_ida);
	}
	
	public String getHora_vueltaBrowser(){
		DateFormat df = new SimpleDateFormat("HH:mm");
		return df.format(hora_vuelta);
	}
	
}
