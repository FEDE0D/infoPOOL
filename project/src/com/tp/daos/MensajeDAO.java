package com.tp.daos;

import java.util.List;

import com.tp.uml.Mensaje;
import com.tp.uml.Usuario;

public interface MensajeDAO extends GenericDAO<Mensaje> {

	public List<Mensaje> getConversation(Usuario from, Usuario to);//devuelve el historial de mensajes entre 2 usuarios ordenado por fecha y hora
	public List<Mensaje> getMyConversations(Usuario u);//devuelve todos los historial de mensajes en el que el usuario pasado por parametro aparesca como from o como to
	
}
