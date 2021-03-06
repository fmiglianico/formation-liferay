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

<%@ include file="/html/portlet/nested_portlets/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");
%>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationURL" />

<aui:form action="<%= configurationURL %>" method="post" name="fm">
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
	<aui:input name="redirect" type="hidden" value="<%= redirect %>" />

	<aui:fieldset label="layout-template">
		<table border="0" cellpadding="0" cellspacing="10" style="margin-top: 10px;" width="100%">

		<%
		int CELLS_PER_ROW = 4;

		String layoutTemplateId = preferences.getValue("layoutTemplateId", PropsValues.NESTED_PORTLETS_LAYOUT_TEMPLATE_DEFAULT);

		List<LayoutTemplate> layoutTemplates = LayoutTemplateLocalServiceUtil.getLayoutTemplates(theme.getThemeId());

		layoutTemplates = PluginUtil.restrictPlugins(layoutTemplates, user);

		List<String> unsupportedLayoutTemplates = ListUtil.fromArray(PropsUtil.getArray(PropsKeys.NESTED_PORTLETS_LAYOUT_TEMPLATE_UNSUPPORTED));

		int i = 0;

		for (LayoutTemplate layoutTemplate : layoutTemplates) {
			if (!unsupportedLayoutTemplates.contains(layoutTemplate.getLayoutTemplateId())) {
		%>

				<c:if test="<%= (i % CELLS_PER_ROW) == 0 %>">
					<tr>
				</c:if>

				<td align="center" width="<%= 100 / CELLS_PER_ROW %>%">
					<img onclick="document.getElementById('<portlet:namespace />layoutTemplateId<%= i %>').checked = true;" src="<%= layoutTemplate.getStaticResourcePath() %><%= layoutTemplate.getThumbnailPath() %>" /><br />

					<aui:input checked="<%= layoutTemplateId.equals(layoutTemplate.getLayoutTemplateId()) %>" id='<%= "layoutTemplateId" + i %>' label="<%= layoutTemplate.getName() %>" name="preferences--layoutTemplateId--" type="radio" value="<%= layoutTemplate.getLayoutTemplateId() %>" />
				</td>

				<c:if test="<%= (i % CELLS_PER_ROW) == (CELLS_PER_ROW - 1) %>">
					</tr>
				</c:if>

		<%
				i++;
			}
		}
		%>

		</table>
	</aui:fieldset>

	<%
	boolean portletDecorateDefault = GetterUtil.getBoolean(themeDisplay.getThemeSetting("portlet-setup-show-borders-default"), true);

	boolean portletSetupShowBorders = GetterUtil.getBoolean(preferences.getValue("portletSetupShowBorders", String.valueOf(portletDecorateDefault)));
	%>

	<aui:fieldset label="display-settings">
		<aui:input label="show-borders" name="preferences--portletSetupShowBorders--" type="checkbox" value="<%= portletSetupShowBorders %>" />
	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>