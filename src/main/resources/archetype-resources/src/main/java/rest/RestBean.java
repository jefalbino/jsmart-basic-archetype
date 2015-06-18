package ${groupId}.rest;

import com.jsmart5.framework.annotation.PathBean;
import com.jsmart5.framework.manager.WebPathRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;

@PathBean(path = "/home/v1")
public class RestBean extends WebPathRequest {

    @Override
    public void post(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String line = null;
        final StringBuffer sb = new StringBuffer();

        BufferedReader reader = request.getReader();
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        System.out.println(request.getQueryString());
        System.out.println(sb.toString());
    }
}