package image.service;

import image.pojo.ImageList;

public interface ImageAlterService {
	public void insertImage(ImageList imageList);
	public void updateIsPassTrue(int id);
	public void updateIsPassFalse(int id);
	public void updateIsPubTrue(int id);
	public void updateIsPubFalse(int id);
}
