package ${package}.bean;

import com.jsmartframework.web.util.WebText;
import com.jsmartframework.web.manager.WebContext;
import com.jsmartframework.web.annotation.WebBean;
import com.jsmartframework.web.annotation.PreSubmit;

import java.util.Map;
import java.util.HashMap;

import ${package}.service.SpringService;
import org.springframework.beans.factory.annotation.Autowired;

@WebBean
public class HomeBean {

    @Autowired
    private SpringService springService;

    private String inputValue;

    private String radioValue;

    @PreSubmit(onActions = {"buttonAction"})
    public boolean preValidate() {
        boolean validated = true;

		if (inputValue == null || inputValue.trim().isEmpty()) {
			WebContext.addError("feedback", WebText.getString("texts", "basic.archetype.action.failure", inputValue));
			validated = false;
		}
        return validated;
    }

    public void buttonAction() {
		WebContext.addSuccess("feedback", WebText.getString("texts", "basic.archetype.action.success", inputValue, radioValue));
    }

    public String getInputValue() {
		return inputValue;
    }

    public void setInputValue(String inputValue) {
		this.inputValue = inputValue;
    }

    public Map<String, String> getRadioValues() {
        Map<String, String> radioValues = new HashMap<String, String>();
        radioValues.put("radioOne", "valueOne");
        radioValues.put("radioTwo", "valueTwo");
        radioValues.put("radioThree", "valueThree");
        radioValues.put("radioFour", "valueFour");
        return radioValues;
    }

    public String getRadioValue() {
        return this.radioValue;
    }

    public void setRadioValue(String radioValue) {
        this.radioValue = radioValue;
    }
}
