package com.revature.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
@JsonFilter("depth_4")

public class HistoryItem {
	private double units;
	private Date occoured;
	@Override
	public String toString() {
		return "HistoryItem [units=" + units + ", occoured=" + occoured + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((occoured == null) ? 0 : occoured.hashCode());
		long temp;
		temp = Double.doubleToLongBits(units);
		result = prime * result + (int) (temp ^ (temp >>> 32));
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
		HistoryItem other = (HistoryItem) obj;
		if (occoured == null) {
			if (other.occoured != null)
				return false;
		} else if (!occoured.equals(other.occoured))
			return false;
		if (Double.doubleToLongBits(units) != Double.doubleToLongBits(other.units))
			return false;
		return true;
	}
	public double getUnits() {
		return units;
	}
	public void setUnits(double units) {
		this.units = units;
	}
	public Date getOccoured() {
		return occoured;
	}
	public void setOccoured(Date occoured) {
		this.occoured = occoured;
	}
}
