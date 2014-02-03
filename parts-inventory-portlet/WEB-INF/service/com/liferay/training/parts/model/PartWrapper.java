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

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * This class is a wrapper for {@link Part}.
 * </p>
 *
 * @author    François Miglianico
 * @see       Part
 * @generated
 */
public class PartWrapper implements Part, ModelWrapper<Part> {
	public PartWrapper(Part part) {
		_part = part;
	}

	public Class<?> getModelClass() {
		return Part.class;
	}

	public String getModelClassName() {
		return Part.class.getName();
	}

	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("partId", getPartId());
		attributes.put("companyId", getCompanyId());
		attributes.put("groupId", getGroupId());
		attributes.put("userId", getUserId());
		attributes.put("manufacturerId", getManufacturerId());
		attributes.put("name", getName());
		attributes.put("partNumber", getPartNumber());
		attributes.put("orderDate", getOrderDate());
		attributes.put("quantity", getQuantity());

		return attributes;
	}

	public void setModelAttributes(Map<String, Object> attributes) {
		Long partId = (Long)attributes.get("partId");

		if (partId != null) {
			setPartId(partId);
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

		Long manufacturerId = (Long)attributes.get("manufacturerId");

		if (manufacturerId != null) {
			setManufacturerId(manufacturerId);
		}

		String name = (String)attributes.get("name");

		if (name != null) {
			setName(name);
		}

		String partNumber = (String)attributes.get("partNumber");

		if (partNumber != null) {
			setPartNumber(partNumber);
		}

		Date orderDate = (Date)attributes.get("orderDate");

		if (orderDate != null) {
			setOrderDate(orderDate);
		}

		Integer quantity = (Integer)attributes.get("quantity");

		if (quantity != null) {
			setQuantity(quantity);
		}
	}

	/**
	* Returns the primary key of this part.
	*
	* @return the primary key of this part
	*/
	public long getPrimaryKey() {
		return _part.getPrimaryKey();
	}

	/**
	* Sets the primary key of this part.
	*
	* @param primaryKey the primary key of this part
	*/
	public void setPrimaryKey(long primaryKey) {
		_part.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the part ID of this part.
	*
	* @return the part ID of this part
	*/
	public long getPartId() {
		return _part.getPartId();
	}

	/**
	* Sets the part ID of this part.
	*
	* @param partId the part ID of this part
	*/
	public void setPartId(long partId) {
		_part.setPartId(partId);
	}

	/**
	* Returns the company ID of this part.
	*
	* @return the company ID of this part
	*/
	public long getCompanyId() {
		return _part.getCompanyId();
	}

	/**
	* Sets the company ID of this part.
	*
	* @param companyId the company ID of this part
	*/
	public void setCompanyId(long companyId) {
		_part.setCompanyId(companyId);
	}

	/**
	* Returns the group ID of this part.
	*
	* @return the group ID of this part
	*/
	public long getGroupId() {
		return _part.getGroupId();
	}

	/**
	* Sets the group ID of this part.
	*
	* @param groupId the group ID of this part
	*/
	public void setGroupId(long groupId) {
		_part.setGroupId(groupId);
	}

	/**
	* Returns the user ID of this part.
	*
	* @return the user ID of this part
	*/
	public long getUserId() {
		return _part.getUserId();
	}

	/**
	* Sets the user ID of this part.
	*
	* @param userId the user ID of this part
	*/
	public void setUserId(long userId) {
		_part.setUserId(userId);
	}

	/**
	* Returns the user uuid of this part.
	*
	* @return the user uuid of this part
	* @throws SystemException if a system exception occurred
	*/
	public java.lang.String getUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _part.getUserUuid();
	}

	/**
	* Sets the user uuid of this part.
	*
	* @param userUuid the user uuid of this part
	*/
	public void setUserUuid(java.lang.String userUuid) {
		_part.setUserUuid(userUuid);
	}

	/**
	* Returns the manufacturer ID of this part.
	*
	* @return the manufacturer ID of this part
	*/
	public long getManufacturerId() {
		return _part.getManufacturerId();
	}

	/**
	* Sets the manufacturer ID of this part.
	*
	* @param manufacturerId the manufacturer ID of this part
	*/
	public void setManufacturerId(long manufacturerId) {
		_part.setManufacturerId(manufacturerId);
	}

	/**
	* Returns the name of this part.
	*
	* @return the name of this part
	*/
	public java.lang.String getName() {
		return _part.getName();
	}

	/**
	* Returns the localized name of this part in the language. Uses the default language if no localization exists for the requested language.
	*
	* @param locale the locale of the language
	* @return the localized name of this part
	*/
	public java.lang.String getName(java.util.Locale locale) {
		return _part.getName(locale);
	}

	/**
	* Returns the localized name of this part in the language, optionally using the default language if no localization exists for the requested language.
	*
	* @param locale the local of the language
	* @param useDefault whether to use the default language if no localization exists for the requested language
	* @return the localized name of this part. If <code>useDefault</code> is <code>false</code> and no localization exists for the requested language, an empty string will be returned.
	*/
	public java.lang.String getName(java.util.Locale locale, boolean useDefault) {
		return _part.getName(locale, useDefault);
	}

	/**
	* Returns the localized name of this part in the language. Uses the default language if no localization exists for the requested language.
	*
	* @param languageId the ID of the language
	* @return the localized name of this part
	*/
	public java.lang.String getName(java.lang.String languageId) {
		return _part.getName(languageId);
	}

	/**
	* Returns the localized name of this part in the language, optionally using the default language if no localization exists for the requested language.
	*
	* @param languageId the ID of the language
	* @param useDefault whether to use the default language if no localization exists for the requested language
	* @return the localized name of this part
	*/
	public java.lang.String getName(java.lang.String languageId,
		boolean useDefault) {
		return _part.getName(languageId, useDefault);
	}

	public java.lang.String getNameCurrentLanguageId() {
		return _part.getNameCurrentLanguageId();
	}

	public java.lang.String getNameCurrentValue() {
		return _part.getNameCurrentValue();
	}

	/**
	* Returns a map of the locales and localized names of this part.
	*
	* @return the locales and localized names of this part
	*/
	public java.util.Map<java.util.Locale, java.lang.String> getNameMap() {
		return _part.getNameMap();
	}

	/**
	* Sets the name of this part.
	*
	* @param name the name of this part
	*/
	public void setName(java.lang.String name) {
		_part.setName(name);
	}

	/**
	* Sets the localized name of this part in the language.
	*
	* @param name the localized name of this part
	* @param locale the locale of the language
	*/
	public void setName(java.lang.String name, java.util.Locale locale) {
		_part.setName(name, locale);
	}

	/**
	* Sets the localized name of this part in the language, and sets the default locale.
	*
	* @param name the localized name of this part
	* @param locale the locale of the language
	* @param defaultLocale the default locale
	*/
	public void setName(java.lang.String name, java.util.Locale locale,
		java.util.Locale defaultLocale) {
		_part.setName(name, locale, defaultLocale);
	}

	public void setNameCurrentLanguageId(java.lang.String languageId) {
		_part.setNameCurrentLanguageId(languageId);
	}

	/**
	* Sets the localized names of this part from the map of locales and localized names.
	*
	* @param nameMap the locales and localized names of this part
	*/
	public void setNameMap(
		java.util.Map<java.util.Locale, java.lang.String> nameMap) {
		_part.setNameMap(nameMap);
	}

	/**
	* Sets the localized names of this part from the map of locales and localized names, and sets the default locale.
	*
	* @param nameMap the locales and localized names of this part
	* @param defaultLocale the default locale
	*/
	public void setNameMap(
		java.util.Map<java.util.Locale, java.lang.String> nameMap,
		java.util.Locale defaultLocale) {
		_part.setNameMap(nameMap, defaultLocale);
	}

	/**
	* Returns the part number of this part.
	*
	* @return the part number of this part
	*/
	public java.lang.String getPartNumber() {
		return _part.getPartNumber();
	}

	/**
	* Sets the part number of this part.
	*
	* @param partNumber the part number of this part
	*/
	public void setPartNumber(java.lang.String partNumber) {
		_part.setPartNumber(partNumber);
	}

	/**
	* Returns the order date of this part.
	*
	* @return the order date of this part
	*/
	public java.util.Date getOrderDate() {
		return _part.getOrderDate();
	}

	/**
	* Sets the order date of this part.
	*
	* @param orderDate the order date of this part
	*/
	public void setOrderDate(java.util.Date orderDate) {
		_part.setOrderDate(orderDate);
	}

	/**
	* Returns the quantity of this part.
	*
	* @return the quantity of this part
	*/
	public int getQuantity() {
		return _part.getQuantity();
	}

	/**
	* Sets the quantity of this part.
	*
	* @param quantity the quantity of this part
	*/
	public void setQuantity(int quantity) {
		_part.setQuantity(quantity);
	}

	public boolean isNew() {
		return _part.isNew();
	}

	public void setNew(boolean n) {
		_part.setNew(n);
	}

	public boolean isCachedModel() {
		return _part.isCachedModel();
	}

	public void setCachedModel(boolean cachedModel) {
		_part.setCachedModel(cachedModel);
	}

	public boolean isEscapedModel() {
		return _part.isEscapedModel();
	}

	public java.io.Serializable getPrimaryKeyObj() {
		return _part.getPrimaryKeyObj();
	}

	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_part.setPrimaryKeyObj(primaryKeyObj);
	}

	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _part.getExpandoBridge();
	}

	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_part.setExpandoBridgeAttributes(serviceContext);
	}

	public void prepareLocalizedFieldsForImport(
		java.util.Locale defaultImportLocale)
		throws com.liferay.portal.LocaleException {
		_part.prepareLocalizedFieldsForImport(defaultImportLocale);
	}

	@Override
	public java.lang.Object clone() {
		return new PartWrapper((Part)_part.clone());
	}

	public int compareTo(com.liferay.training.parts.model.Part part) {
		return _part.compareTo(part);
	}

	@Override
	public int hashCode() {
		return _part.hashCode();
	}

	public com.liferay.portal.model.CacheModel<com.liferay.training.parts.model.Part> toCacheModel() {
		return _part.toCacheModel();
	}

	public com.liferay.training.parts.model.Part toEscapedModel() {
		return new PartWrapper(_part.toEscapedModel());
	}

	public com.liferay.training.parts.model.Part toUnescapedModel() {
		return new PartWrapper(_part.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _part.toString();
	}

	public java.lang.String toXmlString() {
		return _part.toXmlString();
	}

	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_part.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof PartWrapper)) {
			return false;
		}

		PartWrapper partWrapper = (PartWrapper)obj;

		if (Validator.equals(_part, partWrapper._part)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated Renamed to {@link #getWrappedModel}
	 */
	public Part getWrappedPart() {
		return _part;
	}

	public Part getWrappedModel() {
		return _part;
	}

	public void resetOriginalValues() {
		_part.resetOriginalValues();
	}

	private Part _part;
}