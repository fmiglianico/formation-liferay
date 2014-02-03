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

<%@ include file="/html/portlet/staging_bar/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");

LayoutSetBranch layoutSetBranch = null;

long layoutSetBranchId = ParamUtil.getLong(request, "layoutSetBranchId");

if (layoutSetBranchId > 0) {
	layoutSetBranch = LayoutSetBranchLocalServiceUtil.getLayoutSetBranch(layoutSetBranchId);
}
%>

<div class='<%= (layoutSetBranch != null) ? StringPool.BLANK : "aui-helper-hidden" %>' data-namespace="<portlet:namespace />" id="<portlet:namespace /><%= layoutSetBranch != null ? "updateBranch" : "addBranch" %>">
	<aui:model-context bean="<%= layoutSetBranch %>" model="<%= LayoutSetBranch.class %>" />

	<portlet:actionURL var="editLayoutSetBranchURL">
		<portlet:param name="struts_action" value="/staging_bar/edit_layout_set_branch" />
	</portlet:actionURL>

	<aui:form action="<%= editLayoutSetBranchURL %>" enctype="multipart/form-data" method="post" name="fm3">
		<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= layoutSetBranch != null ? Constants.UPDATE : Constants.ADD %>" />
		<aui:input name="redirect" type="hidden" value="<%= redirect %>" />
		<aui:input name="groupId" type="hidden" value="<%= stagingGroup.getGroupId() %>" />
		<aui:input name="privateLayout" type="hidden" value="<%= privateLayout %>" />
		<aui:input name="layoutSetBranchId" type="hidden" value="<%= layoutSetBranchId %>" />
		<aui:input name="workflowAction" type="hidden" value="<%= WorkflowConstants.ACTION_SAVE_DRAFT %>" />

		<aui:fieldset>
			<aui:input name="name" />

			<aui:input name="description" />

			<c:if test="<%= layoutSetBranch == null %>">

				<%
				List<LayoutSetBranch> layoutSetBranches = LayoutSetBranchLocalServiceUtil.getLayoutSetBranches(stagingGroup.getGroupId(), privateLayout);
				%>

				<aui:select helpMessage="copy-pages-from-site-pages-variation-help" label="copy-pages-from-site-pages-variation" name="copyLayoutSetBranchId">
					<aui:option label="all-site-pages-variations" selected="<%= true %>" value="<%= LayoutSetBranchConstants.ALL_BRANCHES %>" />
					<aui:option label="none-empty-site-pages-variation" value="<%= LayoutSetBranchConstants.NO_BRANCHES %>" />

					<%
					for (LayoutSetBranch curLayoutSetBranch : layoutSetBranches) {
					%>

						<aui:option label="<%= HtmlUtil.escape(curLayoutSetBranch.getName()) %>" value="<%= curLayoutSetBranch.getLayoutSetBranchId() %>" />

					<%
					}
					%>

				</aui:select>
			</c:if>
		</aui:fieldset>

		<aui:button-row>
			<aui:button type="submit" value='<%= (layoutSetBranch != null) ? "update" : "add" %>' />
		</aui:button-row>
	</aui:form>
</div>