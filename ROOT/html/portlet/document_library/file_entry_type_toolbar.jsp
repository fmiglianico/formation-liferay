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

<%@ include file="/html/portlet/document_library/init.jsp" %>

<%
String strutsAction = ParamUtil.getString(request, "strutsAction", "/document_library/view_file_entry_type");

String toolbarItem = ParamUtil.getString(request, "toolbarItem", "view-all");
%>

<div class="lfr-portlet-toolbar">
	<portlet:renderURL var="viewFileEntryTypesURL">
		<portlet:param name="struts_action" value="<%= strutsAction %>" />
	</portlet:renderURL>

	<span class="lfr-toolbar-button view-button <%= toolbarItem.equals("view-all") ? "current" : StringPool.BLANK %>">
		<a href="<%= viewFileEntryTypesURL %>"><liferay-ui:message key="view-all" /></a>
	</span>

	<c:if test="<%= DLPermission.contains(permissionChecker, scopeGroupId, ActionKeys.ADD_DOCUMENT_TYPE) %>">
		<portlet:renderURL var="addFileEntryTypeURL">
			<portlet:param name="struts_action" value="/document_library/edit_file_entry_type" />
			<portlet:param name="redirect" value="<%= viewFileEntryTypesURL %>" />
		</portlet:renderURL>

		<span class="lfr-toolbar-button add-button <%= toolbarItem.equals("add") ? "current" : StringPool.BLANK %>">
			<a href="<%= addFileEntryTypeURL %>"><liferay-ui:message key="add" /></a>
		</span>
	</c:if>
</div>