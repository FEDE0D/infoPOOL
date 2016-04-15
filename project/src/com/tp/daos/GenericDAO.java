package com.tp.daos;

import java.util.List;

public interface GenericDAO<T> {

	public T getById(Long id);
	public boolean exists(Long id);
	public List<T> getAll(String columnOrder);
	public List<T> getActives(String columnOrder);
	public List<T> getInactives(String columnOrder);
	public List<T> getByString(String columnName, String value);
	
	public T create(T entity);
	public T update(T entity);
	public T delete(Long id);
	public T recover(Long id);
}
