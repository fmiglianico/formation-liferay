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

<%@ include file="/html/portlet/group_statistics/init.jsp" %>

<%
int index = ParamUtil.getInteger(request, "index", GetterUtil.getInteger((String)request.getAttribute("configuration.jsp-index")));

String displayActivityCounterName = PrefsParamUtil.getString(preferences, request, "displayActivityCounterName" + index);
String chartType = PrefsParamUtil.getString(preferences, request, "chartType" + index);
int chartWidth = PrefsParamUtil.getInteger(preferences, request, "chartWidth" + index, 35);
String dataRange = PrefsParamUtil.getString(preferences, request, "dataRange" + index);

List<String> activityCounterNames = SocialConfigurationUtil.getActivityCounterNames(SocialActivityCounterConstants.TYPE_ACTOR);

activityCounterNames.addAll(SocialConfigurationUtil.getActivityCounterNames(SocialActivityCounterConstants.TYPE_ASSET));

activityCounterNames.add(SocialActivityCounterConstants.NAME_ASSET_ACTIVITIES);
activityCounterNames.add(SocialActivityCounterConstants.NAME_USER_ACHIEVEMENTS);
activityCounterNames.add(SocialActivityCounterConstants.NAME_USER_ACTIVITIES);

Collections.sort(activityCounterNames, new SocialActivityCounterNameComparator(locale));
%>

<div class="aui-field-row">
	<span class="aui-field aui-field-inline inline-text">
		<liferay-ui:message key="group-statistics-add-counter-first-text" />
	</span>

	<aui:select inlineField="<%= true %>" label="" name='<%= "preferences--displayActivityCounterName" + index + "--" %>'>

		<%
		for (String activityCounterName : activityCounterNames) {
			if (activityCounterName.equals(SocialActivityCounterConstants.NAME_CONTRIBUTION) || activityCounterName.equals(SocialActivityCounterConstants.NAME_PARTICIPATION)) {
				continue;
			}
		%>

			<aui:option label='<%= LanguageUtil.get(pageContext, "group.statistics.config."+ activityCounterName) %>' selected="<%= activityCounterName.equals(displayActivityCounterName) %>" value="<%= activityCounterName %>" />

		<%
		}
		%>

	</aui:select>

	<span class="aui-field aui-field-inline inline-text">
		<liferay-ui:message key="group-statistics-add-counter-second-text" />
	</span>

	<aui:select inlineField="<%= true %>" label="" name='<%= "preferences--chartType" + index + "--" %>'>
		<aui:option label="group-statistics-chart-type-area-diagram" selected='<%= chartType.equals("area") %>' value="area" />
		<aui:option label="group-statistics-chart-type-column-diagram" selected='<%= chartType.equals("column") %>' value="column" />
		<aui:option label="group-statistics-chart-type-activity-distribution" selected='<%= chartType.equals("pie") %>' value="pie" />
		<aui:option label="group-statistics-chart-type-tag-cloud" selected='<%= chartType.equals("tag-cloud") %>' value="tag-cloud" />
	</aui:select>

	<span class="aui-field aui-field-inline inline-text">
		<liferay-ui:message key="group-statistics-add-counter-third-text" />
	</span>

	<aui:select inlineField="<%= true %>" label="" name='<%= "preferences--dataRange" + index + "--" %>'>
		<aui:option label="group-statistics-data-range-this-year" selected='<%= dataRange.equals("year") %>' value="year" />
		<aui:option label="group-statistics-data-range-last-12-months" selected='<%= dataRange.equals("12months") %>' value="12months" />
	</aui:select>
</div>

<div class="aui-field-row">
	<span class="aui-field aui-field-inline inline-text">
		<liferay-ui:message key="chart-width" />:
	</span>

	<aui:select inlineField="<%= true %>" label="" name='<%= "preferences--chartWidth" + index + "--" %>'>

		<%
		for (int i = 5; i < 100; i = i + 5) {
		%>

			<aui:option label="<%= i + StringPool.PERCENT %>" selected="<%= chartWidth == i %>" value="<%= i %>" />

		<%
		}
		%>

	</aui:select>
</div>