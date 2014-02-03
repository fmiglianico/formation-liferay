/**
 * Copyright (c) 2000-2012 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.spaceprogram.hook.upgrade.v1_0_0;

import com.liferay.portal.kernel.upgrade.UpgradeProcess;

import com.liferay.portal.kernel.util.FileUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.util.PropsKeys;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.model.Group;
import com.liferay.portal.model.GroupConstants;
import com.liferay.portal.model.Layout;

import com.liferay.portal.model.Organization;
import com.liferay.portal.model.OrganizationConstants;
import com.liferay.portal.model.PortletConstants;
import com.liferay.portal.model.ResourceConstants;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.RoleConstants;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.PrincipalThreadLocal;
import com.liferay.portal.security.permission.ActionKeys;
import com.liferay.portal.service.GroupLocalServiceUtil;
import com.liferay.portal.service.OrganizationLocalServiceUtil;
import com.liferay.portal.service.PermissionLocalServiceUtil;
import com.liferay.portal.service.ResourceLocalServiceUtil;
import com.liferay.portal.service.ResourcePermissionLocalServiceUtil;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.service.permission.PortletPermissionUtil;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portal.util.PortletKeys;
import com.liferay.portlet.journal.model.JournalArticle;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;


/**
 * @author Brian Wing Shun Chan
 * @author Ryan Park
 */
public class UpgradeCompany extends UpgradeProcess {

	
	protected void addResources(Layout layout, String portletId)
		throws Exception{

		String rootPortletId = PortletConstants.getRootPortletId(portletId);

		String portletPrimaryKey = PortletPermissionUtil.getPrimaryKey(
			layout.getPlid(), portletId);

		ResourceLocalServiceUtil.addResources(
			layout.getCompanyId(), layout.getGroupId(), 0, rootPortletId,
			portletPrimaryKey, true, true, true);
	}
	
	protected User addUser(
			long companyId, String screenName, String firstName,
			String lastName, boolean male, String jobTitle, long[] roleIds)
		throws Exception {

		long creatorUserId = 0;
		boolean autoPassword = false;
		String password1 = "liferay";
		String password2 = "liferay";
		boolean autoScreenName = false;
		String emailAddress = screenName + "@spaceprogram.com";
		long facebookId = 0;
		String openId = StringPool.BLANK;
		Locale locale = LocaleUtil.getDefault();
		String middleName = StringPool.BLANK;
		int prefixId = 0;
		int suffixId = 0;
		int birthdayMonth = Calendar.JANUARY;
		int birthdayDay = 1;
		int birthdayYear = 1970;

		Group guestGroup = GroupLocalServiceUtil.getGroup(
			companyId, GroupConstants.GUEST);

		long[] groupIds = new long[] {guestGroup.getGroupId()};

		Organization spaceProgramOrganization =
			OrganizationLocalServiceUtil.getOrganization(
				companyId, "The Space Program Employees");

		long[] organizationIds = new long[] {
				spaceProgramOrganization.getOrganizationId()
		};

		long[] userGroupIds = null;
		boolean sendEmail = false;

		ServiceContext serviceContext = new ServiceContext();

		serviceContext.setScopeGroupId(guestGroup.getGroupId());

		User user = UserLocalServiceUtil.addUser(
			creatorUserId, companyId, autoPassword, password1, password2,
			autoScreenName, screenName, emailAddress, facebookId, openId,
			locale, firstName, middleName, lastName, prefixId, suffixId, male,
			birthdayMonth, birthdayDay, birthdayYear, jobTitle, groupIds,
			organizationIds, roleIds, userGroupIds, sendEmail, serviceContext);

		UserLocalServiceUtil.updateLastLogin(
			user.getUserId(), user.getLoginIP());

		UserLocalServiceUtil.updatePasswordReset(user.getUserId(), false);

		String[] questions = StringUtil.split(
			PropsUtil.get("users.reminder.queries.questions"));

		String question = questions[0];
		String answer = "1234";

		UserLocalServiceUtil.updateReminderQuery(
			user.getUserId(), question, answer);

		return user;
	}

	@Override
	protected void doUpgrade() throws Exception {
		String name = PrincipalThreadLocal.getName();

		try {
			long companyId = PortalUtil.getDefaultCompanyId();

			long defaultUserId = UserLocalServiceUtil.getDefaultUserId(
				companyId);

			PrincipalThreadLocal.setName(defaultUserId);
			
			setupOrganizations(companyId, defaultUserId);

			setupRoles(companyId, defaultUserId);

			setupUsers(companyId);

		}
		finally {
			PrincipalThreadLocal.setName(name);
		}
	}

	
	protected byte[] getBytes(String path) throws Exception {
		return FileUtil.getBytes(getInputStream(path));
	}

	protected InputStream getInputStream(String path) throws Exception {
		Class<?> clazz = getClass();

		return clazz.getResourceAsStream("/resources" + path);
	}

	protected int getRandomNumber(int min, int max) {
		return (int)(Math.round(min + Math.random() * (max-min)));
	}

	protected String getString(String path) throws Exception {
		return new String(getBytes(path));
	}


	protected void setLocalizedValue(Map<Locale, String> map, String value) {
		Locale locale = LocaleUtil.getDefault();

		map.put(locale, value);

		if (!locale.equals(Locale.US)) {
			map.put(Locale.US, value);
		}
	}

	protected void setRolePermissions(
			Role role, String name, String[] actionIds)
		throws Exception {

		long roleId = role.getRoleId();
		long companyId = role.getCompanyId();
		int scope = ResourceConstants.SCOPE_COMPANY;
		String primKey = String.valueOf(companyId);

		if (_PERMISSIONS_USER_CHECK_ALGORITHM == 6) {
			ResourcePermissionLocalServiceUtil.setResourcePermissions(
				companyId, name, scope, primKey, roleId, actionIds);
		}
		else {
			PermissionLocalServiceUtil.setRolePermissions(
				roleId, companyId, name, scope, primKey, actionIds);
		}
	}

	protected Organization setupOrganizations(
			long companyId, long defaultUserId)
		throws Exception {

		// The Space Program organization

		long userId = defaultUserId;
		long parentOrganizationId =
			OrganizationConstants.DEFAULT_PARENT_ORGANIZATION_ID;
		String name = "The Space Program Employees";
		String type = OrganizationConstants.TYPE_REGULAR_ORGANIZATION;
		boolean recursable = true;
		long regionId = 0;
		long countryId = 0;
		int statusId = GetterUtil.getInteger(PropsUtil.get(
			"sql.data.com.liferay.portal.model.ListType.organization.status"));
		String comments = null;

		ServiceContext serviceContext = new ServiceContext();

		serviceContext.setAddGroupPermissions(true);
		serviceContext.setAddGuestPermissions(true);

		Organization organization =
			OrganizationLocalServiceUtil.addOrganization(
				userId, parentOrganizationId, name, type, recursable, regionId,
				countryId, statusId, comments, true, serviceContext);

		// Group

		Group group = organization.getGroup();

		GroupLocalServiceUtil.updateFriendlyURL(group.getGroupId(), "/space-program-employees");

		serviceContext.setScopeGroupId(group.getGroupId());

		return organization;
	}

	protected void setupRoles(long companyId, long defaultUserId)
		throws Exception {

		Map<Locale, String> descriptionMap = new HashMap<Locale, String>();

		setLocalizedValue(
			descriptionMap,
			"Bloggers are responsible for writing blogs.");

		Role publisherRole = RoleLocalServiceUtil.fetchRole(
			companyId, "Blogger");

		if (publisherRole == null) {
			publisherRole = RoleLocalServiceUtil.addRole(
				defaultUserId, companyId, "Blogger", null, descriptionMap,
				RoleConstants.TYPE_REGULAR);
		}

		setRolePermissions(
			publisherRole, PortletKeys.JOURNAL,
			new String[] {ActionKeys.ACCESS_IN_CONTROL_PANEL});

		setRolePermissions(
			publisherRole, "com.liferay.portlet.journal",
			new String[] {
				ActionKeys.ADD_ARTICLE, ActionKeys.ADD_FEED,
				ActionKeys.ADD_STRUCTURE, ActionKeys.ADD_TEMPLATE
			});

		setRolePermissions(
			publisherRole, JournalArticle.class.getName(),
			new String[] {
				ActionKeys.ADD_DISCUSSION, ActionKeys.DELETE, ActionKeys.EXPIRE,
				ActionKeys.PERMISSIONS, ActionKeys.UPDATE, ActionKeys.VIEW
			});

		descriptionMap.clear();

		setLocalizedValue(
			descriptionMap, "Writers are responsible for creating content.");

		Role writerRole = RoleLocalServiceUtil.fetchRole(companyId, "Writer");

		if (writerRole == null) {
			writerRole = RoleLocalServiceUtil.addRole(
				defaultUserId, companyId, "Writer", null, descriptionMap,
				RoleConstants.TYPE_REGULAR);
		}

		setRolePermissions(
			writerRole, PortletKeys.JOURNAL,
			new String[] {ActionKeys.ACCESS_IN_CONTROL_PANEL});

		setRolePermissions(
			writerRole, "com.liferay.portlet.journal",
			new String[] {
				ActionKeys.ADD_ARTICLE, ActionKeys.ADD_FEED,
				ActionKeys.ADD_STRUCTURE, ActionKeys.ADD_TEMPLATE
			});
		
		setRolePermissions(
				writerRole, JournalArticle.class.getName(),
				new String[] {
					ActionKeys.ADD_DISCUSSION, ActionKeys.DELETE, ActionKeys.EXPIRE,
					ActionKeys.PERMISSIONS, ActionKeys.UPDATE, ActionKeys.VIEW
				});

		setRolePermissions(
			writerRole, JournalArticle.class.getName(),
			new String[] {ActionKeys.UPDATE, ActionKeys.VIEW});
	}

	protected List<User> setupUsers(long companyId) throws Exception {

		// Roles

		Role adminRole = RoleLocalServiceUtil.getRole(
			companyId, RoleConstants.ADMINISTRATOR);

		Role powerUserRole = RoleLocalServiceUtil.getRole(
			companyId, RoleConstants.POWER_USER);

		Role writerRole = RoleLocalServiceUtil.getRole(companyId, "Writer");

		Role bloggerRole = RoleLocalServiceUtil.getRole(companyId, "Blogger");

		
		// Users

		long[] roleIds = {adminRole.getRoleId(), powerUserRole.getRoleId()};

		User astroAdminUser = addUser(
			companyId, "astroadmin", "Astro", "Admin", true, "Administrator",
			roleIds);

		List<User> users = new ArrayList<User>();

		users.add(astroAdminUser);

		User engAdminUser = addUser(
				companyId, "engadmin", "Eng", "Admin", true, "Administrator",
				roleIds);

			users.add(engAdminUser);

		
		roleIds = new long[] {
			powerUserRole.getRoleId(), writerRole.getRoleId()
		};

		User spaceWriterUser = addUser(
			companyId, "writer", "Space", "Writer", false, "Writer",
			roleIds);

		users.add(spaceWriterUser);

		roleIds = new long[] {
			powerUserRole.getRoleId(), bloggerRole.getRoleId()
		};

		User engBloggerUser = addUser(
			companyId, "engblogger", "Eng", "Blogger", true, "Blogger",
			roleIds);

		users.add(engBloggerUser);

		User astroBloggerUser = addUser(
				companyId, "astroblogger", "Astro", "Blogger", true, "Blogger",
				roleIds);

			users.add(astroBloggerUser);
		
		return users;
	}

	private static final int _PERMISSIONS_USER_CHECK_ALGORITHM =
		GetterUtil.getInteger(
			PropsUtil.get(PropsKeys.PERMISSIONS_USER_CHECK_ALGORITHM));


}