<%@ taglib prefix="sm" uri="http://jsmartframework.com/v2/jsp/taglib/jsmart5" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSmart5 Framework - Basic Archetype</title>
    </head>

    <body class="container">

        <!-- Example of form submitted via ajax to WebBean mapped on server and alert to provide response -->
        <div class="col-md-6" style="margin-top: 50px;">


            <!-- Alert to provide response from WebBean -->
            <sm:alert id="feedback">
                <sm:header title="@{texts.basic.archetype.feedback.alert}" />
                <!-- Message will be added via WebContext on HomeBean -->
                <div style="text-align: right;">
                    <sm:button label="I got it!" onClick="$('#feedback').alert('close');"/>
                </div>
            </sm:alert>

            <sm:form>
                <sm:output type="p" value="@{texts.basic.archetype.output.value}" />

                <!--  Input value to be sent to server side -->
                <sm:input label="Input value" value="@{homeBean.inputValue}" placeHolder="Enter the value here">
                    <!-- Validate the input before sending to server. Remove this line and check the PreSubmit in action :) -->
                    <sm:validate text="@{texts.basic.archetype.input.value.required}" />
                </sm:input>

                <sm:radiogroup label="Radio group" selectValue="@{homeBean.radioValue}" inline="true">
                    <sm:checklist values="@{homeBean.radioValues}" />
                    <sm:validate text="At lease one radio must be checked" />
                </sm:radiogroup>

                <sm:button id="archetype-btn" ajax="true" label="Submit Value" action="@{homeBean.buttonAction}">
                    <!-- Glyphicon to be placed inside button -->
                    <sm:icon name="glyphicon-share-alt" />
                    <!-- Animated load will replace the icon during the request -->
                    <sm:load />
                </sm:button>

                <!-- The output below will be updated via async function updateClock -->
                <p style="float: right; margin-top: 10px;">
                    <sm:icon name="glyphicon-time" style="font-size: 15px;" />
                    <sm:output id="clock-id" style="margin-left: 10px;" value="" />
                </p>
            </sm:form>

            <!-- Example of asynchronous request using async component to start server event from AsyncBean mapped on server -->
            <sm:async id="clock" path="/home/clock" withCredentials="false">
                <sm:asyncevent event="clock-event" execute="updateClock" />
            </sm:async>
        </div>


        <!-- Example of REST request sent via rest component to RestBean mapped on server -->
        <div class="col-md-6" style="margin-top: 50px;">

            <!-- The rest component is used to facilitate the process of sending input data via REST request as JSON or XML -->
            <sm:rest endpoint="/home/v1/test/yourname" method="post">
                <sm:output type="p" value="Enter the values below and push the button to send via Rest" />

                <!-- The rest attribute on components indicate the REST attribute name to be sent on payload -->
                <sm:input rest="input" label="@{texts.basic.archetype.input.label}">
                    <sm:validate text="The input value is required" />
                </sm:input>

                <sm:checkgroup label="Check group values" rest="checkGroup" inline="true">
                    <sm:check label="checkOne" value="checkOne"/>
                    <sm:check label="checkTwo" value="checkTwo"/>
                    <sm:check label="checkThree" value="checkThree"/>
                    <sm:check label="checkFour" value="checkFour"/>
                    <sm:validate text="At least one check group check is required" />
                </sm:checkgroup>

                <!-- Here is where the REST request will be triggered, the button attributes to register callbacks for AJAX request phases -->
                <sm:button id="rest-btn" ajax="true" label="Rest Request" onSuccess="requestOk">

                    <!-- This parameters will be sent as query parameters -->
                    <sm:param name="paramOne" value="valueOne" />
                    <sm:param name="paramTwo" value="valueTwo" />

                    <!-- Glyphicon to be placed inside button -->
                    <sm:icon name="glyphicon-globe" />
                    <!-- Animated load will replace the icon during the request -->
                    <sm:load />
                </sm:button>
            </sm:rest>

            <sm:panel id="rest-response" style="display: none; margin-top: 20px;">
                <sm:header title="Rest response" />
                <sm:panelbody id="rest-response-body">
                    <!-- The REST request response will be placed here -->
                </sm:panelbody>
            </sm:panel>
        </div>

        <!-- Callback functions -->
        <script type="text/javascript">
            function updateClock(event) {
                $('#clock-id').text(event.data);
            }
            function requestOk(data, status, xhr) {
                $('#rest-response-body').text(new XMLSerializer().serializeToString(data));
                $('#rest-response').show();
            }
        </script>
    </body>

</html>
