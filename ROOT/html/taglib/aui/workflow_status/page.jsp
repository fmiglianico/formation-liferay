<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */
--%>

<%@ include file="/html/taglib/aui/workflow_status/init.jsp" %>

<div class="taglib-workflow-status">
	<c:if test="<%= Validator.isNotNull(id) %>">
		<span class="workflow-id"><liferay-ui:message key="id" />: <%= HtmlUtil.escape(id) %></span>
	</c:if>

	<c:if test="<%= Validator.isNotNull(version) %>">
		<span class="workflow-version"><liferay-ui:message key="version" />: <strong><%= version %></strong></span>
	</c:if>

	<%
	String additionalText = StringPool.BLANK;

	if (Validator.isNull(statusMessage)) {
		statusMessage = WorkflowConstants.toLabel(status);

		if (status == WorkflowConstants.STATUS_PENDING) {
			long companyId = BeanPropertiesUtil.getLong(bean, "companyId");
			long groupId = BeanPropertiesUtil.getLong(bean, "groupId");
			long classPK = BeanPropertiesUtil.getLong(bean, "primaryKey");

			StringBundler sb = new StringBundler(4);

			try {
				String workflowStatus = WorkflowInstanceLinkLocalServiceUtil.getState(companyId, groupId, model.getName(), classPK);

				sb.append(StringPool.SPACE);
				sb.append(StringPool.OPEN_PARENTHESIS);
				sb.append(LanguageUtil.get(pageContext, workflowStatus));
				sb.append(StringPool.CLOSE_PARENTHESIS);

				additionalText = sb.toString();
			}
			catch (NoSuchWorkflowInstanceLinkException nswile) {
			}
		}
	}
	%>

	<span class="workflow-status"><liferay-ui:message key="status" />: <strong class="workflow-status-<%= statusMessage %>"><liferay-ui:message key="<%= statusMessage %>" /><%= additionalText %></strong></span>

	<c:if test="<%= Validator.isNotNull(helpMessage) %>">
		<liferay-ui:icon-help message="<%= helpMessage %>" />
	</c:if>
</div>