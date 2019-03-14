package com.revature.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.dto.Log;
import com.revature.model.ExerciseLog;
import com.revature.repos.ExerciseLogRepo;


@Service
public class ExerciseLogServiceImpl implements ExerciseLogService {

	
	@Autowired
	private ExerciseLogRepo history;
	
	@Override
	public ExerciseLog save(ExerciseLog history) {
		return this.history.save(history);
	}

	@Override
	public ExerciseLog update(ExerciseLog history) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ExerciseLog delete(ExerciseLog history) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ExerciseLog> findAll() {
	  return history.findAll();
	}

	@Override
	public List<ExerciseLog> findAllByExerciseDescription(String name) {
		return history.findAllByExerciseDescription(name);
	}

	@Override
	public List<ExerciseLog> findAllByUserId(int id) {
		return history.findAllByUserId(id);
	}

	@Override
	public List<Log> findAllByUserIdAndExerciseDescription(int id, String name) {
		List<ExerciseLog> result = history.findAllByUserIdAndExerciseDescription(id, name.toLowerCase());
		List<Log> aggregated = new ArrayList<Log>();
		for(ExerciseLog E:result) {
			Log L = new Log(E);
			int index = aggregated.indexOf(L);
			if (index<0){
				aggregated.add(L);
			}else {
				aggregated.get(index).combine(L);
			}
		}
		return aggregated;
	}

}
