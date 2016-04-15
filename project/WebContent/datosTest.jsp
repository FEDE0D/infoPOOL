<%@page import="com.tp.uml.Calificacion"%>
<%@page import="com.tp.uml.Propuesta"%>
<%@page import="com.tp.uml.Dia.DiaSemana"%>
<%@page import="com.tp.uml.Dia"%>
<%@page import="com.tp.uml.Comentario"%>
<%@page import="com.tp.uml.Denuncia"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="com.tp.uml.Evento"%>
<%@page import="com.tp.uml.Recorrido"%>
<%@page import="com.tp.uml.Mensaje"%>
<%@page import="com.tp.daos.DAOFactory"%>
<%@page import="com.tp.uml.Usuario"%>
<%@page import="com.tp.datasource.EMF"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Test</h1>
		<%
			
		////////ADMIN ////////////////////////////////////////////////////////////////////
		Usuario admin = new Usuario();
		admin.setUsername("titoAdmin2");
		admin.setPassword("1234");
		admin.setEmail("te.seoane@gmail.com");
		admin.setAdministrador(true);
		DAOFactory.getUsuario().create(admin);
		

		//////// VIAJERO ////////////////////////////////////////////////////////////////////
		Usuario viajero = new Usuario();
		viajero.setUsername("fedeeeee2");
		viajero.setPassword("1234");
		viajero.setEmail("fedex@gmail.com");
		viajero.setApellido("pachenco");
		viajero.setNombre("federico");
		DAOFactory.getUsuario().create(viajero);
		
		Usuario viajero2 = new Usuario();
		viajero2.setUsername("Tomas");
		viajero2.setPassword("1234");
		viajero2.setEmail("tomi@gmail.com");
		viajero2.setApellido("Tomas");
		viajero2.setNombre("Seoane");
		DAOFactory.getUsuario().create(viajero2);
		
			// DENUNCIA PARA VIAJERO
			Date dateDenunViaj = new Date(new java.util.Date().getTime());
			Time timeDenunViaj = new Time(new java.util.Date().getTime());
			Denuncia denunViajero = new Denuncia();
			denunViajero.setDenunciante(viajero2);
			denunViajero.setFecha(dateDenunViaj);
			denunViajero.setHora(timeDenunViaj);
			denunViajero.setMotivo("Maneja muy lento :P");
			denunViajero.setUsuario(viajero);
			DAOFactory.getDenuncia().create(denunViajero);
		
		
		//////// MENSAJE ////////////////////////////////////////////////////////////////////
		Mensaje mensaje = new Mensaje();
		Date date = new Date(new java.util.Date().getTime());
		Time time = new Time(new java.util.Date().getTime());
		mensaje.setEmisor(viajero);
		mensaje.setReceptor(admin);
		mensaje.setMensaje("HOLA ADMIN!");
		mensaje.setFecha(date);
		mensaje.setHora(time);
		DAOFactory.getMensaje().create(mensaje);
		
		
		//////// EVENTO ////////////////////////////////////////////////////////////////////
		Evento evento = new Evento();
		evento.setCreador(admin);
		evento.setNombre("Viaje a Tecnopolis");
		evento.setDescripcion("Evento recreativo");
		evento.setDireccion("Calle 50 452-500, La Plata, Buenos Aires, Argentina");
		evento.setFecha("2014-12-12");
		evento.setHora("14:12");
		evento.setMapPosition("(-34.91239942857932, -57.946786880493164)");
		DAOFactory.getEvento().create(evento);
		
			// COMENTARIO PARA EVENTO
			Comentario comentEvento = new Comentario();
			comentEvento.setUsuario(viajero);
			comentEvento.setMensaje("que buen evento!!");
			comentEvento.setEvento(evento);
			DAOFactory.getComentario().create(comentEvento);
		
		
		//////// RECORRIDO ////////////////////////////////////////////////////////////////////
		Recorrido reco = new Recorrido();
		Date dateReco = new Date(new java.util.Date().getTime());
		Date dateRecoINI = new Date(new java.util.Date().getTime()); Date dateRecoFIN = new Date(new java.util.Date().getTime()); 
		Time timeReco = new Time(new java.util.Date().getTime());
		
		Dia dia = new Dia();
		dia.setDia(DiaSemana.MARTES);
		dia.setFecha(dateReco);
		DAOFactory.getDia().create(dia);
		
		reco.setCreador(viajero);
		reco.getPeriodicidad().add(dia);
		reco.setDireccion_desde("Calle 527 1599-1699, Tolosa, Buenos Aires, Argentina");
		reco.setDireccion_hasta("Calle 115, La Plata, Buenos Aires, Argentina");
		reco.setDesdePosition("(-34.90029256179422, -57.97905921936035)");
		reco.setHastaPosition("(-34.911414052670544, -57.937517166137695)");
		reco.setTotal_asientos(5);
		reco.setFecha_inicio(dateRecoINI);
		reco.setFecha_fin(dateRecoFIN);
		DAOFactory.getRecorrido().create(reco);
		
			// COMENTARIO PARA RECORRIDO
			Comentario comentReco = new Comentario();
			comentReco.setUsuario(viajero2);
			comentReco.setMensaje("que buen recorrido!!");
			comentReco.setRecorrido(reco);
			DAOFactory.getComentario().create(comentReco);
			
			// DENUNCIA PARA COMENTARIO
			Date dateDenunComent = new Date(new java.util.Date().getTime());
			Time timeDenunComent = new Time(new java.util.Date().getTime());
			Denuncia denunComent = new Denuncia();
			denunComent.setDenunciante(viajero2);
			denunComent.setFecha(dateDenunComent);
			denunComent.setHora(timeDenunComent);
			denunComent.setMotivo("es ofensivo");
			denunComent.setComentario(comentReco);
			DAOFactory.getDenuncia().create(denunComent);
				
			// DENUNCIA PARA RECORRIDO
			Date dateDenunReco = new Date(new java.util.Date().getTime());
			Time timeDenunReco = new Time(new java.util.Date().getTime());
			Denuncia denunRecorrido = new Denuncia();
			denunRecorrido.setDenunciante(viajero2);
			denunRecorrido.setFecha(dateDenunReco);
			denunRecorrido.setHora(timeDenunReco);
			denunRecorrido.setMotivo("Es mentira");
			denunRecorrido.setRecorrido(reco);
			DAOFactory.getDenuncia().create(denunRecorrido);
			
				
			//PROPUESTA PARA RECORRIDO
			Propuesta propuesta = new Propuesta();
			propuesta.setCandidato(viajero2);
			propuesta.setRecorrido(reco);
			propuesta.setMensaje("hola me gustaria sumarme, puedo esperarte en 1 y 58?");
			propuesta.setRecorrido(reco);
			DAOFactory.getPropuesta().create(propuesta);
				
			// El participante no se agrega porque no vamos a hacer la funcionalidad aceptar propuesta aún
			
			// ACTUALIZO EL RECORRIDO EN LA BASE
			DAOFactory.getRecorrido().update(reco);
		
		
		// CALIFICACION
		Calificacion calif = new Calificacion();
		calif.setCalificador(viajero);
		calif.setCalificado(viajero2);
		calif.setRecorrido(reco);
		calif.setPuntaje(-1);
		DAOFactory.getCalificacion().create(calif);
		
		////////////////////////////////////////////////////////////////////////////////////////
			
		
		List<Usuario> usuarios = DAOFactory.getUsuario().getAll("id");
		List<Evento> eventos = DAOFactory.getEvento().getAll("id");
		List<Propuesta> propuestas = DAOFactory.getPropuesta().getAll("id");
		List<Recorrido> recorridos = DAOFactory.getRecorrido().getAll("id");
		List<Denuncia> denununcias = DAOFactory.getDenuncia().getAll("id");
		List<Mensaje> mensajes = DAOFactory.getMensaje().getAll("id");
		List<Comentario> comentarios = DAOFactory.getComentario().getAll("id");
		List<Calificacion> calificaciones = DAOFactory.getCalificacion().getAll("id");
		

		//Comprobando que se creo todo
		out.println("<h4>Comprobando altas</h4>");
		if(usuarios.size() == 3){out.println("Exito al crear usuarios");out.print("<br>");}
		if(eventos.size() == 1){out.println("Exito al crear evento");out.print("<br>");}
		if(propuestas.size() == 1){out.println("Exito al crear propuesta");out.print("<br>");}
		if(recorridos.size() == 1){out.println("Exito al crear recorrido");out.print("<br>");}
		if(denununcias.size() == 3){out.println("Exito al crear denuncias");out.print("<br>");}
		if(mensajes.size() == 1){out.println("Exito al crear mensaje");out.print("<br>");}
		if(comentarios.size() == 2){out.println("Exito al crear comentarios");out.print("<br>");}
		if(calificaciones.size() == 1){out.println("Exito al crear calificacion");out.print("<br>");}
		
		
		
		
		
		// MODIFICACIONES
		
		viajero.setEmail("email@email.com"); DAOFactory.getUsuario().update(viajero);
		evento.setDescripcion("NUEVA DESCRIPCION"); DAOFactory.getEvento().update(evento);
		propuesta.setAprobado(true); DAOFactory.getPropuesta().update(propuesta);
		reco.setDireccion_desde("NUEVA DIRE DESDE"); DAOFactory.getRecorrido().update(reco);
		denunViajero.setVisto(true); DAOFactory.getDenuncia().update(denunViajero);
		mensaje.setVisto(true); DAOFactory.getMensaje().update(mensaje);
		comentEvento.setMensaje("NUEVO MENSAJE EVENTO"); DAOFactory.getComentario().update(comentEvento);
		calif.setPuntaje(1); DAOFactory.getCalificacion().update(calif);
		
		Usuario modViajero = (Usuario) DAOFactory.getUsuario().getById(viajero.getId());
		Evento modEvento = DAOFactory.getEvento().getById(evento.getId());
		Propuesta modPropuesta = DAOFactory.getPropuesta().getById(propuesta.getId());
		Recorrido modRecorrido = DAOFactory.getRecorrido().getById(reco.getId());
		Denuncia modDenuncia = DAOFactory.getDenuncia().getById(denunViajero.getId());
		Mensaje modMensaje = DAOFactory.getMensaje().getById(mensaje.getId());
		Comentario modComentario = DAOFactory.getComentario().getById(comentEvento.getId());
		Calificacion modCalificacion = DAOFactory.getCalificacion().getById(calif.getId());
		
		out.println("<h4>Comprobando moficicaciones</h4>");
		if(modViajero.getEmail().equals("email@email.com") ) out.print("Exito"); else out.print("Error"); out.println(" al modificar el viajero <br>");
		if(evento.getDescripcion().equals("NUEVA DESCRIPCION") ) out.print("Exito"); else out.print("Error"); out.println(" al modificar el evento <br>");		
		if(propuesta.isAprobado()) out.print("Exito"); else out.print("Error"); out.println(" al modificar la propuesta <br>");
		if(reco.getDireccion_desde().equals("NUEVA DIRE DESDE") ) out.print("Exito"); else out.print("Error"); out.println(" al modificar el recorrido <br>");
		if(denunViajero.isVisto()) out.print("Exito"); else out.print("Error"); out.println(" al modificar la denuncia <br>");
		if(comentEvento.getMensaje().equals("NUEVO MENSAJE EVENTO") ) out.print("Exito"); else out.print("Error"); out.println(" al modificar el comentario <br>");
		if(calif.getPuntaje() == 1) out.print("Exito"); else out.print("Error"); out.println(" al modificar la calificación <br>");
		
		
		
		//ELIMINACIONES
		
		DAOFactory.getUsuario().delete(viajero.getId());
		DAOFactory.getEvento().delete(evento.getId());
		DAOFactory.getRecorrido().delete(reco.getId());
		DAOFactory.getPropuesta().delete(propuesta.getId());
		DAOFactory.getDenuncia().delete(denunComent.getId());
		DAOFactory.getMensaje().delete(mensaje.getId());
		DAOFactory.getComentario().delete(comentEvento.getId());
		DAOFactory.getCalificacion().delete(calif.getId());
		
		List<Usuario> usuariosActivos = DAOFactory.getUsuario().getActives("id");
		List<Evento> eventosActivos = DAOFactory.getEvento().getActives("id");
		List<Propuesta> propuestasActivos = DAOFactory.getPropuesta().getActives("id");
		List<Recorrido> recorridosActivos = DAOFactory.getRecorrido().getActives("id");
		List<Denuncia> denununciasActivos = DAOFactory.getDenuncia().getActives("id");
		List<Mensaje> mensajesActivos = DAOFactory.getMensaje().getActives("id");
		List<Comentario> comentariosActivos = DAOFactory.getComentario().getActives("id");
		List<Calificacion> calificacionesActivos = DAOFactory.getCalificacion().getActives("id");
		
		//Comprobando que se hayan eliminado correctamente
		//denuncias mensajes comet y calific, no se permiten eliminar en el sistema pero podria implementarse
		out.println("<h4>Comprobando bajas</h4>");
		if(usuariosActivos.size() == 2){out.println("Exito al eliminar usuarios");out.print("<br>");}
		if(eventosActivos.size() == 0){out.println("Exito al eliminar evento");out.print("<br>");}
		if(propuestasActivos.size() == 0){out.println("Exito al eliminar propuesta");out.print("<br>");}
		if(recorridosActivos.size() == 0){out.println("Exito al eliminar recorrido");out.print("<br>");}
		if(denununciasActivos.size() == 2){out.println("Exito al eliminar denuncias");out.print("<br>");}
		if(mensajesActivos.size() == 0){out.println("Exito al eliminar mensaje");out.print("<br>");}
		if(comentariosActivos.size() == 1){out.println("Exito al eliminar comentarios");out.print("<br>");}
		if(calificacionesActivos.size() == 0){out.println("Exito al eliminar calificacion");out.print("<br>");}
		
		
		
		
		//RECUPERACIONES
		
		
		DAOFactory.getUsuario().recover(viajero.getId());
		DAOFactory.getEvento().recover(evento.getId());
		DAOFactory.getRecorrido().recover(reco.getId());
		DAOFactory.getPropuesta().recover(propuesta.getId());
		DAOFactory.getDenuncia().recover(denunComent.getId());
		DAOFactory.getMensaje().recover(mensaje.getId());
		DAOFactory.getComentario().recover(comentEvento.getId());
		DAOFactory.getCalificacion().recover(calif.getId());
		
		usuariosActivos = DAOFactory.getUsuario().getActives("id");
		eventosActivos = DAOFactory.getEvento().getActives("id");
		propuestasActivos = DAOFactory.getPropuesta().getActives("id");
		recorridosActivos = DAOFactory.getRecorrido().getActives("id");
		denununciasActivos = DAOFactory.getDenuncia().getActives("id");
		mensajesActivos = DAOFactory.getMensaje().getActives("id");
		comentariosActivos = DAOFactory.getComentario().getActives("id");
		calificacionesActivos = DAOFactory.getCalificacion().getActives("id");
		
		out.println("<h4>Comprobando recuperaciones</h4>");
		if(usuariosActivos.size() == 3){out.println("Exito al recuperar usuarios");out.print("<br>");}
		if(eventosActivos.size() == 1){out.println("Exito al recuperar evento");out.print("<br>");}
		if(propuestasActivos.size() == 1){out.println("Exito al recuperar propuesta");out.print("<br>");}
		if(recorridosActivos.size() == 1){out.println("Exito al recuperar recorrido");out.print("<br>");}
		if(denununciasActivos.size() == 3){out.println("Exito al recuperar denuncias");out.print("<br>");}
		if(mensajesActivos.size() == 1){out.println("Exito al recuperar mensaje");out.print("<br>");}
		if(comentariosActivos.size() == 2){out.println("Exito al recuperar comentarios");out.print("<br>");}
		if(calificacionesActivos.size() == 1){out.println("Exito al recuperar calificacion");out.print("<br>");}
		
					
		%>
	</body>
</html>