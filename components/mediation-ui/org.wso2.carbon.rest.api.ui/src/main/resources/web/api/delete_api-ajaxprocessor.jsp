<%--
  ~  Copyright (c) 2008, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
  ~
  ~  Licensed under the Apache License, Version 2.0 (the "License");
  ~  you may not use this file except in compliance with the License.
  ~  You may obtain a copy of the License at
  ~
  ~        http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~  Unless required by applicable law or agreed to in writing, software
  ~  distributed under the License is distributed on an "AS IS" BASIS,
  ~  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~  See the License for the specific language governing permissions and
  ~  limitations under the License.
  --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="org.wso2.carbon.rest.api.ui.client.RestApiAdminClient"%>
<%@ page import="org.wso2.carbon.ui.CarbonUIUtil" %>
<%@ page import="org.apache.axis2.context.ConfigurationContext" %>
<%@ page import="org.wso2.carbon.CarbonConstants" %>
<%@ page import="org.wso2.carbon.utils.ServerConstants" %>
<%@ page import="java.util.Properties" %>
<%@ page import="org.wso2.carbon.ui.CarbonUIMessage" %>
<%@ page import="java.util.ResourceBundle" %>

<%
	//ignore methods other than post
	if (!request.getMethod().equalsIgnoreCase("POST")) {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		return;
	}
	String apiName = request.getParameter("apiName");

	ResourceBundle bundle = ResourceBundle.getBundle(
			"org.wso2.carbon.rest.api.ui.i18n.Resources",
			request.getLocale());
	String url = CarbonUIUtil.getServerURL(this.getServletConfig()
			.getServletContext(), session);
	ConfigurationContext configContext = (ConfigurationContext) config
			.getServletContext().getAttribute(
					CarbonConstants.CONFIGURATION_CONTEXT);
	String cookie = (String) session
			.getAttribute(ServerConstants.ADMIN_SERVICE_COOKIE);
	RestApiAdminClient client = new RestApiAdminClient(configContext,
			url, cookie, bundle.getLocale());
	
	client.deleteApi(apiName);
%>

