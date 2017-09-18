package image.mapper;

import java.util.List;

import image.pojo.ImageList;


public interface ImageListMapper {
	public List<ImageList> selectImageList();
	public List<ImageList> selectImageListAll();
	public List<ImageList> selectImageListByUserId(int id);
}
