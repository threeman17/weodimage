package image.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author VULCAN
 *
 */
public class ImageList {
	private int id;
	private String title;
	private String author;
	private String img_src;
	private Date create_time;
	private Date upload_time;
	private int user_id;
	private int is_pass;
	private int is_pub;
	public int getIs_pass() {
		return is_pass;
	}
	public void setIs_pass(int is_pass) {
		this.is_pass = is_pass;
	}
	public int getIs_pub() {
		return is_pub;
	}
	public void setIs_pub(int is_pub) {
		this.is_pub = is_pub;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getUpload_time() {
		return upload_time;
	}
	public void setUpload_time(Date upload_time) {
		this.upload_time = upload_time;
	}
	@Override
	public String toString() {
		return "ImageList [id=" + id + ", title=" + title + ", author=" + author + ", img_src=" + img_src
				+ ", create_time=" + create_time + ", upload_time=" + upload_time + "]";
	}
	
	
	public String format(Date date) {
		if(date==null) {
			return null;
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String result = sdf.format(date);
		return result;
		
	}
	public String getCreate_time_format() {
		return format(create_time);
	}
	public String getUpload_time_format() {
		return format(upload_time);
	}
}
