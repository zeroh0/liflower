package shop.master;

import java.sql.Timestamp;

public class productDataBean {
	private int PDR_id; //등록번호
	private String category; // 분류
	private String title; //이름
	private int price; //가격
	private String manufacturer; //만든곳
	private String publishing_date; //출판일
	private String PDR_image; //이미지명
	private String content; //내용
	private Timestamp reg_date; // 등록날짜
	private short count; // 재고수량
	
	public int getPDR_id() {
		return PDR_id;
	}
	public void setPDR_id(int pDR_id) {
		PDR_id = pDR_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getPublishing_date() {
		return publishing_date;
	}
	public void setPublishing_date(String publishing_date) {
		this.publishing_date = publishing_date;
	}
	public String getPDR_image() {
		return PDR_image;
	}
	public void setPDR_image(String pDR_image) {
		PDR_image = pDR_image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public short getCount() {
		return count;
	}
	public void setCount(short count) {
		this.count = count;
	}
	
}