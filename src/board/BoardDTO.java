package board;
import java.util.Date;
//num,title,name,pwd,content,regdate,hit
public class BoardDTO {
	private String title;
	private String content;
	private int num;
	private String id;
	private Date regdate;
	private int hit;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [title=" + title + ", content=" + content + ", num=" + num + ", id=" + id + ", regdate="
				+ regdate + ", hit=" + hit + "]";
	}
	
}// end