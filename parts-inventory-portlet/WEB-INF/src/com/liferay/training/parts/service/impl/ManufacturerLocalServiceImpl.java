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

package com.liferay.training.parts.service.impl;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.ResourceConstants;
import com.liferay.training.parts.model.Manufacturer;
import com.liferay.training.parts.service.base.ManufacturerLocalServiceBaseImpl;

import java.util.List;

/**
 * The implementation of the manufacturer local service.
 *
 * <p>
 * All custom service methods should be put in this class. Whenever methods are added, rerun ServiceBuilder to copy their definitions into the {@link com.liferay.training.parts.service.ManufacturerLocalService} interface.
 *
 * <p>
 * This is a local service. Methods of this service will not have security checks based on the propagated JAAS credentials because this service can only be accessed from within the same VM.
 * </p>
 *
 * @author François Miglianico
 * @see com.liferay.training.parts.service.base.ManufacturerLocalServiceBaseImpl
 * @see com.liferay.training.parts.service.ManufacturerLocalServiceUtil
 */
public class ManufacturerLocalServiceImpl
	extends ManufacturerLocalServiceBaseImpl {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never reference this interface directly. Always use {@link com.liferay.training.parts.service.ManufacturerLocalServiceUtil} to access the manufacturer local service.
	 */
	
	/**
	 * Adds the Manufacturer to the database incrementing the primary key
	 * @throws PortalException
	 * 
	 */
	public Manufacturer addManufacturer(Manufacturer newManufacturer,
			long userId) throws SystemException, PortalException {

		long manufacturerId = counterLocalService
				.increment(Manufacturer.class.getName());

		Manufacturer manufacturer = manufacturerPersistence
				.create(manufacturerId);
		manufacturer.setCompanyId(newManufacturer.getCompanyId());
		manufacturer.setEmailAddress(newManufacturer.getEmailAddress());
		manufacturer.setGroupId(newManufacturer.getGroupId());
		manufacturer.setName(newManufacturer.getName());
		manufacturer.setPhoneNumber(newManufacturer.getPhoneNumber());
		manufacturer.setWebsite(newManufacturer.getWebsite());

		manufacturerPersistence.update(manufacturer, false);

		resourceLocalService.addResources(manufacturer.getCompanyId(),
						manufacturer.getGroupId(), userId,
						Manufacturer.class.getName(), manufacturerId, false,
						true, true);

		return manufacturer;
	}

	/**
	 * Deletes a manufacturer from the database using the Manufacturer object.
	 */
	public Manufacturer deleteManufacturer(Manufacturer manufacturer)
			throws PortalException, SystemException {

		resourceLocalService.deleteResource(manufacturer.getCompanyId(),
				Manufacturer.class.getName(),
				ResourceConstants.SCOPE_INDIVIDUAL,
				manufacturer.getPrimaryKey());

		return super.deleteManufacturer(manufacturer);
	}

	/**
	 * Deletes a manufacturer from the database using a manufacturer ID.
	 */
	public Manufacturer deleteManufacturer(long manufacturerId) throws PortalException,
			SystemException {

		Manufacturer manufacturer = getManufacturer(manufacturerId);

		return deleteManufacturer(manufacturer);
	}

	/**
	 * Gets a list with all the Manufacturers in a group
	 *
	 */
	public List<Manufacturer> getManufacturersByGroupId(long groupId) throws SystemException {
		return manufacturerPersistence.filterFindByGroupId(groupId);
	}

	/**
	 * Gets a list with a range of Manufacturers from a group
	 *
	 */
	public List<Manufacturer> getManufacturersByGroupId(long groupId, int start, int end) throws SystemException {
		return manufacturerPersistence.filterFindByGroupId(groupId, start, end);
	}

	/**
	 * Gets the number of Manufacturers in a group
	 *
	 */
	public int getManufacturersCountByGroupId(long groupId) throws SystemException {
		return manufacturerPersistence.filterCountByGroupId(groupId);
	}
}