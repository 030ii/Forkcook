package spring.data;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class MenuDto {
	private int num;
	private String name;
	private String category;
	private String persons;
	private String price;
	private String mainimage;
	private String rate;
	private String shortmsg;
	private String longimage;
	private ArrayList<MultipartFile> upfile;
	
	public ArrayList<MultipartFile> getUpfile() {
		return upfile;
	}
	public void setUpfile(ArrayList<MultipartFile> upfile) {
		this.upfile = upfile;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPersons() {
		return persons;
	}
	public void setPersons(String persons) {
		this.persons = persons;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMainimage() {
		return mainimage;
	}
	public void setMainimage(String mainimage) {
		this.mainimage = mainimage;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getShortmsg() {
		return shortmsg;
	}
	public void setShortmsg(String shortmsg) {
		this.shortmsg = shortmsg;
	}
	public String getLongimage() {
		return longimage;
	}
	public void setLongimage(String longimage) {
		this.longimage = longimage;
	}
}
