package ${groupId}.filter;

import com.jsmart5.framework.annotation.SmartFilter;

import javax.servlet.*;
import java.io.IOException;

@SmartFilter(order = 1)
public class CustomFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // DO NOTHING
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // DO NOTHING
    }
}
