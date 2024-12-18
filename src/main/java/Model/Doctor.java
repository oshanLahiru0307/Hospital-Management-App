package Model;

public class Doctor {
	
	private String doctorId;
	private String name;
	private String RefNo;
	private String Specialization;
	private String Contact;
	private String Email;
	
	public Doctor() {
	}
	
	public Doctor(String doctorId, String name, String refNo, String specialization, String contact, String email) {
		super();
		this.doctorId = doctorId;
		this.name = name;
		RefNo = refNo;
		Specialization = specialization;
		Contact = contact;
		Email = email;
	}
	
	public String getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRefNo() {
		return RefNo;
	}
	public void setRefNo(String refNo) {
		RefNo = refNo;
	}
	public String getSpecialization() {
		return Specialization;
	}
	public void setSpecialization(String specialization) {
		Specialization = specialization;
	}
	public String getContact() {
		return Contact;
	}
	public void setContact(String contact) {
		Contact = contact;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	

}
