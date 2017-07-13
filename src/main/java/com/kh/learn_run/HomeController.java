package com.kh.learn_run;


import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.study.StudyService;
import com.kh.util.ListInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	
	@Autowired
	private StudyService studyService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, ListInfo listInfo)throws Exception {
		
		
		model.addAttribute("list", studyService.homeList(listInfo));
		
		return "home";
	}
	
}
