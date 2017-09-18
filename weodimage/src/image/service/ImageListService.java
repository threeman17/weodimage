package image.service;

import java.util.List;

import image.pojo.ImageList;

public interface ImageListService {
	public List<ImageList> selectUserList();
	public List<ImageList> selectUserListAll();
	public List<ImageList> selectImageListByUserId(int userId);
}
