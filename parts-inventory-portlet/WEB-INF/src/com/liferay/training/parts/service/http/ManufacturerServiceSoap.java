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

package com.liferay.training.parts.service.http;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;

import com.liferay.training.parts.service.ManufacturerServiceUtil;

import java.rmi.RemoteException;

/**
 * <p>
 * This class provides a SOAP utility for the
 * {@link com.liferay.training.parts.service.ManufacturerServiceUtil} service utility. The
 * static methods of this class calls the same methods of the service utility.
 * However, the signatures are different because it is difficult for SOAP to
 * support certain types.
 * </p>
 *
 * <p>
 * ServiceBuilder follows certain rules in translating the methods. For example,
 * if the method in the service utility returns a {@link java.util.List}, that
 * is translated to an array of {@link com.liferay.training.parts.model.ManufacturerSoap}.
 * If the method in the service utility returns a
 * {@link com.liferay.training.parts.model.Manufacturer}, that is translated to a
 * {@link com.liferay.training.parts.model.ManufacturerSoap}. Methods that SOAP cannot
 * safely wire are skipped.
 * </p>
 *
 * <p>
 * The benefits of using the SOAP utility is that it is cross platform
 * compatible. SOAP allows different languages like Java, .NET, C++, PHP, and
 * even Perl, to call the generated services. One drawback of SOAP is that it is
 * slow because it needs to serialize all calls into a text format (XML).
 * </p>
 *
 * <p>
 * You can see a list of services at
 * http://localhost:8080/api/secure/axis. Set the property
 * <b>axis.servlet.hosts.allowed</b> in portal.properties to configure
 * security.
 * </p>
 *
 * <p>
 * The SOAP utility is only generated for remote services.
 * </p>
 *
 * @author    François Miglianico
 * @see       ManufacturerServiceHttp
 * @see       com.liferay.training.parts.model.ManufacturerSoap
 * @see       com.liferay.training.parts.service.ManufacturerServiceUtil
 * @generated
 */
public class ManufacturerServiceSoap {
	public static void addManufacturer(long companyId, long groupId,
		long userId, java.lang.String name, java.lang.String emailAddress,
		java.lang.String phoneNumber, java.lang.String website)
		throws RemoteException {
		try {
			ManufacturerServiceUtil.addManufacturer(companyId, groupId, userId,
				name, emailAddress, phoneNumber, website);
		}
		catch (Exception e) {
			_log.error(e, e);

			throw new RemoteException(e.getMessage());
		}
	}

	public static void deleteManufacturer(long manufacturerId)
		throws RemoteException {
		try {
			ManufacturerServiceUtil.deleteManufacturer(manufacturerId);
		}
		catch (Exception e) {
			_log.error(e, e);

			throw new RemoteException(e.getMessage());
		}
	}

	public static com.liferay.training.parts.model.ManufacturerSoap getManufacturer(
		long manufacturerId) throws RemoteException {
		try {
			com.liferay.training.parts.model.Manufacturer returnValue = ManufacturerServiceUtil.getManufacturer(manufacturerId);

			return com.liferay.training.parts.model.ManufacturerSoap.toSoapModel(returnValue);
		}
		catch (Exception e) {
			_log.error(e, e);

			throw new RemoteException(e.getMessage());
		}
	}

	public static com.liferay.training.parts.model.ManufacturerSoap[] getManufacturersByGroupId(
		long groupId) throws RemoteException {
		try {
			java.util.List<com.liferay.training.parts.model.Manufacturer> returnValue =
				ManufacturerServiceUtil.getManufacturersByGroupId(groupId);

			return com.liferay.training.parts.model.ManufacturerSoap.toSoapModels(returnValue);
		}
		catch (Exception e) {
			_log.error(e, e);

			throw new RemoteException(e.getMessage());
		}
	}

	private static Log _log = LogFactoryUtil.getLog(ManufacturerServiceSoap.class);
}