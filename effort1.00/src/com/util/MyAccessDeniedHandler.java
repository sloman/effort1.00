package com.util;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class MyAccessDeniedHandler
implements AccessDeniedHandler
{

	public MyAccessDeniedHandler()
	{
	}

	public MyAccessDeniedHandler(String accessDeniedUrl)
	{
		this.accessDeniedUrl = accessDeniedUrl;
	}

	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException)
			throws IOException, ServletException
			{
		// LOG.debug("MyAccessDeniedHandler | handler called");
		response.sendRedirect(accessDeniedUrl);
		request.getSession().setAttribute("message", "You do not have permission to access this page!");
			}

	public String getAccessDeniedUrl()
	{
		return accessDeniedUrl;
	}

	public void setAccessDeniedUrl(String accessDeniedUrl)
	{
		this.accessDeniedUrl = accessDeniedUrl;
	}

	//private static final LoggerInterface LOG = LoggerFactory.getLogger(com/utxfrmwk/security/handler/MyAccessDeniedHandler);
	private String accessDeniedUrl;

}