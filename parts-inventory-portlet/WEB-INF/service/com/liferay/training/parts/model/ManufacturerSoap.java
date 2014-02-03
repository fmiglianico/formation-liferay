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

import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;

/**
 * This class is used by SOAP remote services, specifically {@link com.liferay.training.parts.service.http.ManufacturerServiceSoap}.
 *
 * @author    François Miglianico
 * @see       com.liferay.training.parts.service.http.ManufacturerServiceSoap
 * @generated
 */
public class ManufacturerSoap implements Serializable {
	public static ManufacturerSoap toSoapModel(Manufacturer model) {
		ManufacturerSoap soapModel = new ManufacturerSoap();

		soapModel.setManufacturerId(model.getManufacturerId());
		soapModel.setCompanyId(model.getCompanyId());
		soapModel.setGroupId(model.getGroupId());
		soapModel.setUserId(model.getUserId());
		soapModel.setName(model.getName());
		soapModel.setEmailAddress(model.getEmailAddress());
		soapModel.setWebsite(model.getWebsite());
		soapModel.setPhoneNumber(model.getPhoneNumber());

		return soapModel;
	}

	public static ManufacturerSoap[] toSoapModels(Manufacturer[] models) {
		ManufacturerSoap[] soapModels = new ManufacturerSoap[models.length];

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModel(models[i]);
		}

		return soapModels;
	}

	public static ManufacturerSoap[][] toSoapModels(Manufacturer[][] models) {
		ManufacturerSoap[][] soapModels = null;

		if (models.length > 0) {
			soapModels = new ManufacturerSoap[models.length][models[0].length];
		}
		else {
			soapModels = new ManufacturerSoap[0][0];
		}

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModels(models[i]);
		}

		return soapModels;
	}

	public static ManufacturerSoap[] toSoapModels(List<Manufacturer> models) {
		List<ManufacturerSoap> soapModels = new ArrayList<ManufacturerSoap>(models.size());

		for (Manufacturer model : models) {
			soapModels.add(toSoapModel(model));
		}

		return soapModels.toArray(new ManufacturerSoap[soapModels.size()]);
	}

	public ManufacturerSoap() {
	}

	public long getPrimaryKey() {
		return _manufacturerId;
	}

	public void setPrimaryKey(long pk) {
		setManufacturerId(pk);
	}

	public long getManufacturerId() {
		return _manufacturerId;
	}

	public void setManufacturerId(long manufacturerId) {
		_manufacturerId = manufacturerId;
	}

	public long getCompanyId() {
		return _companyId;
	}

	public void setCompanyId(long companyId) {
		_companyId = companyId;
	}

	public long getGroupId() {
		return _groupId;
	}

	public void setGroupId(long groupId) {
		_groupId = groupId;
	}

	public long getUserId() {
		return _userId;
	}

	public void setUserId(long userId) {
		_userId = userId;
	}

	public String getName() {
		return _name;
	}

	public void setName(String name) {
		_name = name;
	}

	public String getEmailAddress() {
		return _emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		_emailAddress = emailAddress;
	}

	public String getWebsite() {
		return _website;
	}

	public void setWebsite(String website) {
		_website = website;
	}

	public String getPhoneNumber() {
		return _phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		_phoneNumber = phoneNumber;
	}

	private long _manufacturerId;
	private long _companyId;
	private long _groupId;
	private long _userId;
	private String _name;
	private String _emailAddress;
	private String _website;
	private String _phoneNumber;
}