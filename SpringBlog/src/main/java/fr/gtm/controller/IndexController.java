package fr.gtm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController {

	@RequestMapping(path="/", method = RequestMethod.GET)
	ModelAndView displayIndex() {
		
		ModelAndView monModelAndView = new ModelAndView("index");
		return monModelAndView;
	}

}
