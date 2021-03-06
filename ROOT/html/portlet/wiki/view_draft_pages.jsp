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

<%@ include file="/html/portlet/wiki/init.jsp" %>

<liferay-util:include page="/html/portlet/wiki/top_links.jsp" />

<liferay-ui:header
	title="draft-pages"
/>

<liferay-util:include page="/html/portlet/wiki/page_iterator.jsp">
	<liferay-util:param name="type" value="draft_pages" />
</liferay-util:include>

<c:if test="<%= WorkflowDefinitionLinkLocalServiceUtil.hasWorkflowDefinitionLink(company.getCompanyId(), scopeGroupId, WikiPage.class.getName()) %>">
	<h2><liferay-ui:message key="pending-approval" /></h2>

	<liferay-util:include page="/html/portlet/wiki/page_iterator.jsp">
		<liferay-util:param name="type" value="pending_pages" />
	</liferay-util:include>
</c:if>