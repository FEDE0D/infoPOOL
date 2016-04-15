package com.tp.actions;

import java.sql.Date;
import java.sql.Time;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tp.daos.DenunciaDAO;
import com.tp.daos.RecorridoDAO;
import com.tp.uml.Denuncia;
import com.tp.uml.Recorrido;
import com.tp.uml.Usuario;

public class DenunciaRecorridoAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3559740017501194914L;

	private RecorridoDAO recorridoDAO;
	private DenunciaDAO denunciaDAO;
	
	private Long recorrido_id;
	private String motivo;
	
	public void setRecorridoDAO(RecorridoDAO recorridoDAO) {
		this.recorridoDAO = recorridoDAO;
	}

	public void setDenunciaDAO(DenunciaDAO denunciaDAO) {
		this.denunciaDAO = denunciaDAO;
	}

	public void setRecorrido_id(Long recorrido_id) {
		this.recorrido_id = recorrido_id;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public String denunciar(){
		Recorrido recorridoDenunciado = recorridoDAO.getById(recorrido_id);
		if (recorridoDenunciado!=null){
			
			Denuncia denuncia = new Denuncia();
			denuncia.setMotivo(motivo);
			denuncia.setDenunciante((Usuario) ActionContext.getContext().getSession().get("user"));
			denuncia.setRecorrido(recorridoDenunciado);
			denuncia.setFecha(new Date(new java.util.Date().getTime()));
			denuncia.setHora(new Time(new java.util.Date().getTime()));
			
			denunciaDAO.create(denuncia);
			
			return SUCCESS;
		}else{
			return ERROR;
		}
		
	}
	
}
