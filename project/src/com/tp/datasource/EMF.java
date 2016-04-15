package com.tp.datasource;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EMF {

	private static final EntityManagerFactory em = Persistence.createEntityManagerFactory("java_tp");
	
	public static EntityManagerFactory getEMF(){
		return em;
	}
	
}
