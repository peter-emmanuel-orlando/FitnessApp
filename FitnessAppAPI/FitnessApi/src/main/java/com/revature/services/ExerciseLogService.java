package com.revature.services;

//this is the service layer
import java.util.List;

import com.revature.dto.Log;
import com.revature.model.ExerciseLog;

public interface ExerciseLogService {

	ExerciseLog save(ExerciseLog history);
	ExerciseLog update(ExerciseLog history);
	ExerciseLog delete(ExerciseLog history);
	
	List<ExerciseLog>findAll();
	List<ExerciseLog> findAllByExerciseDescription(String description);
	List<ExerciseLog> findAllByUserId(int id);
	List<Log> findAllByUserIdAndExerciseDescription(int id, String description);
	
}
