package ${groupId}.rest;

import com.jsmart5.framework.annotation.PathBean;
import com.jsmart5.framework.manager.PathRequestHandler;
import com.jsmart5.framework.manager.WebPathRequest;
import ${groupId}.adapter.Adapter;


@PathBean(path = "/home/v1/{user}")
public class RestBean extends WebPathRequest {

    @Override
    public void post(final PathRequestHandler requestHandler) throws Exception {

        System.out.println(requestHandler.getRequestPath());

        System.out.println(requestHandler.getPathParam("user"));

        System.out.println(requestHandler.getQueryParams());

        System.out.println(requestHandler.getContentAsString());

        System.out.println(requestHandler.getContentFromJson(Adapter.class));
    }

}