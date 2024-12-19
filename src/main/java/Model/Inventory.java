package Model;

public class Inventory {
	
	private String id;
	private String product_name;
	private String type;
	private String price;
	private String instock;
	private String exp_date;
	private String manufacturer;
	
	public Inventory() {
		
	}

	public Inventory(String id, String product_name, String type, String price, String instock, String exp_date) {
		super();
		this.id = id;
		this.product_name = product_name;
		this.type = type;
		this.price = price;
		this.instock = instock;
		this.exp_date = exp_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getInstock() {
		return instock;
	}

	public void setInstock(String instock) {
		this.instock = instock;
	}

	public String getExp_date() {
		return exp_date;
	}

	public void setExp_date(String exp_date) {
		this.exp_date = exp_date;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	
	
	
	

}
