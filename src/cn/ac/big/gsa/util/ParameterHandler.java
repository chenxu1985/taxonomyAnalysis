package cn.ac.big.gsa.util;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public final class ParameterHandler {
    private Map<String, List<String>> map;
    private ArrayList<String> paramlist = new ArrayList<String>();

    public ParameterHandler(HttpServletRequest request) {
        map = new HashMap<String, List<String>>();
        paramlist.add("submit");
        for (Enumeration<String> names = request.getParameterNames();names.hasMoreElements(); ) {
            String name = (String) names.nextElement();
            String[] values = request.getParameterValues(name);
            if (values != null && values.length != 0&&!paramlist.contains(name)) {
                List<String> list = null;
                for (int i = 0; i < values.length; i++) {
                    if (values[i] != null && values[i].length() != 0) {
                        if (list == null) {
                            list = new ArrayList<String>();
                        }
                        list.add(values[i]);
                    }
                }
                if (list != null) {
                    map.put(name, list);
                }
            }
        }
    }

    public void append(String name, String value) {
        if (map.containsKey(name)) {
            List<String> list = (List<String>) map.get(name);
            if (!list.contains(value)) {
                list.add(value);
            }
        } else {
            add(name, value);
        }
    }

    public void add(String name, String value) {
        List<String> list = new ArrayList<String>();
        list.add(value);
        map.put(name, list);
    }

    public void remove(String name) {
        map.remove(name);
    }

    @Override
	public String toString() {
        StringBuffer sb = new StringBuffer();
        for (Iterator<String> it = map.keySet().iterator(); it.hasNext(); ) {
            String name = (String) it.next();
	            List<String> list = (List<String>) map.get(name);
	            for (int i = 0; i < list.size(); i++) {
	                String param = (String) list.get(i);
	                try {
	                    param = URLEncoder.encode( (String) list.get(i), "UTF-8");
	                } catch (Exception e) {
	                }
	                if(!"whereStr".equals(name) && !"isFirst".equals(name)){
	                   sb.append(name).append("=").append(param).append("&");
	                }
	            }
        }

        if (sb.indexOf("&") != -1) {
            sb.deleteCharAt(sb.length() - 1);
        }
        return sb.toString();
    }
}
