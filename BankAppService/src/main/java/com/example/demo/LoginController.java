package com.example.demo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.example.demo.dto.MenuDto;
import com.example.demo.dto.UserDto;
import com.netflix.appinfo.InstanceInfo;
import com.netflix.discovery.EurekaClient;
import com.netflix.discovery.shared.Application;

@Controller
public class LoginController {
	
	
	 @Autowired
	 private RestTemplate restTemplate;
	 
	 @Autowired
	 private EurekaClient eurekaClient;
	
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	
	
	
	
	
	@RequestMapping(value="login")
	public String goToLoginPage() {
		
		
		return "login.jsp";
	}
	
	
	@RequestMapping(value="dologin",method=RequestMethod.POST)
	public String dologin(Model model,HttpSession session, @RequestParam("username") String username,@RequestParam("password") String password) {
		
		 Application application = eurekaClient.getApplication("admin-service");
	     InstanceInfo instanceInfo = application.getInstances().get(0);
	     String url = "http://" + instanceInfo.getIPAddr() + ":" + instanceInfo.getPort() + "/" + "validateUser?username="+username+"&password="+password;
	     
	    
		
		
		UserDto userDto =   restTemplate.getForObject(url, UserDto.class);
		
		if(userDto == null) {
			return "login.jsp";
		}else {
			
			session.setAttribute("isLoggedIn", true);
			
		
			 url = "http://" + instanceInfo.getIPAddr() + ":" + instanceInfo.getPort() + "/" + "findMenusByUserid?userId="+userDto.getId();
			 
			 List<MenuDto> menus = restTemplate.getForObject(url,List.class);
			
			session.setAttribute("menus", menus);
			
			
			
			return "dashboard.jsp";
		}
		
		
		
	}
	
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:login";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
