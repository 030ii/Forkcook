package spring.data;

import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class QnaDto {
	private int num;
	private String subject;
	private String content;
	private String image;
	private Timestamp writeday;
	private ArrayList<MultipartFile> upfile;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public ArrayList<MultipartFile> getUpfile() {
		return upfile;
	}
	public void setUpfile(ArrayList<MultipartFile> upfile) {
		this.upfile = upfile;
	}
	
}