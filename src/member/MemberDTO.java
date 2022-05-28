package member;

public class MemberDTO {
	private String id;
	private String pwd;
	private String nickname;
	private int level;
	private int meso;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getMeso() {
		return meso;
	}
	public void setMeso(int meso) {
		this.meso = meso;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", nickname=" + nickname + ", level=" + level + ", meso=" + meso
				+ "]";
	}
	
}
