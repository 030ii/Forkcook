package spring.data;

public class CartDto {
	private int num;
	private int unum;
	private int snum;
	private int mnum;
	private String menuname;
	private int mcount;
	private int mtotalprice;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getUnum() {
		return unum;
	}
	public void setUnum(int unum) {
		this.unum = unum;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getMcount() {
		return mcount;
	}
	public void setMcount(int mcount) {
		this.mcount = mcount;
	}
	public int getMtotalprice() {
		return mtotalprice;
	}
	public void setMtotalprice(int mtotalprice) {
		this.mtotalprice = mtotalprice;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	
}
