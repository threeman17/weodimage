package image.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import image.pojo.ImageList;
import image.service.ImageListService;
import image.test.User;

@Controller
public class BasicController {

	@Autowired
	private ImageListService imageListService;
	/**
	 * 用户信息
	 * @author cewin
	 * @email cewin95@foxmaill.com
	 * @version 1.0
	 * @date 2017年9月13日	下午6:33:28
	 * @param username
	 * @return
	 */
	@RequestMapping("/user.action")
	@ResponseBody
	public Object getUserInfo(String callback) {
		User user = new User();
		user.setUserID(5);
		user.setUsername("千年");
		
		MappingJacksonValue mjv=new MappingJacksonValue(user);
		mjv.setJsonpFunction(callback);
		return mjv;
		
	}
	/**
	 * 图片列表
	 * @author cewin
	 * @email cewin95@foxmaill.com
	 * @version 1.0
	 * @date 2017年9月13日	下午8:01:47
	 * @param callback
	 * @return
	 */
	@RequestMapping("/imagelist.action")
	@ResponseBody
	public Object getImageList(String callback,HttpSession httpSession) {
		List<ImageList> list = imageListService.selectUserList();
		MappingJacksonValue mjv=new MappingJacksonValue(list);
		mjv.setJsonpFunction(callback);
		return mjv;
		
	}
	/**
	 * 用户图片上传列表
	 * @author cewin
	 * @email cewin95@foxmaill.com
	 * @version 1.0
	 * @date 2017年9月14日	下午8:55:40
	 * @param callback
	 * @return
	 */
	@RequestMapping("/imagelistByUserId.action")
	@ResponseBody
	public Object getImageListByUserId(String callback,Integer userid) {
		List<ImageList> list = imageListService.selectImageListByUserId(userid);
		MappingJacksonValue mjv=new MappingJacksonValue(list);
		mjv.setJsonpFunction(callback);
		return mjv;
		
	}
	

}
