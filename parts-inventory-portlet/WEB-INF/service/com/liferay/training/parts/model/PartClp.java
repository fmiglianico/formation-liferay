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

import com.liferay.portal.LocaleException;
import com.liferay.portal.kernel.bean.AutoEscapeBeanHandler;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.util.LocaleUtil;
import com.liferay.portal.kernel.util.LocalizationUtil;
import com.liferay.portal.kernel.util.PortalClassLoaderUtil;
import com.liferay.portal.kernel.util.ProxyUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.BaseModel;
import com.liferay.portal.model.impl.BaseModelImpl;
import com.liferay.portal.util.PortalUtil;

import com.liferay.training.parts.service.ClpSerializer;
import com.liferay.training.parts.service.PartLocalServiceUtil;

import java.io.Serializable;

import java.lang.reflect.Method;

import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * @author François Miglianico
 */
public class PartClp extends BaseModelImpl<Part> implements Part {
	public PartClp() {
	}

	public Class<?> getModelClass() {
		return Part.class;
	}

	public String getModelClassName() {
		return Part.class.getName();
	}

	public long getPrimaryKey() {
		return _partId;
	}

	public void setPrimaryKey(long primaryKey) {
		setPartId(primaryKey);
	}

	public Serializable getPrimaryKeyObj() {
		return new Long(_partId);
	}

	public void setPrimaryKeyObj(Serializable primaryKeyObj) {
		setPrimaryKey(((Long)primaryKeyObj).longValue());
	}

	@Override
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

	@Override
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

	public long getPartId() {
		return _partId;
	}

	public void setPartId(long partId) {
		_partId = partId;

		if (_partRemoteModel != null) {
			try {
				Class<?> clazz = _partRemoteModel.getClass();

				Method method = clazz.getMethod("setPartId", long.class);

				method.invoke(_partRemoteModel, partId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public long getCompanyId() {
		return _companyId;
	}

	public void setCompanyId(long companyId) {
		_companyId = companyId;

		if (_partRemoteModel != null) {
			try {
				Class<?> clazz = _partRemoteModel.getClass();

				Method method = clazz.getMethod("setCompanyId", long.class);

				method.invoke(_partRemoteModel, companyId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public long getGroupId() {
		return _groupId;
	}

	public void setGroupId(long groupId) {
		_groupId = groupId;

		if (_partRemoteModel != null) {
			try {
				Class<?> clazz = _partRemoteModel.getClass();

				Method method = clazz.getMethod("setGroupId", long.class);

				method.invoke(_partRemoteModel, groupId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public long getUserId() {
		return _userId;
	}

	public void setUserId(long userId) {
		_userId = userId;

		if (_partRemoteModel != null) {
			try {
				Class<?> clazz = _partRemoteModel.getClass();

				Method method = clazz.getMethod("setUserId", long.class);

				method.invoke(_partRemoteModel, userId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public String getUserUuid() throws SystemException {
		return PortalUtil.getUserValue(getUserId(), "uuid", _userUuid);
	}

	public void setUserUuid(String userUuid) {
		_userUuid = userUuid;
	}

	public long getManufacturerId() {
		return _manufacturerId;
	}

	public void setManufacturerId(long manufacturerId) {
		_manufacturerId = manufacturerId;

		if (_partRemoteModel != null) {
			try {
				Class<?> clazz = _partRemoteModel.getClass();

				Method method = clazz.getMethod("setManufacturerId", long.class);

				method.invoke(_partRemoteModel, manufacturerId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public String getName() {
		return _name;
	}

	public String getName(Locale locale) {
		String languageId = LocaleUtil.toLanguageId(locale);

		return getName(languageId);
	}

	public String getName(Locale locale, boolean useDefault) {
		String languageId = LocaleUtil.toLanguageId(locale);

		return getName(languageId, useDefault);
	}

	public String getName(String languageId) {
		return LocalizationUtil.getLocalization(getName(), languageId);
	}

	public String getName(String languageId, boolean useDefault) {
		return LocalizationUtil.getLocalization(getName(), languageId,
			useDefault);
	}

	public String getNameCurrentLanguageId() {
		return _nameCurrentLanguageId;
	}

	public String getNameCurrentValue() {
		Locale locale = getLocale(_nameCurrentLanguageId);

		return getName(locale);
	}

	public Map<Locale, String> getNameMap() {
		return LocalizationUtil.getLocalizationMap(getName());
	}

	public void setName(String name) {
		_name = name;

		if (_partRemoteModel != null) {
			try {
				Class<?> clazz = _partRemoteModel.getClass();

				Method method = clazz.getMethod("setName", String.class);

				method.invoke(_partRemoteModel, name);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public void setName(String name, Locale locale) {
		setName(name, locale, LocaleUtil.getDefault());
	}

	public void setName(String name, Locale locale, Locale defaultLocale) {
		String languageId = LocaleUtil.toLanguageId(locale);
		String defaultLanguageId = LocaleUtil.toLanguageId(defaultLocale);

		if (Validator.isNotNull(name)) {
			setName(LocalizationUtil.updateLocalization(getName(), "Name",
					name, languageId, defaultLanguageId));
		}
		else {
			setName(LocalizationUtil.removeLocalization(getName(), "Name",
					languageId));
		}
	}

	public void setNameCurrentLanguageId(String languageId) {
		_nameCurrentLanguageId = languageId;
	}

	public void setNameMap(Map<Locale, String> nameMap) {
		setNameMap(nameMap, LocaleUtil.getDefault());
	}

	public void setNameMap(Map<Locale, String> nameMap, Locale defaultLocale) {
		if (nameMap == null) {
			return;
		}

		ClassLoader portalClassLoader = PortalClassLoaderUtil.getClassLoader();

		Thread currentThread = Thread.currentThread();

		ClassLoader contextClassLoader = currentThread.getContextClassLoader();

		try {
			if (contextClassLoader != portalClassLoader) {
				currentThread.setContextClassLoader(portalClassLoader);
			}

			Locale[] locales = LanguageUtil.getAvailableLocales();

			for (Locale locale : locales) {
				String name = nameMap.get(locale);

				setName(name, locale, defaultLocale);
			}
		}
		finally {
			if (contextClassLoader != portalClassLoader) {
				currentThread.setContextClassLoader(contextClassLoader);
			}
		}
	}

	public String getPartNumber() {
		return _partNumber;
	}

	public void setPartNumber(String partNumber) {
		_partNumber = partNumber;

		if (_partRemoteModel != null) {
			try {
				Class<?> clazz = _partRemoteModel.getClass();

				Method method = clazz.getMethod("setPartNumber", String.class);

				method.invoke(_partRemoteModel, partNumber);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public Date getOrderDate() {
		return _orderDate;
	}

	public void setOrderDate(Date orderDate) {
		_orderDate = orderDate;

		if (_partRemoteModel != null) {
			try {
				Class<?> clazz = _partRemoteModel.getClass();

				Method method = clazz.getMethod("setOrderDate", Date.class);

				method.invoke(_partRemoteModel, orderDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public int getQuantity() {
		return _quantity;
	}

	public void setQuantity(int quantity) {
		_quantity = quantity;

		if (_partRemoteModel != null) {
			try {
				Class<?> clazz = _partRemoteModel.getClass();

				Method method = clazz.getMethod("setQuantity", int.class);

				method.invoke(_partRemoteModel, quantity);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public BaseModel<?> getPartRemoteModel() {
		return _partRemoteModel;
	}

	public void setPartRemoteModel(BaseModel<?> partRemoteModel) {
		_partRemoteModel = partRemoteModel;
	}

	public Object invokeOnRemoteModel(String methodName,
		Class<?>[] parameterTypes, Object[] parameterValues)
		throws Exception {
		Object[] remoteParameterValues = new Object[parameterValues.length];

		for (int i = 0; i < parameterValues.length; i++) {
			if (parameterValues[i] != null) {
				remoteParameterValues[i] = ClpSerializer.translateInput(parameterValues[i]);
			}
		}

		Class<?> remoteModelClass = _partRemoteModel.getClass();

		ClassLoader remoteModelClassLoader = remoteModelClass.getClassLoader();

		Class<?>[] remoteParameterTypes = new Class[parameterTypes.length];

		for (int i = 0; i < parameterTypes.length; i++) {
			if (parameterTypes[i].isPrimitive()) {
				remoteParameterTypes[i] = parameterTypes[i];
			}
			else {
				String parameterTypeName = parameterTypes[i].getName();

				remoteParameterTypes[i] = remoteModelClassLoader.loadClass(parameterTypeName);
			}
		}

		Method method = remoteModelClass.getMethod(methodName,
				remoteParameterTypes);

		Object returnValue = method.invoke(_partRemoteModel,
				remoteParameterValues);

		if (returnValue != null) {
			returnValue = ClpSerializer.translateOutput(returnValue);
		}

		return returnValue;
	}

	public void persist() throws SystemException {
		if (this.isNew()) {
			PartLocalServiceUtil.addPart(this);
		}
		else {
			PartLocalServiceUtil.updatePart(this);
		}
	}

	@SuppressWarnings("unused")
	public void prepareLocalizedFieldsForImport(Locale defaultImportLocale)
		throws LocaleException {
		setName(getName(defaultImportLocale), defaultImportLocale,
			defaultImportLocale);
	}

	@Override
	public Part toEscapedModel() {
		return (Part)ProxyUtil.newProxyInstance(Part.class.getClassLoader(),
			new Class[] { Part.class }, new AutoEscapeBeanHandler(this));
	}

	public Part toUnescapedModel() {
		return this;
	}

	@Override
	public Object clone() {
		PartClp clone = new PartClp();

		clone.setPartId(getPartId());
		clone.setCompanyId(getCompanyId());
		clone.setGroupId(getGroupId());
		clone.setUserId(getUserId());
		clone.setManufacturerId(getManufacturerId());
		clone.setName(getName());
		clone.setPartNumber(getPartNumber());
		clone.setOrderDate(getOrderDate());
		clone.setQuantity(getQuantity());

		return clone;
	}

	public int compareTo(Part part) {
		int value = 0;

		value = getName().compareTo(part.getName());

		if (value != 0) {
			return value;
		}

		return 0;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof PartClp)) {
			return false;
		}

		PartClp part = (PartClp)obj;

		long primaryKey = part.getPrimaryKey();

		if (getPrimaryKey() == primaryKey) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public int hashCode() {
		return (int)getPrimaryKey();
	}

	@Override
	public String toString() {
		StringBundler sb = new StringBundler(19);

		sb.append("{partId=");
		sb.append(getPartId());
		sb.append(", companyId=");
		sb.append(getCompanyId());
		sb.append(", groupId=");
		sb.append(getGroupId());
		sb.append(", userId=");
		sb.append(getUserId());
		sb.append(", manufacturerId=");
		sb.append(getManufacturerId());
		sb.append(", name=");
		sb.append(getName());
		sb.append(", partNumber=");
		sb.append(getPartNumber());
		sb.append(", orderDate=");
		sb.append(getOrderDate());
		sb.append(", quantity=");
		sb.append(getQuantity());
		sb.append("}");

		return sb.toString();
	}

	public String toXmlString() {
		StringBundler sb = new StringBundler(31);

		sb.append("<model><model-name>");
		sb.append("com.liferay.training.parts.model.Part");
		sb.append("</model-name>");

		sb.append(
			"<column><column-name>partId</column-name><column-value><![CDATA[");
		sb.append(getPartId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>companyId</column-name><column-value><![CDATA[");
		sb.append(getCompanyId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>groupId</column-name><column-value><![CDATA[");
		sb.append(getGroupId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>userId</column-name><column-value><![CDATA[");
		sb.append(getUserId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>manufacturerId</column-name><column-value><![CDATA[");
		sb.append(getManufacturerId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>name</column-name><column-value><![CDATA[");
		sb.append(getName());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>partNumber</column-name><column-value><![CDATA[");
		sb.append(getPartNumber());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>orderDate</column-name><column-value><![CDATA[");
		sb.append(getOrderDate());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>quantity</column-name><column-value><![CDATA[");
		sb.append(getQuantity());
		sb.append("]]></column-value></column>");

		sb.append("</model>");

		return sb.toString();
	}

	private long _partId;
	private long _companyId;
	private long _groupId;
	private long _userId;
	private String _userUuid;
	private long _manufacturerId;
	private String _name;
	private String _nameCurrentLanguageId;
	private String _partNumber;
	private Date _orderDate;
	private int _quantity;
	private BaseModel<?> _partRemoteModel;
}