package com.tp.actions;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Date;
import java.sql.Time;
import java.util.LinkedList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tp.daos.DAOFactory;
import com.tp.daos.RecorridoDAO;
import com.tp.uml.Calificacion;
import com.tp.uml.Dia;
import com.tp.uml.Dia.DiaSemana;
import com.tp.uml.Evento;
import com.tp.uml.Recorrido;
import com.tp.uml.Usuario;

public class RecorridoAction extends ActionSupport implements
		ModelDriven<Recorrido> {

	private static final long serialVersionUID = -1074419787975317322L;

	private Recorrido recorrido = new Recorrido();
	private RecorridoDAO recorridoDAO;

	public void setRecorridoDAO(RecorridoDAO recorridoDAO) {
		this.recorridoDAO = recorridoDAO;
	}

	@Override
	public Recorrido getModel() {
		return recorrido;
	}

	/* NUEVO */

	Evento recoEvento;

	/** Muestra el formulario para un nuevo recorrido */
	public String nuevo() {

		long eid;
		String ei = ServletActionContext.getRequest().getParameter("eid");
		eid = ei != null ? Long.valueOf(ei) : -1;

		recoEvento = null;
		recoEvento = DAOFactory.getEvento().getById(eid);

		return SUCCESS;

	}

	public Evento getRecoEvento() {
		return this.recoEvento;
	}

	/* FORMULARIO ALTA */

	Long recorridoId;

	public String alta() {

		Evento evento;
		int tipo_periodicidad;
		LinkedList<Dia> dias = new LinkedList<Dia>();
		Date diaPuntual;
		Time horaIdaPuntual;
		Time horaVueltaPuntual;

		
		String eidParam = ServletActionContext.getRequest().getParameter("eid"); if (eidParam.isEmpty()) eidParam = "-1";
		evento = DAOFactory.getEvento().getById(Long.valueOf(eidParam));
		tipo_periodicidad = Integer.valueOf(ServletActionContext.getRequest().getParameter("tipo_recorrido"));

		if (tipo_periodicidad == 1) {// PUNTUAL
			Dia d = new Dia();
			diaPuntual = Date.valueOf(ServletActionContext.getRequest().getParameter("fecha_puntual"));
			horaIdaPuntual = Time.valueOf(ServletActionContext.getRequest().getParameter("hora_ida_puntual") + ":00");
			horaVueltaPuntual = Time.valueOf(ServletActionContext.getRequest().getParameter("hora_vuelta_puntual") + ":00");

			d.setFecha(diaPuntual);
			d.setHora_ida(horaIdaPuntual);
			d.setHora_vuelta(horaVueltaPuntual);
			d.setRecorrido(recorrido);
			dias.add(d);
		} else {// PERIODICO
				// LUNES
			if (ServletActionContext.getRequest().getParameter("check_lunes") != null) {
				Time hi, hv;
				hi = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hi_lunes") + ":00");
				hv = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hv_lunes") + ":00");

				Dia d = new Dia();
				d.setDia(DiaSemana.LUNES);
				d.setHora_ida(hi);
				d.setHora_vuelta(hv);
				d.setRecorrido(recorrido);
				dias.add(d);
			}
			// MARTES
			if (ServletActionContext.getRequest().getParameter("check_martes") != null) {
				Time hi, hv;
				hi = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hi_martes") + ":00");
				hv = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hv_martes") + ":00");

				Dia d = new Dia();
				d.setDia(DiaSemana.MARTES);
				d.setHora_ida(hi);
				d.setHora_vuelta(hv);
				d.setRecorrido(recorrido);
				dias.add(d);
			}
			// MIERCOLES
			if (ServletActionContext.getRequest().getParameter("check_miercoles") != null) {
				Time hi, hv;
				hi = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hi_miercoles") + ":00");
				hv = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hv_miercoles") + ":00");

				Dia d = new Dia();
				d.setDia(DiaSemana.MIERCOLES);
				d.setHora_ida(hi);
				d.setHora_vuelta(hv);
				d.setRecorrido(recorrido);
				dias.add(d);
			}
			// JUEVES
			if (ServletActionContext.getRequest().getParameter("check_jueves") != null) {
				Time hi, hv;
				hi = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hi_jueves") + ":00");
				hv = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hv_jueves") + ":00");

				Dia d = new Dia();
				d.setDia(DiaSemana.JUEVES);
				d.setHora_ida(hi);
				d.setHora_vuelta(hv);
				d.setRecorrido(recorrido);
				dias.add(d);
			}
			// VIERNES
			if (ServletActionContext.getRequest().getParameter("check_viernes") != null) {
				Time hi, hv;
				hi = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hi_viernes") + ":00");
				hv = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hv_viernes") + ":00");

				Dia d = new Dia();
				d.setDia(DiaSemana.VIERNES);
				d.setHora_ida(hi);
				d.setHora_vuelta(hv);
				d.setRecorrido(recorrido);
				dias.add(d);
			}
			// SABADO
			if (ServletActionContext.getRequest().getParameter("check_sabado") != null) {
				Time hi, hv;
				hi = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hi_sabado") + ":00");
				hv = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hv_sabado") + ":00");

				Dia d = new Dia();
				d.setDia(DiaSemana.SABADO);
				d.setHora_ida(hi);
				d.setHora_vuelta(hv);
				d.setRecorrido(recorrido);
				dias.add(d);
			}
			// DOMINGO
			if (ServletActionContext.getRequest().getParameter("check_domingo") != null) {
				Time hi, hv;
				hi = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hi_domingo") + ":00");
				hv = Time.valueOf(ServletActionContext.getRequest()
						.getParameter("hv_domingo") + ":00");

				Dia d = new Dia();
				d.setDia(DiaSemana.DOMINGO);
				d.setHora_ida(hi);
				d.setHora_vuelta(hv);
				d.setRecorrido(recorrido);
				dias.add(d);
			}

		}
		// asientos =
		// Integer.valueOf(ServletActionContext.getRequest().getParameter("total_asientos"));
		// direccion_desde =
		// ServletActionContext.getRequest().getParameter("direccion_desde");
		// direccion_hasta =
		// ServletActionContext.getRequest().getParameter("direccion_hasta");

		recorrido.setCreador((Usuario) ActionContext.getContext().getSession()
				.get("user"));
		recorrido.setEvento(evento);
		recorrido.setPeriodicidad(dias);

		Recorrido recorridoNuevo = recorridoDAO.create(recorrido);
		if (recorridoNuevo != null) {
			recorridoId = recorrido.getId();
			for (Dia d : recorrido.getPeriodicidad())
				DAOFactory.getDia().create(d);
			return SUCCESS;
		} else {
			return INPUT;
		}

	}

	public Long getRecorridoId() {
		return recorridoId;
	}

	/* LISTADO */

	private List<Recorrido> recorridos;

	public String listado() {
		this.recorridos = recorridoDAO.getAll("id");
		return SUCCESS;
	}

	public List<Recorrido> getRecorridos() {
		return this.recorridos;
	}

	/* DETALLE */

	public Recorrido getRecorridoDetalle(){
		return recorrido;
	}
	
	public String detalle() {
		
		recorrido = recorridoDAO.getById(Long.valueOf(ServletActionContext.getRequest().getParameter("id")));
		if (recorrido == null) return ERROR;
		return SUCCESS;
		// Recorrido e = recorridoDAO.getById(recorrido.getId() != null?
		// recorrido.getId() : 0);
		// if (e != null) return SUCCESS;
		// else return ERROR;
	}

	/* VOTO */
	
	private InputStream votoStream;
	
	public InputStream getVotoStream(){ return votoStream; }
	
	public String votar(){
		
		Recorrido r = recorridoDAO.getById(Long.valueOf(ServletActionContext.getRequest().getParameter("rid")));
		if (r != null){
			
			Usuario calificador = (Usuario) ActionContext.getContext().getSession().get("user");
			Usuario calificado = r.getCreador();
			
			for (Calificacion c : r.getCalificaciones()){
				if (c.getCalificador().getUsername().equals(calificador.getUsername()) && c.getCalificado().getUsername().equals(calificado.getUsername())){
					votoStream = new ByteArrayInputStream("1".getBytes());
					return SUCCESS;
				}
			}
			
			Calificacion c = new Calificacion();
			c.setCalificado(calificado);
			c.setCalificador(calificador);
			c.setPuntaje(Integer.valueOf(ServletActionContext.getRequest().getParameter("v")));
			c.setRecorrido(r);
			
			DAOFactory.getCalificacion().create(c);
			r.getCalificaciones().add(c);
			recorridoDAO.update(r);
			
			votoStream = new ByteArrayInputStream("0".getBytes());
			
			return SUCCESS;
		}else{
			return NONE;
		}
		
		
	}
	
	public void validateVotar(){
		Long id = Long.valueOf(ServletActionContext.getRequest().getParameter("rid"));
		Recorrido r = recorridoDAO.getById(id);
		if (r == null) this.addActionError("E: no existe el recorrido con id "+id);
		
		Usuario u = (Usuario) ActionContext.getContext().getSession().get("user");
		if (u == null) this.addActionError("E: el usuario no esta logueado");
	}
	
	
	/* VALIDATES */
	
	public void validate() {
	}

	public void validateAlta() {
		
		Usuario user = (Usuario) ActionContext.getContext().getSession().get("user");
		if (user == null) this.addActionError("No posee permisos para realizar la operación");
		if (user.isAdministrador()) this.addActionError("Los Administradores no pueden crear recorridos :/");

	}
	
	public void validateDetalle(){
		// validar que el parametro id esté seteado
	}
	
}
