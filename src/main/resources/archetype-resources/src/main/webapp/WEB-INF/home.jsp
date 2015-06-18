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
        <div class="col-md-6" style="margin-top: 50px;">

            <!-- Alert to provide response from server -->
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

                <sm:button id="archetype-btn" ajax="true" label="Submit Value" action="@{homeBean.buttonAction}">
                    <!-- Glyphicon to be placed inside button -->
                    <sm:icon name="glyphicon-share-alt" />
                    <!-- Animated load will replace the icon during the request -->
                    <sm:load />
                </sm:button>

                <p style="float: right; margin-top: 10px;">
                    <sm:icon name="glyphicon-time" style="font-size: 15px;" />
                    <sm:output id="clock-id" style="margin-left: 10px;" value="" />
                </p>
            </sm:form>

            <sm:async id="clock" path="/home/clock" withCredentials="false">
                <sm:asyncevent event="clock-event" execute="updateClock" />
            </sm:async>
        </div>

        <div class="col-md-6" style="margin-top: 50px;">

            <sm:rest endpoint="/home/v1/test" method="post">
                <sm:output type="p" value="Enter the values below and push the button to send via Rest" />

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

                <sm:button id="rest-btn" ajax="true" label="Rest Request" onSuccess="requestOk">
                    <sm:icon name="glyphicon-globe" />
                    <sm:load />
                    <sm:param name="paramOne" value="valueOne" />
                    <sm:param name="paramTwo" value="valueTwo" />
                </sm:button>
            </sm:rest>
        </div>

        <script type="text/javascript">
            function updateClock(event) {
                $('#clock-id').text(event.data);
            }
            function requestOk(data, status, xhr) {
                console.log(data);
            }
        </script>
    </body>

</html>
