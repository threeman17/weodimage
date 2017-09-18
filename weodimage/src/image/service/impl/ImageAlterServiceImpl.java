package image.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import image.mapper.AlterImageMapper;
import image.pojo.ImageList;
import image.service.ImageAlterService;
import image.service.ImageListService;
@Service
public class ImageAlterServiceImpl implements ImageAlterService{

	@Autowired
	private AlterImageMapper alterImageMapper;
	@Override
	public void insertImage(ImageList imageList) {
		alterImageMapper.insertImage(imageList);
		
	}
	@Override
	public void updateIsPassTrue(int id) {
		alterImageMapper.updateIsPassTrue(id);
		
	}
	@Override
	public void updateIsPassFalse(int id) {
		alterImageMapper.updateIsPassFalse(id);
		
	}
	@Override
	public void updateIsPubTrue(int id) {
		alterImageMapper.updateIsPubTrue(id);
		
	}
	@Override
	public void updateIsPubFalse(int id) {
		alterImageMapper.updateIsPubFalse(id);
		
	}
	

}
