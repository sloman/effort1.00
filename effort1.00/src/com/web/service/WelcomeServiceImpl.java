/**
 * 
 */
package com.web.service;

import org.springframework.stereotype.Service;

/**
 * @author Neelesh Namdev
 *
 */
@Service("welcomeService")
public class WelcomeServiceImpl implements WelcomeService {

	@Override	
	public void checkSecureAnnotation() {
		
		System.out.println("welCome service check method invoked");
		
	}

}
