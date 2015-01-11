package com.web.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.users.dao.UserDetailsDao;
import com.users.model.UserAttempts;

public class LimitLoginAuthenticationProvider extends DaoAuthenticationProvider {

	UserDetailsDao userDetailsDao;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		try {

			Authentication auth = super.authenticate(authentication);

			// if reach here, means login success, else exception will be thrown
			// reset the user_attempts
			System.out.println(authentication.getName());
			userDetailsDao.resetFailAttempts(authentication.getName());

			return auth;

		} catch (BadCredentialsException e) {

			userDetailsDao.updateFailAttempts(authentication.getName());
			throw e;

		} catch (LockedException e) {

			String error = "";
			UserAttempts userAttempts = userDetailsDao.getUserAttempts(authentication.getName());
			if (userAttempts != null) {
				Date lastAttempts = userAttempts.getLastModified();
				SimpleDateFormat ft = 
					      new SimpleDateFormat ("E dd-MM-yyyy 'at' hh:mm:ss a zzz");
				System.out.println(ft.format(lastAttempts));
				error = "User account is locked! <br><br>Username : " + authentication.getName()
						+ "<br>Last Attempts : " + ft.format(lastAttempts);
			} else {
				error = e.getMessage();
			}

			throw new LockedException(error);
		}

	}

	public UserDetailsDao getUserDetailsDao() {
		return userDetailsDao;
	}

	public void setUserDetailsDao(UserDetailsDao userDetailsDao) {
		this.userDetailsDao = userDetailsDao;
	}

}