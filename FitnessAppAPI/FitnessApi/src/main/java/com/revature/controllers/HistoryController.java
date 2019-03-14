package com.revature.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.revature.dto.Log;
import com.revature.model.AppUser;
import com.revature.model.ExerciseLog;
import com.revature.services.ExerciseLogService;

@RestController
@RequestMapping("history")
public class HistoryController {
	@Autowired 
	ExerciseLogService history;
	
	@GetMapping
	public List<ExerciseLog> findAll() {
		return history.findAll();
	}
	
	@GetMapping("exercise/{exercise}")
	public List<ExerciseLog> findAllByExerciseDescription(@PathVariable String exercise) {
		return history.findAllByExerciseDescription(exercise);
	}
	
	@GetMapping("user/{id}")
	public List<ExerciseLog> findAllByUserId(@PathVariable int id) {
		return history.findAllByUserId(id);
	}
	
	@GetMapping("user/{id}/exercise/{exercise}")
	public List<Log> findAllByUserIdAndExerciseDescription(@PathVariable int id, @PathVariable String exercise) {
		return history.findAllByUserIdAndExerciseDescription(id, exercise);
	}
	
	@PostMapping
	@ResponseStatus(code=HttpStatus.CREATED)
	public ExerciseLog save(@RequestBody ExerciseLog exLog) {
		ExerciseLog ex = history.save(exLog);
		
		return ex;
		
	}
	
	
}
