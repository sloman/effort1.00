package com.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.WelcomeService;

@Controller
public class MainController {
	
	@Autowired
	WelcomeService welcomeService;
	
	@RequestMapping("/helloWorld")
    @ResponseBody public  String helloWorld(Model model) {
        //model.addAttribute("message", "Hello World!");
    	
    	String password = "admin";
    	PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    	String encodedPassword = passwordEncoder.encode(password);
    	System.out.println("password:"+password);
    	System.out.println("encodedPassword:"+encodedPassword);
        return encodedPassword;
    }

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		
		ModelAndView model = new ModelAndView();
		
		model.addObject("title", "Effort1.01");
		model.addObject("message", "welcome ");
		model.setViewName("hello");
		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {
		System.out.println("adminPage method invoked");
		welcomeService.checkSecureAnnotation();
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Limit Login - XML");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}
	
	/**
	 * This update page is for user login with password only.
	 * If user is logjn via remember me cookie, send login to ask for password again.
	 * To avoid stolen remember me cookie to update anything
	 */
	@RequestMapping(value = "/admin/update**", method = RequestMethod.GET)
	public ModelAndView updatePage(HttpServletRequest request) {

		ModelAndView model = new ModelAndView();

		if (isRememberMeAuthenticated()) {
			//send login for update
			setRememberMeTargetUrlToSession(request);
			model.addObject("loginUpdate", true);
			model.setViewName("/login");
			
		} else {
			model.setViewName("update");
		}

		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
			
			//login form for update, if login error, get the targetUrl from session again.
			String targetUrl = getRememberMeTargetUrlFromSession(request);
			System.out.println(targetUrl);
			if(StringUtils.hasText(targetUrl)){
				model.addObject("targetUrl", targetUrl);
				model.addObject("loginUpdate", true);
			}
			
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Invalid username and password!";
		}

		return error;
	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}
	@PreAuthorize("hasAuthority('ROLE_TELLER')")
	public void checkSecureAnnotation(){
		System.out.println("check security wroked.");
		
	}
	
	/**
	 * If the login in from remember me cookie, refer
	 * org.springframework.security.authentication.AuthenticationTrustResolverImpl
	 */
	private boolean isRememberMeAuthenticated() {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null) {
			return false;
		}

		return RememberMeAuthenticationToken.class.isAssignableFrom(authentication.getClass());
	}
	
	/**
	 * save targetURL in session
	 */
	private void setRememberMeTargetUrlToSession(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.setAttribute("targetUrl", "/admin/update");
		}
	}

	/**
	 * get targetURL from session
	 */
	private String getRememberMeTargetUrlFromSession(HttpServletRequest request){
		String targetUrl = "";
		HttpSession session = request.getSession(false);
		if(session!=null){
			targetUrl = session.getAttribute("targetUrl")==null?"":session.getAttribute("targetUrl").toString();
		}
		return targetUrl;
	}
	
}