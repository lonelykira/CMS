package com.shishuo.cms.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

public class MySessionContext {
	private static MySessionContext instance;
    private Map<String, HttpSession> mymap;

    private MySessionContext() {
        mymap = new HashMap<String, HttpSession>();
    }

    public static MySessionContext getInstance() {
        if (instance == null) {
            instance = new MySessionContext();
        }
        return instance;
    }

    public synchronized void AddSession(HttpSession session) {
        if (session != null) {
            mymap.put(session.getId(), session);
        }
    }

    public synchronized void DelSession(HttpSession session) {
        if (session != null) {
            mymap.remove(session.getId());
        }
    }

    public synchronized HttpSession getSession(String session_id) {
        if (session_id == null)
            return null;
        return (HttpSession) mymap.get(session_id);
    }
}
