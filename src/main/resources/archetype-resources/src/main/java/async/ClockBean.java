package ${groupId}.async;

import com.jsmart5.framework.annotation.AsyncBean;
import com.jsmart5.framework.listener.WebAsyncListener;

import javax.servlet.AsyncContext;
import javax.servlet.ServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@AsyncBean(asyncPath = "/home/clock")
public class ClockBean implements WebAsyncListener {

    private volatile boolean finished = false;

    @Override
    public void asyncContextCreated(final AsyncContext asyncContext) {
        asyncContext.setTimeout(300000);
        asyncContext.start(new Runnable() {

            @Override
            public void run() {
                try {
                    while (!finished) {
                        final ServletResponse response = asyncContext.getResponse();
                        response.setContentType("text/event-stream");

                        PrintWriter printWriter = response.getWriter();
                        printWriter.write("event:clock-event" + "\n");
                        printWriter.write("data:" + new Date() + "\n\n");
                        printWriter.flush();

                        Thread.sleep(1000);
                    }
                } catch (IOException | InterruptedException e) {
                    asyncContext.complete();
                    e.printStackTrace();
                }
            }
        });
    }

    @Override
    public void asyncContextDestroyed(AsyncContext asyncContext, Reason reason) {
        if (reason == Reason.TIMEOUT) {
            asyncContext.complete();
        }
        finished = true;
    }

}