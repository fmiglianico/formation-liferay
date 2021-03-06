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

<%@ include file="/html/taglib/ui/categorization_filter/init.jsp" %>

<%
String assetType = GetterUtil.getString((String)request.getAttribute("liferay-ui:categorization-filter:assetType"), "content");
PortletURL portletURL = (PortletURL)request.getAttribute("liferay-ui:categorization-filter:portletURL");

if (Validator.isNull(portletURL)) {
	portletURL = renderResponse.createRenderURL();
}

long assetCategoryId = ParamUtil.getLong(request, "categoryId");
String assetTagName = ParamUtil.getString(request, "tag");

String assetCategoryTitle = null;
String assetVocabularyTitle = null;

if (assetCategoryId != 0) {
	AssetCategory assetCategory = AssetCategoryLocalServiceUtil.getAssetCategory(assetCategoryId);

	assetCategory = assetCategory.toEscapedModel();

	assetCategoryTitle = assetCategory.getTitle(locale);

	AssetVocabulary assetVocabulary = AssetVocabularyLocalServiceUtil.getAssetVocabulary(assetCategory.getVocabularyId());

	assetVocabulary = assetVocabulary.toEscapedModel();

	assetVocabularyTitle = assetVocabulary.getTitle(locale);
}
%>

<liferay-util:buffer var="removeCategory">
	<c:if test="<%= assetCategoryId != 0 %>">
		<span class="asset-entry">
			<%= assetCategoryTitle %>

			<portlet:renderURL var="viewURLWithoutCategory">
				<portlet:param name="categoryId" value="0" />
			</portlet:renderURL>

			<a href="<%= viewURLWithoutCategory %>" title="<liferay-ui:message key="remove" />">
				<span class="aui-icon aui-icon-close aui-textboxlistentry-close"></span>
			</a>
		</span>
	</c:if>
</liferay-util:buffer>

<liferay-util:buffer var="removeTag">
	<c:if test="<%= Validator.isNotNull(assetTagName) %>">
		<span class="asset-entry">
			<%= HtmlUtil.escape(assetTagName) %>

			<liferay-portlet:renderURL allowEmptyParam="<%= true %>" var="viewURLWithoutTag">
				<liferay-portlet:param name="tag" value="" />
			</liferay-portlet:renderURL>

			<a href="<%= viewURLWithoutTag %>" title="<liferay-ui:message key="remove" />">
				<span class="aui-icon aui-icon-close aui-textboxlistentry-close"></span>
			</a>
		</span>
	</c:if>
</liferay-util:buffer>

<c:choose>
	<c:when test="<%= (assetCategoryId != 0) && Validator.isNotNull(assetTagName) %>">

		<%
		AssetUtil.addPortletBreadcrumbEntries(assetCategoryId, request, portletURL);

		PortalUtil.addPortletBreadcrumbEntry(request, assetTagName, currentURL);

		PortalUtil.addPageKeywords(assetCategoryTitle, request);
		PortalUtil.addPageKeywords(assetTagName, request);
		%>

		<h1 class="taglib-categorization-filter entry-title">
			<liferay-ui:message arguments="<%= new String[] {assetVocabularyTitle, removeCategory, removeTag} %>" key='<%= assetType.concat("-with-x-x-and-tag-x") %>' />
		</h1>
	</c:when>
	<c:when test="<%= assetCategoryId != 0 %>">

		<%
		AssetUtil.addPortletBreadcrumbEntries(assetCategoryId, request, portletURL);

		PortalUtil.addPageKeywords(assetCategoryTitle, request);
		%>

		<h1 class="taglib-categorization-filter entry-title">
			<liferay-ui:message arguments="<%= new String[] {assetVocabularyTitle, removeCategory} %>" key='<%= assetType.concat("-with-x-x") %>' />
		</h1>
	</c:when>
	<c:when test="<%= Validator.isNotNull(assetTagName) %>">

		<%
		PortalUtil.addPortletBreadcrumbEntry(request, assetTagName, currentURL);

		PortalUtil.addPageKeywords(assetTagName, request);
		%>

		<h1 class="taglib-categorization-filter entry-title">
			<liferay-ui:message arguments="<%= removeTag %>" key='<%= assetType.concat("-with-tag-x") %>' />
		</h1>
	</c:when>
</c:choose>