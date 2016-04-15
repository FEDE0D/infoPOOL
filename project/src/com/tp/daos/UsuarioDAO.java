package com.tp.daos;

import java.util.List;

import com.tp.uml.Evento;
import com.tp.uml.Propuesta;
import com.tp.uml.Recorrido;
import com.tp.uml.Usuario;

public interface UsuarioDAO extends GenericDAO<Usuario> {

	public Usuario match(String usuario, String contraseña);
	public List<Evento> getMisEventos();
	public List<Recorrido> getMisRecorridos(Usuario viajero);
	public int getPuntajeTotal(Usuario viajero);
	public List<Propuesta> getPropuestas(Usuario viajero);
	
}
