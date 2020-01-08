package kosta.namtang.talkbook.util;

import kosta.namtang.talkbook.model.domain.User;

import javax.servlet.http.HttpSession;

public class UserSessionUtil {
    public static final String USER_SESSION_KEY = "user";

    public static User getUserFromSession(HttpSession session) {
        Object user = session.getAttribute(USER_SESSION_KEY);
        if (user == null) {
            return null;
        }
        return (User) user;
    }

    public static boolean isLogined(HttpSession session) {
        if (getUserFromSession(session) == null) {
            return false;
        }
        return true;
    }
    
    public static void clearSession(HttpSession session) {
    	if (getUserFromSession(session) == null) {
            return;
        }
    	
    	session.invalidate();
    }
}
