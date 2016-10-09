package uk.ac.ncl;

import java.io.FileWriter;
import java.io.IOException;

import net.sourceforge.yamlbeans.YamlException;
import net.sourceforge.yamlbeans.YamlWriter;

/**
 * 
 * @author Priyaa Thavasimani
 * 
 */
public class sqlitetoyaml {

	public static void main(String[] args) throws Exception {
		RetrieveSqliteRecords rsr = new RetrieveSqliteRecords();
		TableRows tr = rsr.retrieve();
		InputOutput io = new InputOutput();
		YamlWriter writer = null;
		try {
			writer = new YamlWriter(new FileWriter("output.yml"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			for (int i = 0; i < tr.trial_id.size(); i++) {
				writer.getConfig().setClassTag("tablerows", TableRows.class);
				if (tr.getMode().get(i).matches("r")) {
					writer.write(io.getInputs().get(i));
					writer.write(tr.getTrial_id().get(i));
					writer.write(tr.getId().get(i));
					writer.write(tr.getName().get(i));
					writer.write(tr.getMode().get(i));
				} else if (tr.getMode().get(i).matches("wb")) {
					writer.write(io.getOutputs().get(i));
					writer.write(tr.getTrial_id().get(i));
					writer.write(tr.getId().get(i));
					writer.write(tr.getName().get(i));
					writer.write(tr.getMode().get(i));
				}
			}
		} catch (YamlException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			writer.close();
		} catch (YamlException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
