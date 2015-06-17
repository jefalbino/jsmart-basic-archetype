package ${groupId}.bean;

import com.jsmart5.framework.util.WebText;
import com.jsmart5.framework.manager.WebContext;
import com.jsmart5.framework.annotation.WebBean;
import com.jsmart5.framework.annotation.PreSubmit;

@WebBean
public class HomeBean {

    private String inputValue;

    @PreSubmit(forAction = "buttonAction")
    public boolean preValidate() {
        boolean validated = true;

		if (inputValue == null || inputValue.trim().isEmpty()) {
			WebContext.addError("feedback", WebText.getString("texts", "basic.archetype.action.failure", inputValue));
			validated = false;
		}
        return validated;
    }

    public void buttonAction() {
		WebContext.addSuccess("feedback", WebText.getString("texts", "basic.archetype.action.success", inputValue));
    }

    public String getInputValue() {
		return inputValue;
    }

    public void setInputValue(String inputValue) {
		this.inputValue = inputValue;
    }
}
