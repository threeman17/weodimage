package image.controller;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import image.pojo.ImageList;
import image.service.ImageAlterService;
import image.utils.E3Rusult;

@Controller
public class AlterController {

	@Autowired
	private ImageAlterService imageAlterService;
	
	/**
	 * 图片上传
	 * @author cewin
	 * @email cewin95@foxmaill.com
	 * @version 1.0
	 * @date 2017年9月14日	下午11:10:14
	 * @param item
	 * @param pictureFile
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/uploadImage.action")
	@ResponseBody
	public Object updateItemById(MultipartFile pictureFile,ImageList image) throws Exception {
		// 图片上传
		// 设置图片名称，不能重复，可以使用uuid
		
		String picName = UUID.randomUUID().toString();

		// 获取文件名
		String oriName = pictureFile.getOriginalFilename();
		// 获取图片后缀
		String extName = oriName.substring(oriName.lastIndexOf("."));

		// 开始上传
		pictureFile.transferTo(new File("D:/workspace/pic/" + picName + extName));
	
		image.setImg_src("http://localhost:8080/pic/"+picName + extName);
		image.setCreate_time(new Date());
		image.setUpload_time(new Date());
		imageAlterService.insertImage(image);
		
		return E3Rusult.ok();
	}
}
