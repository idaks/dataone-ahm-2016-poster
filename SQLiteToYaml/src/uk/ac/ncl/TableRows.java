package uk.ac.ncl;

import java.util.List;

/**
 * 
 * @author Priyaa Thavasimani
 * 
 */
public class TableRows {
	List<String> trial_id;
	List<String> name;
	List<String> id;
	List<String> mode;

	public List<String> getName() {
		return name;
	}

	public List<String> getTrial_id() {
		return trial_id;
	}

	public void setTrial_id(List<String> trial_id2) {
		this.trial_id = trial_id2;
	}

	public List<String> getMode() {
		return mode;
	}

	public void setMode(List<String> mode) {
		this.mode = mode;
	}

	public void setName(List<String> name) {
		this.name = name;
	}

	public List<String> getId() {
		return id;
	}

	public void setId(List<String> id) {
		this.id = id;
	}
}
