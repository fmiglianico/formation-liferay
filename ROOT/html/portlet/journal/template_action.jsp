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

<%@ include file="/html/portlet/journal/init.jsp" %>

<%
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);

JournalTemplate template = (JournalTemplate)row.getObject();
%>

<liferay-ui:icon-menu>
	<c:if test="<%= JournalTemplatePermission.contains(permissionChecker, template, ActionKeys.UPDATE) %>">
		<portlet:renderURL var="editeTemplateURL">
			<portlet:param name="struts_action" value="/journal/edit_template" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="groupId" value="<%= String.valueOf(template.getGroupId()) %>" />
			<portlet:param name="templateId" value="<%= template.getTemplateId() %>" />
		</portlet:renderURL>

		<liferay-ui:icon image="edit" url="<%= editeTemplateURL %>" />
	</c:if>

	<c:if test="<%= JournalTemplatePermission.contains(permissionChecker, template, ActionKeys.PERMISSIONS) %>">
		<liferay-security:permissionsURL
			modelResource="<%= JournalTemplate.class.getName() %>"
			modelResourceDescription="<%= template.getName(locale) %>"
			resourcePrimKey="<%= String.valueOf(template.getId()) %>"
			var="permissionsTemplateURL"
		/>

		<liferay-ui:icon image="permissions" url="<%= permissionsTemplateURL %>" />
	</c:if>

	<c:if test="<%= JournalPermission.contains(permissionChecker, scopeGroupId, ActionKeys.ADD_TEMPLATE) %>">
		<portlet:renderURL var="copyURL">
			<portlet:param name="struts_action" value="/journal/copy_template" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="groupId" value="<%= String.valueOf(template.getGroupId()) %>" />
			<portlet:param name="oldTemplateId" value="<%= template.getTemplateId() %>" />
		</portlet:renderURL>

		<liferay-ui:icon image="copy" url="<%= copyURL.toString() %>" />
	</c:if>

	<c:if test="<%= Validator.isNotNull(template.getStructureId()) %>">
		<c:if test="<%= JournalPermission.contains(permissionChecker, scopeGroupId, ActionKeys.ADD_ARTICLE) %>">
			<portlet:renderURL var="addArticleURL">
				<portlet:param name="struts_action" value="/journal/edit_article" />
				<portlet:param name="redirect" value="<%= currentURL %>" />
				<portlet:param name="backURL" value="<%= currentURL %>" />
				<portlet:param name="groupId" value="<%= String.valueOf(template.getGroupId()) %>" />
				<portlet:param name="structureId" value="<%= template.getStructureId() %>" />
				<portlet:param name="templateId" value="<%= template.getTemplateId() %>" />
			</portlet:renderURL>

			<liferay-ui:icon image="add_article" message="add-web-content" url="<%= addArticleURL %>" />
		</c:if>

		<portlet:renderURL var="viewArticlesURL">
			<portlet:param name="struts_action" value="/journal/view" />
			<portlet:param name="tabs1" value="web-content" />
			<portlet:param name="groupId" value="<%= (themeDisplay.getCompanyGroupId() == template.getGroupId()) ? StringPool.BLANK : String.valueOf(template.getGroupId()) %>" />
			<portlet:param name="templateId" value="<%= template.getTemplateId() %>" />
		</portlet:renderURL>

		<liferay-ui:icon image="view_articles" message="view-web-content" url="<%= viewArticlesURL %>" />

		<c:if test="<%= JournalStructurePermission.contains(permissionChecker, scopeGroupId, template.getStructureId(), ActionKeys.UPDATE) %>">
			<portlet:renderURL var="editStructureURL">
				<portlet:param name="struts_action" value="/journal/edit_structure" />
				<portlet:param name="redirect" value="<%= currentURL %>" />
				<portlet:param name="groupId" value="<%= String.valueOf(template.getGroupId()) %>" />
				<portlet:param name="structureId" value="<%= template.getStructureId() %>" />
			</portlet:renderURL>

			<liferay-ui:icon image="view_structures" message="edit-structure" url="<%= editStructureURL %>" />
		</c:if>
	</c:if>

	<c:if test="<%= JournalTemplatePermission.contains(permissionChecker, template, ActionKeys.DELETE) %>">
		<portlet:actionURL var="deleteTemplateURL">
			<portlet:param name="struts_action" value="/journal/edit_template" />
			<portlet:param name="<%= Constants.CMD %>" value="<%= Constants.DELETE %>" />
			<portlet:param name="redirect" value="<%= currentURL %>" />
			<portlet:param name="groupId" value="<%= String.valueOf(template.getGroupId()) %>" />
			<portlet:param name="deleteTemplateIds" value="<%= template.getTemplateId() %>" />
		</portlet:actionURL>

		<liferay-ui:icon-delete url="<%= deleteTemplateURL %>" />
	</c:if>
</liferay-ui:icon-menu>