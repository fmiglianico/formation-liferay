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
AssetRendererFactory assetRendererFactory = (AssetRendererFactory)request.getAttribute(WebKeys.ASSET_RENDERER_FACTORY);

JournalArticle article = (JournalArticle)request.getAttribute(WebKeys.JOURNAL_ARTICLE);
JournalArticleResource articleResource = JournalArticleResourceLocalServiceUtil.getArticleResource(article.getResourcePrimKey());

String templateId = (String)request.getAttribute(WebKeys.JOURNAL_TEMPLATE_ID);
String languageId = LanguageUtil.getLanguageId(request);
int articlePage = ParamUtil.getInteger(request, "page", 1);
String xmlRequest = PortletRequestUtil.toXML(renderRequest, renderResponse);

boolean workflowAssetPreview = ParamUtil.getBoolean(request, "workflowAssetPreview");

JournalArticleDisplay articleDisplay = null;

if (!workflowAssetPreview && article.isApproved()) {
	articleDisplay = JournalContentUtil.getDisplay(articleResource.getGroupId(), articleResource.getArticleId(), article.getVersion(), templateId, null, languageId, themeDisplay, articlePage, xmlRequest);
}
else {
	articleDisplay = JournalArticleLocalServiceUtil.getArticleDisplay(article, null, null, languageId, 1, null, themeDisplay);
}
%>

<div class="journal-content-article">
	<%= RuntimePortletUtil.processXML(application, request, response, renderRequest, renderResponse, articleDisplay.getContent()) %>
</div>

<c:if test="<%= articleDisplay.isPaginate() %>">

	<%
	String pageRedirect = ParamUtil.getString(request, "redirect");

	if (Validator.isNull(pageRedirect)) {
		pageRedirect = currentURL;
	}

	int cur = ParamUtil.getInteger(request, "cur");

	PortletURL articlePageURL = renderResponse.createRenderURL();

	articlePageURL.setParameter("struts_action", "/asset_publisher/view_content");
	articlePageURL.setParameter("type", assetRendererFactory.getType());
	articlePageURL.setParameter("redirect", pageRedirect);
	articlePageURL.setParameter("urlTitle", articleDisplay.getUrlTitle());
	articlePageURL.setParameter("cur", String.valueOf(cur));
	%>

	<br />

	<liferay-ui:page-iterator
		cur="<%= articleDisplay.getCurrentPage() %>"
		curParam="page"
		delta="<%= 1 %>"
		id="articleDisplayPages"
		maxPages="<%= 25 %>"
		total="<%= articleDisplay.getNumberOfPages() %>"
		type="article"
		url="<%= articlePageURL.toString() %>"
	/>

	<br />
</c:if>