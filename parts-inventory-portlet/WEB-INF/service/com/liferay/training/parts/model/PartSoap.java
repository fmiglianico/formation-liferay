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
import java.util.Date;
import java.util.List;

/**
 * This class is used by SOAP remote services, specifically {@link com.liferay.training.parts.service.http.PartServiceSoap}.
 *
 * @author    François Miglianico
 * @see       com.liferay.training.parts.service.http.PartServiceSoap
 * @generated
 */
public class PartSoap implements Serializable {
	public static PartSoap toSoapModel(Part model) {
		PartSoap soapModel = new PartSoap();

		soapModel.setPartId(model.getPartId());
		soapModel.setCompanyId(model.getCompanyId());
		soapModel.setGroupId(model.getGroupId());
		soapModel.setUserId(model.getUserId());
		soapModel.setManufacturerId(model.getManufacturerId());
		soapModel.setName(model.getName());
		soapModel.setPartNumber(model.getPartNumber());
		soapModel.setOrderDate(model.getOrderDate());
		soapModel.setQuantity(model.getQuantity());

		return soapModel;
	}

	public static PartSoap[] toSoapModels(Part[] models) {
		PartSoap[] soapModels = new PartSoap[models.length];

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModel(models[i]);
		}

		return soapModels;
	}

	public static PartSoap[][] toSoapModels(Part[][] models) {
		PartSoap[][] soapModels = null;

		if (models.length > 0) {
			soapModels = new PartSoap[models.length][models[0].length];
		}
		else {
			soapModels = new PartSoap[0][0];
		}

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModels(models[i]);
		}

		return soapModels;
	}

	public static PartSoap[] toSoapModels(List<Part> models) {
		List<PartSoap> soapModels = new ArrayList<PartSoap>(models.size());

		for (Part model : models) {
			soapModels.add(toSoapModel(model));
		}

		return soapModels.toArray(new PartSoap[soapModels.size()]);
	}

	public PartSoap() {
	}

	public long getPrimaryKey() {
		return _partId;
	}

	public void setPrimaryKey(long pk) {
		setPartId(pk);
	}

	public long getPartId() {
		return _partId;
	}

	public void setPartId(long partId) {
		_partId = partId;
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

	public long getManufacturerId() {
		return _manufacturerId;
	}

	public void setManufacturerId(long manufacturerId) {
		_manufacturerId = manufacturerId;
	}

	public String getName() {
		return _name;
	}

	public void setName(String name) {
		_name = name;
	}

	public String getPartNumber() {
		return _partNumber;
	}

	public void setPartNumber(String partNumber) {
		_partNumber = partNumber;
	}

	public Date getOrderDate() {
		return _orderDate;
	}

	public void setOrderDate(Date orderDate) {
		_orderDate = orderDate;
	}

	public int getQuantity() {
		return _quantity;
	}

	public void setQuantity(int quantity) {
		_quantity = quantity;
	}

	private long _partId;
	private long _companyId;
	private long _groupId;
	private long _userId;
	private long _manufacturerId;
	private String _name;
	private String _partNumber;
	private Date _orderDate;
	private int _quantity;
}