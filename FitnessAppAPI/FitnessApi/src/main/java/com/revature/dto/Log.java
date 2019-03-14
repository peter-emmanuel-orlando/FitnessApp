package com.revature.dto;

import java.util.Date;

import com.revature.model.ExerciseLog;

public class Log {
	private double units;
	private Date occourred;
	
	public Log() {
		super();
	}
	
	public Log(ExerciseLog E) {
		units = E.getUnits();
		occourred = E.getOccourred();
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((occourred == null) ? 0 : occourred.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Log other = (Log) obj;
		if (occourred == null) {
			if (other.occourred != null)
				return false;
		} else if (!occourred.equals(other.occourred))
			return false;
		return true;
	}

	public Log(double units, Date occourred) {
		this.units=units;
		this.occourred=occourred;
	}
	
	public double getUnits() {
		return units;
	}
	public Date getOccourred() {
		return occourred;
	}
	
	public void combine(Log in) {
		units += in.getUnits();
	}

	@Override
	public String toString() {
		return "Log [units=" + units + ", occourred=" + occourred + "]";
	}
}
