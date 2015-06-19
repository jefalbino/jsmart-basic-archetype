package ${package}.adapter;

import java.util.Arrays;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Adapter {

    private String input;

    private String[] checkGroup;

    public String getInput() {
        return input;
    }

    public void setInput(String input) {
        this.input = input;
    }

    public String[] getCheckGroup() {
        return checkGroup;
    }

    public void setCheckGroup(String[] checkGroup) {
        this.checkGroup = checkGroup;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Adapter{");
        sb.append("input='").append(input).append('\'');
        sb.append(", checkGroup=").append(Arrays.toString(checkGroup));
        sb.append('}');
        return sb.toString();
    }
}