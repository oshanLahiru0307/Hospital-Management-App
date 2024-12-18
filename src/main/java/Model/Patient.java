package Model;

public class Patient {
	
	private String patientId;
	private String patient_name;
	private String patient_age;
	private String blood_group;
	private String contact;
	private String email;
	
	public Patient() {

	}
	
	public Patient(String patientId, String patient_name, String patient_age, String blood_group, String contact,
			String email) {
		super();
		this.patientId = patientId;
		this.patient_name = patient_name;
		this.patient_age = patient_age;
		this.blood_group = blood_group;
		this.contact = contact;
		this.email = email;
	}

	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

	public String getPatient_age() {
		return patient_age;
	}

	public void setPatient_age(String patient_age) {
		this.patient_age = patient_age;
	}

	public String getBlood_group() {
		return blood_group;
	}

	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
