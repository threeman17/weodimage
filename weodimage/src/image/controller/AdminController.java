package image.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import a.mail.MailUtils;
import image.pojo.ImageList;
import image.service.ImageAlterService;
import image.service.ImageListService;
import image.test.User;
import image.utils.E3Rusult;

@Controller
public class AdminController {

	@Autowired
	private ImageListService imageListService;
	
	@Autowired
	private ImageAlterService imageAlterService;
	/**
	 * 图片列表
	 * @author cewin
	 * @email cewin95@foxmaill.com
	 * @version 1.0
	 * @date 2017年9月13日	下午8:01:47
	 * @param callback
	 * @return
	 */
	@RequestMapping("/admin/imagelist.action")
	public Object getImageList(HttpSession httpSession) {
		List<ImageList> list = imageListService.selectUserListAll();
		httpSession.setAttribute("imagelist", list);
	
		return "admin/picture-list";
		
	}
	/**
	 * 审核通过
	 * @author cewin
	 * @email cewin95@foxmaill.com
	 * @version 1.0
	 * @date 2017年9月16日	下午10:02:18
	 * @param callback
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("/admin/isPassTrue.action")
	@ResponseBody
	public Object isPassTrue(int id) {
		System.out.println(id);
		imageAlterService.updateIsPassTrue(id);
		return E3Rusult.ok();
		
	}
	/**
	 * 审核未通过
	 * @author cewin
	 * @email cewin95@foxmaill.com
	 * @version 1.0
	 * @date 2017年9月16日	下午10:17:04
	 * @param id
	 * @return
	 * @throws MessagingException 
	 * @throws AddressException 
	 */
	@RequestMapping("/admin/isPassFalse.action")
	@ResponseBody
	public Object isPassFalse(int id ,String email,String text,String author) throws AddressException, MessagingException {
		imageAlterService.updateIsPassFalse(id);
		MailUtils.sendMail(email, "微社区：亲爱的"+author+",您上传的壁纸不符合规范，已被驳回", text);
		return E3Rusult.ok();
		
	}
	
	/**
	 * 发布
	 * @author cewin
	 * @email cewin95@foxmaill.com
	 * @version 1.0
	 * @date 2017年9月16日	下午10:17:54
	 * @param id
	 * @return
	 */

	@RequestMapping("/admin/isPubTrue.action")
	@ResponseBody
	public Object isPubTrue(int id) {
		imageAlterService.updateIsPubTrue(id);
		return E3Rusult.ok();
		
	}
	
	/**
	 * 下架
	 * @author cewin
	 * @email cewin95@foxmaill.com
	 * @version 1.0
	 * @date 2017年9月16日	下午10:18:27
	 * @param id
	 * @return
	 */
	@RequestMapping("/admin/isPubFalse.action")
	@ResponseBody
	public Object isPubFalse(int id) {
		imageAlterService.updateIsPubFalse(id);
		return E3Rusult.ok();
		
	}
	
	
}
