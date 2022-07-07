package shop.master;

public class CartDataBean {
	private int cart_id; //장바구니의 아이디
	private String buyer; //구매자
	private int PDR_id; //구매된 책의 아이디
	private String Title;//구매된 책명
	private int  Price;//판매가
	private byte buy_count; //판매수량
	private String PDR_image;//책이미지
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public int getPDR_id() {
		return PDR_id;
	}
	public void setPDR_id(int pDR_id) {
		PDR_id = pDR_id;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public byte getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(byte buy_count) {
		this.buy_count = buy_count;
	}
	public String getPDR_image() {
		return PDR_image;
	}
	public void setPDR_image(String pDR_image) {
		PDR_image = pDR_image;
	}
	
}
