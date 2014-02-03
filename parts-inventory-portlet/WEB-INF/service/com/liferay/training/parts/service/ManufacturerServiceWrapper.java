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

package com.liferay.training.parts.service;

import com.liferay.portal.service.ServiceWrapper;

/**
 * <p>
 * This class is a wrapper for {@link ManufacturerService}.
 * </p>
 *
 * @author    François Miglianico
 * @see       ManufacturerService
 * @generated
 */
public class ManufacturerServiceWrapper implements ManufacturerService,
	ServiceWrapper<ManufacturerService> {
	public ManufacturerServiceWrapper(ManufacturerService manufacturerService) {
		_manufacturerService = manufacturerService;
	}

	/**
	* Returns the Spring bean ID for this bean.
	*
	* @return the Spring bean ID for this bean
	*/
	public java.lang.String getBeanIdentifier() {
		return _manufacturerService.getBeanIdentifier();
	}

	/**
	* Sets the Spring bean ID for this bean.
	*
	* @param beanIdentifier the Spring bean ID for this bean
	*/
	public void setBeanIdentifier(java.lang.String beanIdentifier) {
		_manufacturerService.setBeanIdentifier(beanIdentifier);
	}

	public java.lang.Object invokeMethod(java.lang.String name,
		java.lang.String[] parameterTypes, java.lang.Object[] arguments)
		throws java.lang.Throwable {
		return _manufacturerService.invokeMethod(name, parameterTypes, arguments);
	}

	/**
	 * @deprecated Renamed to {@link #getWrappedService}
	 */
	public ManufacturerService getWrappedManufacturerService() {
		return _manufacturerService;
	}

	/**
	 * @deprecated Renamed to {@link #setWrappedService}
	 */
	public void setWrappedManufacturerService(
		ManufacturerService manufacturerService) {
		_manufacturerService = manufacturerService;
	}

	public ManufacturerService getWrappedService() {
		return _manufacturerService;
	}

	public void setWrappedService(ManufacturerService manufacturerService) {
		_manufacturerService = manufacturerService;
	}

	private ManufacturerService _manufacturerService;
}