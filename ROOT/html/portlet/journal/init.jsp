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

<%@ include file="/html/portlet/init.jsp" %>

<%@ page import="com.liferay.portal.LocaleException" %><%@
page import="com.liferay.portal.NoSuchLayoutException" %><%@
page import="com.liferay.portal.kernel.editor.EditorUtil" %><%@
page import="com.liferay.portal.kernel.xml.Document" %><%@
page import="com.liferay.portal.kernel.xml.Element" %><%@
page import="com.liferay.portal.kernel.xml.Node" %><%@
page import="com.liferay.portal.kernel.xml.SAXReaderUtil" %><%@
page import="com.liferay.portal.kernel.xml.XPath" %><%@
page import="com.liferay.portal.util.LayoutLister" %><%@
page import="com.liferay.portal.util.LayoutView" %><%@
page import="com.liferay.portlet.asset.AssetRendererFactoryRegistryUtil" %><%@
page import="com.liferay.portlet.asset.NoSuchEntryException" %><%@
page import="com.liferay.portlet.asset.model.AssetEntry" %><%@
page import="com.liferay.portlet.asset.model.AssetRenderer" %><%@
page import="com.liferay.portlet.asset.model.AssetRendererFactory" %><%@
page import="com.liferay.portlet.asset.service.AssetEntryLocalServiceUtil" %><%@
page import="com.liferay.portlet.journal.ArticleContentException" %><%@
page import="com.liferay.portlet.journal.ArticleContentSizeException" %><%@
page import="com.liferay.portlet.journal.ArticleDisplayDateException" %><%@
page import="com.liferay.portlet.journal.ArticleExpirationDateException" %><%@
page import="com.liferay.portlet.journal.ArticleIdException" %><%@
page import="com.liferay.portlet.journal.ArticleSmallImageNameException" %><%@
page import="com.liferay.portlet.journal.ArticleSmallImageSizeException" %><%@
page import="com.liferay.portlet.journal.ArticleTitleException" %><%@
page import="com.liferay.portlet.journal.ArticleTypeException" %><%@
page import="com.liferay.portlet.journal.ArticleVersionException" %><%@
page import="com.liferay.portlet.journal.DuplicateArticleIdException" %><%@
page import="com.liferay.portlet.journal.DuplicateFeedIdException" %><%@
page import="com.liferay.portlet.journal.DuplicateStructureElementException" %><%@
page import="com.liferay.portlet.journal.DuplicateStructureIdException" %><%@
page import="com.liferay.portlet.journal.DuplicateTemplateIdException" %><%@
page import="com.liferay.portlet.journal.FeedContentFieldException" %><%@
page import="com.liferay.portlet.journal.FeedIdException" %><%@
page import="com.liferay.portlet.journal.FeedNameException" %><%@
page import="com.liferay.portlet.journal.FeedTargetLayoutFriendlyUrlException" %><%@
page import="com.liferay.portlet.journal.FeedTargetPortletIdException" %><%@
page import="com.liferay.portlet.journal.NoSuchArticleException" %><%@
page import="com.liferay.portlet.journal.NoSuchStructureException" %><%@
page import="com.liferay.portlet.journal.NoSuchTemplateException" %><%@
page import="com.liferay.portlet.journal.RequiredStructureException" %><%@
page import="com.liferay.portlet.journal.RequiredTemplateException" %><%@
page import="com.liferay.portlet.journal.StructureIdException" %><%@
page import="com.liferay.portlet.journal.StructureInheritanceException" %><%@
page import="com.liferay.portlet.journal.StructureNameException" %><%@
page import="com.liferay.portlet.journal.StructureXsdException" %><%@
page import="com.liferay.portlet.journal.TemplateIdException" %><%@
page import="com.liferay.portlet.journal.TemplateNameException" %><%@
page import="com.liferay.portlet.journal.TemplateSmallImageNameException" %><%@
page import="com.liferay.portlet.journal.TemplateSmallImageSizeException" %><%@
page import="com.liferay.portlet.journal.TemplateXslException" %><%@
page import="com.liferay.portlet.journal.action.EditArticleAction" %><%@
page import="com.liferay.portlet.journal.model.JournalArticle" %><%@
page import="com.liferay.portlet.journal.model.JournalArticleConstants" %><%@
page import="com.liferay.portlet.journal.model.JournalArticleDisplay" %><%@
page import="com.liferay.portlet.journal.model.JournalArticleResource" %><%@
page import="com.liferay.portlet.journal.model.JournalFeed" %><%@
page import="com.liferay.portlet.journal.model.JournalFeedConstants" %><%@
page import="com.liferay.portlet.journal.model.JournalStructure" %><%@
page import="com.liferay.portlet.journal.model.JournalTemplate" %><%@
page import="com.liferay.portlet.journal.model.JournalTemplateConstants" %><%@
page import="com.liferay.portlet.journal.model.impl.JournalArticleImpl" %><%@
page import="com.liferay.portlet.journal.search.ArticleDisplayTerms" %><%@
page import="com.liferay.portlet.journal.search.ArticleSearch" %><%@
page import="com.liferay.portlet.journal.search.ArticleSearchTerms" %><%@
page import="com.liferay.portlet.journal.search.FeedDisplayTerms" %><%@
page import="com.liferay.portlet.journal.search.FeedSearch" %><%@
page import="com.liferay.portlet.journal.search.FeedSearchTerms" %><%@
page import="com.liferay.portlet.journal.search.StructureDisplayTerms" %><%@
page import="com.liferay.portlet.journal.search.StructureSearch" %><%@
page import="com.liferay.portlet.journal.search.StructureSearchTerms" %><%@
page import="com.liferay.portlet.journal.search.TemplateDisplayTerms" %><%@
page import="com.liferay.portlet.journal.search.TemplateSearch" %><%@
page import="com.liferay.portlet.journal.search.TemplateSearchTerms" %><%@
page import="com.liferay.portlet.journal.service.JournalArticleLocalServiceUtil" %><%@
page import="com.liferay.portlet.journal.service.JournalArticleResourceLocalServiceUtil" %><%@
page import="com.liferay.portlet.journal.service.JournalArticleServiceUtil" %><%@
page import="com.liferay.portlet.journal.service.JournalFeedLocalServiceUtil" %><%@
page import="com.liferay.portlet.journal.service.JournalStructureLocalServiceUtil" %><%@
page import="com.liferay.portlet.journal.service.JournalStructureServiceUtil" %><%@
page import="com.liferay.portlet.journal.service.JournalTemplateLocalServiceUtil" %><%@
page import="com.liferay.portlet.journal.service.JournalTemplateServiceUtil" %><%@
page import="com.liferay.portlet.journal.service.permission.JournalArticlePermission" %><%@
page import="com.liferay.portlet.journal.service.permission.JournalFeedPermission" %><%@
page import="com.liferay.portlet.journal.service.permission.JournalPermission" %><%@
page import="com.liferay.portlet.journal.service.permission.JournalStructurePermission" %><%@
page import="com.liferay.portlet.journal.service.permission.JournalTemplatePermission" %><%@
page import="com.liferay.portlet.journal.util.JournalUtil" %><%@
page import="com.liferay.portlet.journalcontent.util.JournalContentUtil" %><%@
page import="com.liferay.portlet.layoutconfiguration.util.RuntimePortletUtil" %><%@
page import="com.liferay.util.RSSUtil" %>

<%@ page import="java.net.URLDecoder" %>

<%
PortalPreferences portalPreferences = PortletPreferencesFactoryUtil.getPortalPreferences(request);

Format dateFormatDateTime = FastDateFormatFactoryUtil.getDateTime(locale, timeZone);
%>

<%@ include file="/html/portlet/journal/init-ext.jsp" %>