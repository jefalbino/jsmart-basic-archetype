package ${package}.rest;

import ${package}.adapter.Adapter;
import ${package}.service.SpringService;

import com.jsmart5.framework.annotation.PathBean;
import com.jsmart5.framework.manager.PathRequestHandler;
import com.jsmart5.framework.manager.WebPathRequest;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

@PathBean(path = "/home/v1/test/{username}")
public class RestBean extends WebPathRequest {

    @Autowired
    private SpringService springService;

    @Override
    public void post(final PathRequestHandler requestHandler) throws Exception {

        String requestPath = requestHandler.getRequestPath();
        System.out.println("Request path: " + requestPath);

        String userPathParam = requestHandler.getPathParam("username");
        System.out.println("User path parameter: " + userPathParam);

        Map<String, String> queryParams = requestHandler.getQueryParams();
        System.out.println("Request query parameters: " + queryParams);

        Adapter adapter = requestHandler.getContentFromJson(Adapter.class);
        System.out.println("JSON converted into class: " + adapter);

        requestHandler.writeResponseAsXml(adapter);
    }

}