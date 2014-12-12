package com.shishuo.cms.action.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shishuo.cms.constant.ArticleConstant;
import com.shishuo.cms.entity.vo.ArticleVo;
import com.shishuo.cms.exception.FolderNotFoundException;

/**
 * @author lqq
 * @author 进入网站后台首页
 * 
 */

@Controller
@RequestMapping("/admin")
public class AdminAction extends AdminBaseAction {
	
	@RequestMapping(value = "/index.htm", method = RequestMethod.GET)
	public String login(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws FolderNotFoundException {
		modelMap.put("articleCount", 0);
		modelMap.put("downloadCount", 0);
		modelMap.put("userCount", 0);
		modelMap.put("folderAll", folderService.getAllFolderList(0, null));
		List<ArticleVo> articleList = articleService.getArticleListByStatus(0,
				0, 0, 0, ArticleConstant.Status.display, 0, 10);
		modelMap.put("articleList", articleList);
		
		return "system/index";
	}

}
