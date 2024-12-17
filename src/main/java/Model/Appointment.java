package Model;


public class Appointment {
	
	private String appId;
	private String time;
	private String date;
	private String patient_name;
	private String pateint_age;
	private String doctor;
	private String contact;
	
	public Appointment() {
		
	}
	
	public Appointment(String appId, String time, String date, String patient_name, String pateint_age, String doctor,
			String contact) {
		super();
		this.appId = appId;
		this.time = time;
		this.date = date;
		this.patient_name = patient_name;
		this.pateint_age = pateint_age;
		this.doctor = doctor;
		this.contact = contact;
	}

	public String getId() {
		return appId;
	}

	public void setappId(String appId) {
		this.appId = appId;
	}
	
	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

	public String getPateint_age() {
		return pateint_age;
	}

	public void setPateint_age(String pateint_age) {
		this.pateint_age = pateint_age;
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	

}
