package uk.ac.ncl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author Priyaa Thavasimani
 * 
 */
public class RetrieveSqliteRecords {
	public TableRows retrieve() throws SQLException {
		Connection conn = DBConnection.Connect();
		Statement stat = null;
		ResultSet rs = null;
		TableRows tr = new TableRows();
		InputOutput io = new InputOutput();
		List<String> inputs = new ArrayList<String>();
		List<String> outputs = new ArrayList<String>();
		List<String> trial_id_list = new ArrayList<String>();
		List<String> id_list = new ArrayList<String>();
		List<String> name_list = new ArrayList<String>();
		List<String> mode_list = new ArrayList<String>();
		String trial_id = null;
		String id = null;
		String name = null;
		String mode = null;

		try {
			stat = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs = stat.executeQuery("select * from file_access;");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		while (rs.next()) {
			trial_id = rs.getString("trial_id");
			id = rs.getString("id");
			name = rs.getString("name");
			mode = rs.getString("mode");

			inputs.add("inputs:");
			outputs.add("outputs:");
			trial_id_list.add(trial_id);
			id_list.add(id);
			name_list.add(name);
			mode_list.add(mode);
		}
		io.setInputs(inputs);
		io.setOutputs(outputs);
		tr.setTrial_id(trial_id_list);
		tr.setId(id_list);
		tr.setName(name_list);
		tr.setMode(mode_list);
		return tr;
	}
}
