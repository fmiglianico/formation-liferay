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

<%@ page import="com.liferay.portal.DuplicateGroupException" %><%@
page import="com.liferay.portal.DuplicateTeamException" %><%@
page import="com.liferay.portal.GroupFriendlyURLException" %><%@
page import="com.liferay.portal.GroupNameException" %><%@
page import="com.liferay.portal.LayoutSetVirtualHostException" %><%@
page import="com.liferay.portal.LocaleException" %><%@
page import="com.liferay.portal.MembershipRequestCommentsException" %><%@
page import="com.liferay.portal.NoSuchGroupException" %><%@
page import="com.liferay.portal.NoSuchLayoutException" %><%@
page import="com.liferay.portal.NoSuchLayoutSetException" %><%@
page import="com.liferay.portal.NoSuchRoleException" %><%@
page import="com.liferay.portal.RemoteExportException" %><%@
page import="com.liferay.portal.RemoteOptionsException" %><%@
page import="com.liferay.portal.RequiredGroupException" %><%@
page import="com.liferay.portal.TeamNameException" %><%@
page import="com.liferay.portal.kernel.lar.PortletDataHandler" %><%@
page import="com.liferay.portal.kernel.staging.StagingConstants" %><%@
page import="com.liferay.portal.kernel.staging.StagingUtil" %><%@
page import="com.liferay.portal.liveusers.LiveUsers" %><%@
page import="com.liferay.portal.service.permission.TeamPermissionUtil" %><%@
page import="com.liferay.portal.util.CustomJspRegistryUtil" %><%@
page import="com.liferay.portal.util.RobotsUtil" %><%@
page import="com.liferay.portlet.rolesadmin.search.GroupRoleChecker" %><%@
page import="com.liferay.portlet.rolesadmin.search.RoleSearch" %><%@
page import="com.liferay.portlet.rolesadmin.search.RoleSearchTerms" %><%@
page import="com.liferay.portlet.rolesadmin.util.RolesAdminUtil" %><%@
page import="com.liferay.portlet.sites.action.ActionUtil" %><%@
page import="com.liferay.portlet.sites.search.UserGroupGroupRoleRoleChecker" %><%@
page import="com.liferay.portlet.sites.search.UserGroupGroupRoleUserGroupChecker" %><%@
page import="com.liferay.portlet.sites.search.UserGroupRoleRoleChecker" %><%@
page import="com.liferay.portlet.sites.search.UserGroupRoleUserChecker" %><%@
page import="com.liferay.portlet.sitesadmin.search.TeamDisplayTerms" %><%@
page import="com.liferay.portlet.sitesadmin.search.TeamSearch" %><%@
page import="com.liferay.portlet.sitesadmin.search.TeamSearchTerms" %><%@
page import="com.liferay.portlet.sitesadmin.search.UserGroupTeamChecker" %><%@
page import="com.liferay.portlet.sitesadmin.search.UserTeamChecker" %><%@
page import="com.liferay.portlet.usergroupsadmin.search.UserGroupChecker" %><%@
page import="com.liferay.portlet.usergroupsadmin.search.UserGroupGroupChecker" %><%@
page import="com.liferay.portlet.usergroupsadmin.search.UserGroupSearch" %><%@
page import="com.liferay.portlet.usergroupsadmin.search.UserGroupSearchTerms" %><%@
page import="com.liferay.portlet.usersadmin.search.GroupSearch" %><%@
page import="com.liferay.portlet.usersadmin.search.GroupSearchTerms" %><%@
page import="com.liferay.portlet.usersadmin.search.OrganizationGroupChecker" %><%@
page import="com.liferay.portlet.usersadmin.search.OrganizationSearch" %><%@
page import="com.liferay.portlet.usersadmin.search.OrganizationSearchTerms" %><%@
page import="com.liferay.portlet.usersadmin.search.UserSearch" %><%@
page import="com.liferay.portlet.usersadmin.search.UserSearchTerms" %><%@
page import="com.liferay.portlet.usersadmin.util.UsersAdminUtil" %>

<%
boolean filterManageableGroups = true;

if (permissionChecker.isCompanyAdmin()) {
	filterManageableGroups = false;
}

long[] classNameIds = new long[] {PortalUtil.getClassNameId(Group.class), PortalUtil.getClassNameId(Organization.class)};

Format dateFormatDate = FastDateFormatFactoryUtil.getDate(locale, timeZone);
%>

<%@ include file="/html/portlet/sites_admin/init-ext.jsp" %>