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

        <!--
            Example of form submitted via Ajax to WebBean mapped on server and alert
            to provide response from server
        -->
        <div class="col-md-6" style="float: none; margin-top: 50px;">

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

            <!--
                Example of asynchronous request using async component to start server event
                from AsyncBean mapped on server
            -->
            <sm:async id="clock" path="/home/clock" withCredentials="false">
                <sm:asyncevent event="clock-event" execute="updateClock" />
            </sm:async>
        </div>

        <!-- Callback functions -->
        <script type="text/javascript">
            function updateClock(event) {
                $('#clock-id').text(event.data);
            }
        </script>
    </body>

</html>
