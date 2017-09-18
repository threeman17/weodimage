package image.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import image.mapper.ImageListMapper;
import image.pojo.ImageList;
import image.service.ImageListService;

@Service
public class ImageListServiceImpl implements ImageListService{

	@Autowired
	ImageListMapper imageListMapper;
	
	@Override
	public List<ImageList> selectUserList() {
		List<ImageList> list = imageListMapper.selectImageList();
		return list;
	}

	@Override
	public List<ImageList> selectImageListByUserId(int userId) {
		List<ImageList> list = imageListMapper.selectImageListByUserId(userId);
		return list;
	}

	@Override
	public List<ImageList> selectUserListAll() {
		List<ImageList> list = imageListMapper.selectImageListAll();
		return list;
	}

}
