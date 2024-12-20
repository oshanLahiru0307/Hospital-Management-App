package Model;

public class Report {
	
	private String id;
	private String patient_name;
	private String type;
	private String status;
	
	public Report() {
		
	}
	
	public Report(String id, String patient_name, String type, String status) {
		super();
		this.id = id;
		this.patient_name = patient_name;
		this.type = type;
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
