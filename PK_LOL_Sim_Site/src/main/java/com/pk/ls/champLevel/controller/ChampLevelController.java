package com.pk.ls.champLevel.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pk.ls.champ.controller.ChampController;
import com.pk.ls.champ.service.ChampService;
import com.pk.ls.champ.vo.ChampVo;
import com.pk.ls.champLevel.service.ChampLevelService;
import com.pk.ls.champLevel.vo.ChampLevelVo;

@Controller
public class ChampLevelController {

	private static final Logger log = LoggerFactory.getLogger(ChampController.class);

	@Autowired
	private ChampLevelService champLevelService;
	private ChampService champService;
	
	
	
	
}
