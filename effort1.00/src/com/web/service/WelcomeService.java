/**
 * 
 */
package com.web.service;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
/**
 * @author Neelesh Namdev
 *
 */
public interface WelcomeService {
	
	@Secured("ROLE_ADMIN")	
	public void checkSecureAnnotation();
	
}
