/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
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

package com.liferay.training.parts.model.impl;

import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.CacheModel;

import com.liferay.training.parts.model.Manufacturer;

import java.io.Serializable;

/**
 * The cache model class for representing Manufacturer in entity cache.
 *
 * @author François Miglianico
 * @see Manufacturer
 * @generated
 */
public class ManufacturerCacheModel implements CacheModel<Manufacturer>,
	Serializable {
	@Override
	public String toString() {
		StringBundler sb = new StringBundler(17);

		sb.append("{manufacturerId=");
		sb.append(manufacturerId);
		sb.append(", companyId=");
		sb.append(companyId);
		sb.append(", groupId=");
		sb.append(groupId);
		sb.append(", userId=");
		sb.append(userId);
		sb.append(", name=");
		sb.append(name);
		sb.append(", emailAddress=");
		sb.append(emailAddress);
		sb.append(", website=");
		sb.append(website);
		sb.append(", phoneNumber=");
		sb.append(phoneNumber);
		sb.append("}");

		return sb.toString();
	}

	public Manufacturer toEntityModel() {
		ManufacturerImpl manufacturerImpl = new ManufacturerImpl();

		manufacturerImpl.setManufacturerId(manufacturerId);
		manufacturerImpl.setCompanyId(companyId);
		manufacturerImpl.setGroupId(groupId);
		manufacturerImpl.setUserId(userId);

		if (name == null) {
			manufacturerImpl.setName(StringPool.BLANK);
		}
		else {
			manufacturerImpl.setName(name);
		}

		if (emailAddress == null) {
			manufacturerImpl.setEmailAddress(StringPool.BLANK);
		}
		else {
			manufacturerImpl.setEmailAddress(emailAddress);
		}

		if (website == null) {
			manufacturerImpl.setWebsite(StringPool.BLANK);
		}
		else {
			manufacturerImpl.setWebsite(website);
		}

		if (phoneNumber == null) {
			manufacturerImpl.setPhoneNumber(StringPool.BLANK);
		}
		else {
			manufacturerImpl.setPhoneNumber(phoneNumber);
		}

		manufacturerImpl.resetOriginalValues();

		return manufacturerImpl;
	}

	public long manufacturerId;
	public long companyId;
	public long groupId;
	public long userId;
	public String name;
	public String emailAddress;
	public String website;
	public String phoneNumber;
}