package com.tp.daos;

import com.tp.daos.hib.*;

public class DAOFactory {

	public static CalificacionDAO getCalificacion(){
		return new CalificacionDAOHib();
	}
	
	public static ComentarioDAO getComentario(){
		return new ComentarioDAOHib();
	}
	
	public static DenunciaDAO getDenuncia(){
		return new DenunciaDAOHib();
	}
	
	public static DiaDAO getDia(){
		return new DiaDAOHib();
	}
	
	public static EventoDAO getEvento(){
		return new EventoDAOHib();
	}
	
	public static MensajeDAO getMensaje(){
		return new MensajeDAOHib();
	}
	
	public static PropuestaDAO getPropuesta(){
		return new PropuestaDAOHib();
	}
	
	public static RecorridoDAO getRecorrido(){
		return new RecorridoDAOHib();
	}
	
	public static UsuarioDAO getUsuario(){
		return new UsuarioDAOHib();
	}
	
}
