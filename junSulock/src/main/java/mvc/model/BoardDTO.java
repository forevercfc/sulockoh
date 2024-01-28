package mvc.model;

public class BoardDTO {
	private int num;
	private String id;
	private String name;
	private String subject;
	private String content;
	private int hit;
	private String ip;
	private String regist_day;
	private String update_day;
	private String img;
	private int price;

	public BoardDTO() {
		super();
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getNum() {
		return num;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getSubject() {
		return subject;
	}

	public String getContent() {
		return content;
	}

	public int getHit() {
		return hit;
	}

	public String getIp() {
		return ip;
	}

	public String getRegist_day() {
		return regist_day;
	}

	public String getUpdate_day() {
		return update_day;
	}

	public String getImg() {
		return img;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}

	public void setUpdate_day(String update_day) {
		this.update_day = update_day;
	}

	public void setImg(String img) {
		this.img = img;
	}
}