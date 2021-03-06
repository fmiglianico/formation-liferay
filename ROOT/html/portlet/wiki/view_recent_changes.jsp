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

<%
WikiNode node = (WikiNode)request.getAttribute(WebKeys.WIKI_NODE);
%>

<liferay-util:include page="/html/portlet/wiki/top_links.jsp" />

<liferay-ui:header
	title="recent-changes"
/>

<liferay-util:include page="/html/portlet/wiki/page_iterator.jsp">
	<liferay-util:param name="type" value="recent_changes" />
</liferay-util:include>

<br />

<liferay-ui:icon-list>
	<liferay-ui:icon
		image="rss"
		label="<%= true %>"
		message="Atom 1.0"
		target="_blank"
		url='<%= themeDisplay.getPathMain() + "/wiki/rss?p_l_id=" + plid + "&nodeId=" + node.getNodeId() + rssURLAtomParams %>'
	/>

	<liferay-ui:icon
		image="rss"
		label="<%= true %>"
		message="RSS 1.0"
		target="_blank"
		url='<%= themeDisplay.getPathMain() + "/wiki/rss?p_l_id=" + plid + "&nodeId=" + node.getNodeId() + rssURLRSS10Params %>'
	/>

	<liferay-ui:icon
		image="rss"
		label="<%= true %>"
		message="RSS 2.0"
		target="_blank"
		url='<%= themeDisplay.getPathMain() + "/wiki/rss?p_l_id=" + plid + "&nodeId=" + node.getNodeId() + rssURLRSS20Params %>'
	/>
</liferay-ui:icon-list>