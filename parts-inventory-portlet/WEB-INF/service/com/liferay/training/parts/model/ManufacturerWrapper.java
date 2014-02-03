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

package com.liferay.training.parts.model;

import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.ModelWrapper;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * This class is a wrapper for {@link Manufacturer}.
 * </p>
 *
 * @author    François Miglianico
 * @see       Manufacturer
 * @generated
 */
public class ManufacturerWrapper implements Manufacturer,
	ModelWrapper<Manufacturer> {
	public ManufacturerWrapper(Manufacturer manufacturer) {
		_manufacturer = manufacturer;
	}

	public Class<?> getModelClass() {
		return Manufacturer.class;
	}

	public String getModelClassName() {
		return Manufacturer.class.getName();
	}

	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("manufacturerId", getManufacturerId());
		attributes.put("companyId", getCompanyId());
		attributes.put("groupId", getGroupId());
		attributes.put("userId", getUserId());
		attributes.put("name", getName());
		attributes.put("emailAddress", getEmailAddress());
		attributes.put("website", getWebsite());
		attributes.put("phoneNumber", getPhoneNumber());

		return attributes;
	}

	public void setModelAttributes(Map<String, Object> attributes) {
		Long manufacturerId = (Long)attributes.get("manufacturerId");

		if (manufacturerId != null) {
			setManufacturerId(manufacturerId);
		}

		Long companyId = (Long)attributes.get("companyId");

		if (companyId != null) {
			setCompanyId(companyId);
		}

		Long groupId = (Long)attributes.get("groupId");

		if (groupId != null) {
			setGroupId(groupId);
		}

		Long userId = (Long)attributes.get("userId");

		if (userId != null) {
			setUserId(userId);
		}

		String name = (String)attributes.get("name");

		if (name != null) {
			setName(name);
		}

		String emailAddress = (String)attributes.get("emailAddress");

		if (emailAddress != null) {
			setEmailAddress(emailAddress);
		}

		String website = (String)attributes.get("website");

		if (website != null) {
			setWebsite(website);
		}

		String phoneNumber = (String)attributes.get("phoneNumber");

		if (phoneNumber != null) {
			setPhoneNumber(phoneNumber);
		}
	}

	/**
	* Returns the primary key of this manufacturer.
	*
	* @return the primary key of this manufacturer
	*/
	public long getPrimaryKey() {
		return _manufacturer.getPrimaryKey();
	}

	/**
	* Sets the primary key of this manufacturer.
	*
	* @param primaryKey the primary key of this manufacturer
	*/
	public void setPrimaryKey(long primaryKey) {
		_manufacturer.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the manufacturer ID of this manufacturer.
	*
	* @return the manufacturer ID of this manufacturer
	*/
	public long getManufacturerId() {
		return _manufacturer.getManufacturerId();
	}

	/**
	* Sets the manufacturer ID of this manufacturer.
	*
	* @param manufacturerId the manufacturer ID of this manufacturer
	*/
	public void setManufacturerId(long manufacturerId) {
		_manufacturer.setManufacturerId(manufacturerId);
	}

	/**
	* Returns the company ID of this manufacturer.
	*
	* @return the company ID of this manufacturer
	*/
	public long getCompanyId() {
		return _manufacturer.getCompanyId();
	}

	/**
	* Sets the company ID of this manufacturer.
	*
	* @param companyId the company ID of this manufacturer
	*/
	public void setCompanyId(long companyId) {
		_manufacturer.setCompanyId(companyId);
	}

	/**
	* Returns the group ID of this manufacturer.
	*
	* @return the group ID of this manufacturer
	*/
	public long getGroupId() {
		return _manufacturer.getGroupId();
	}

	/**
	* Sets the group ID of this manufacturer.
	*
	* @param groupId the group ID of this manufacturer
	*/
	public void setGroupId(long groupId) {
		_manufacturer.setGroupId(groupId);
	}

	/**
	* Returns the user ID of this manufacturer.
	*
	* @return the user ID of this manufacturer
	*/
	public long getUserId() {
		return _manufacturer.getUserId();
	}

	/**
	* Sets the user ID of this manufacturer.
	*
	* @param userId the user ID of this manufacturer
	*/
	public void setUserId(long userId) {
		_manufacturer.setUserId(userId);
	}

	/**
	* Returns the user uuid of this manufacturer.
	*
	* @return the user uuid of this manufacturer
	* @throws SystemException if a system exception occurred
	*/
	public java.lang.String getUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _manufacturer.getUserUuid();
	}

	/**
	* Sets the user uuid of this manufacturer.
	*
	* @param userUuid the user uuid of this manufacturer
	*/
	public void setUserUuid(java.lang.String userUuid) {
		_manufacturer.setUserUuid(userUuid);
	}

	/**
	* Returns the name of this manufacturer.
	*
	* @return the name of this manufacturer
	*/
	public java.lang.String getName() {
		return _manufacturer.getName();
	}

	/**
	* Sets the name of this manufacturer.
	*
	* @param name the name of this manufacturer
	*/
	public void setName(java.lang.String name) {
		_manufacturer.setName(name);
	}

	/**
	* Returns the email address of this manufacturer.
	*
	* @return the email address of this manufacturer
	*/
	public java.lang.String getEmailAddress() {
		return _manufacturer.getEmailAddress();
	}

	/**
	* Sets the email address of this manufacturer.
	*
	* @param emailAddress the email address of this manufacturer
	*/
	public void setEmailAddress(java.lang.String emailAddress) {
		_manufacturer.setEmailAddress(emailAddress);
	}

	/**
	* Returns the website of this manufacturer.
	*
	* @return the website of this manufacturer
	*/
	public java.lang.String getWebsite() {
		return _manufacturer.getWebsite();
	}

	/**
	* Sets the website of this manufacturer.
	*
	* @param website the website of this manufacturer
	*/
	public void setWebsite(java.lang.String website) {
		_manufacturer.setWebsite(website);
	}

	/**
	* Returns the phone number of this manufacturer.
	*
	* @return the phone number of this manufacturer
	*/
	public java.lang.String getPhoneNumber() {
		return _manufacturer.getPhoneNumber();
	}

	/**
	* Sets the phone number of this manufacturer.
	*
	* @param phoneNumber the phone number of this manufacturer
	*/
	public void setPhoneNumber(java.lang.String phoneNumber) {
		_manufacturer.setPhoneNumber(phoneNumber);
	}

	public boolean isNew() {
		return _manufacturer.isNew();
	}

	public void setNew(boolean n) {
		_manufacturer.setNew(n);
	}

	public boolean isCachedModel() {
		return _manufacturer.isCachedModel();
	}

	public void setCachedModel(boolean cachedModel) {
		_manufacturer.setCachedModel(cachedModel);
	}

	public boolean isEscapedModel() {
		return _manufacturer.isEscapedModel();
	}

	public java.io.Serializable getPrimaryKeyObj() {
		return _manufacturer.getPrimaryKeyObj();
	}

	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_manufacturer.setPrimaryKeyObj(primaryKeyObj);
	}

	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _manufacturer.getExpandoBridge();
	}

	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_manufacturer.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new ManufacturerWrapper((Manufacturer)_manufacturer.clone());
	}

	public int compareTo(
		com.liferay.training.parts.model.Manufacturer manufacturer) {
		return _manufacturer.compareTo(manufacturer);
	}

	@Override
	public int hashCode() {
		return _manufacturer.hashCode();
	}

	public com.liferay.portal.model.CacheModel<com.liferay.training.parts.model.Manufacturer> toCacheModel() {
		return _manufacturer.toCacheModel();
	}

	public com.liferay.training.parts.model.Manufacturer toEscapedModel() {
		return new ManufacturerWrapper(_manufacturer.toEscapedModel());
	}

	public com.liferay.training.parts.model.Manufacturer toUnescapedModel() {
		return new ManufacturerWrapper(_manufacturer.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _manufacturer.toString();
	}

	public java.lang.String toXmlString() {
		return _manufacturer.toXmlString();
	}

	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_manufacturer.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof ManufacturerWrapper)) {
			return false;
		}

		ManufacturerWrapper manufacturerWrapper = (ManufacturerWrapper)obj;

		if (Validator.equals(_manufacturer, manufacturerWrapper._manufacturer)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated Renamed to {@link #getWrappedModel}
	 */
	public Manufacturer getWrappedManufacturer() {
		return _manufacturer;
	}

	public Manufacturer getWrappedModel() {
		return _manufacturer;
	}

	public void resetOriginalValues() {
		_manufacturer.resetOriginalValues();
	}

	private Manufacturer _manufacturer;
}