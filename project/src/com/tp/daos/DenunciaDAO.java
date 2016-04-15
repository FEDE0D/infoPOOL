package com.tp.daos;

import java.util.List;

import com.tp.uml.Denuncia;

public interface DenunciaDAO extends GenericDAO<Denuncia> {

	public List<Denuncia> getDenunciasRecorridos();
	
}
