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
 * This class is a wrapper for {@link PartLocalService}.
 * </p>
 *
 * @author    François Miglianico
 * @see       PartLocalService
 * @generated
 */
public class PartLocalServiceWrapper implements PartLocalService,
	ServiceWrapper<PartLocalService> {
	public PartLocalServiceWrapper(PartLocalService partLocalService) {
		_partLocalService = partLocalService;
	}

	/**
	* Adds the part to the database. Also notifies the appropriate model listeners.
	*
	* @param part the part
	* @return the part that was added
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.training.parts.model.Part addPart(
		com.liferay.training.parts.model.Part part)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.addPart(part);
	}

	/**
	* Creates a new part with the primary key. Does not add the part to the database.
	*
	* @param partId the primary key for the new part
	* @return the new part
	*/
	public com.liferay.training.parts.model.Part createPart(long partId) {
		return _partLocalService.createPart(partId);
	}

	/**
	* Deletes the part with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param partId the primary key of the part
	* @return the part that was removed
	* @throws PortalException if a part with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.training.parts.model.Part deletePart(long partId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.deletePart(partId);
	}

	/**
	* Deletes the part from the database. Also notifies the appropriate model listeners.
	*
	* @param part the part
	* @return the part that was removed
	* @throws PortalException
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.training.parts.model.Part deletePart(
		com.liferay.training.parts.model.Part part)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.deletePart(part);
	}

	public com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery() {
		return _partLocalService.dynamicQuery();
	}

	/**
	* Performs a dynamic query on the database and returns the matching rows.
	*
	* @param dynamicQuery the dynamic query
	* @return the matching rows
	* @throws SystemException if a system exception occurred
	*/
	@SuppressWarnings("rawtypes")
	public java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.dynamicQuery(dynamicQuery);
	}

	/**
	* Performs a dynamic query on the database and returns a range of the matching rows.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set.
	* </p>
	*
	* @param dynamicQuery the dynamic query
	* @param start the lower bound of the range of model instances
	* @param end the upper bound of the range of model instances (not inclusive)
	* @return the range of matching rows
	* @throws SystemException if a system exception occurred
	*/
	@SuppressWarnings("rawtypes")
	public java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
		int end) throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.dynamicQuery(dynamicQuery, start, end);
	}

	/**
	* Performs a dynamic query on the database and returns an ordered range of the matching rows.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set.
	* </p>
	*
	* @param dynamicQuery the dynamic query
	* @param start the lower bound of the range of model instances
	* @param end the upper bound of the range of model instances (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching rows
	* @throws SystemException if a system exception occurred
	*/
	@SuppressWarnings("rawtypes")
	public java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
		int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.dynamicQuery(dynamicQuery, start, end,
			orderByComparator);
	}

	/**
	* Returns the number of rows that match the dynamic query.
	*
	* @param dynamicQuery the dynamic query
	* @return the number of rows that match the dynamic query
	* @throws SystemException if a system exception occurred
	*/
	public long dynamicQueryCount(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.dynamicQueryCount(dynamicQuery);
	}

	public com.liferay.training.parts.model.Part fetchPart(long partId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.fetchPart(partId);
	}

	/**
	* Returns the part with the primary key.
	*
	* @param partId the primary key of the part
	* @return the part
	* @throws PortalException if a part with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.training.parts.model.Part getPart(long partId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.getPart(partId);
	}

	public com.liferay.portal.model.PersistedModel getPersistedModel(
		java.io.Serializable primaryKeyObj)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.getPersistedModel(primaryKeyObj);
	}

	/**
	* Returns a range of all the parts.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set.
	* </p>
	*
	* @param start the lower bound of the range of parts
	* @param end the upper bound of the range of parts (not inclusive)
	* @return the range of parts
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<com.liferay.training.parts.model.Part> getParts(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.getParts(start, end);
	}

	/**
	* Returns the number of parts.
	*
	* @return the number of parts
	* @throws SystemException if a system exception occurred
	*/
	public int getPartsCount()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.getPartsCount();
	}

	/**
	* Updates the part in the database or adds it if it does not yet exist. Also notifies the appropriate model listeners.
	*
	* @param part the part
	* @return the part that was updated
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.training.parts.model.Part updatePart(
		com.liferay.training.parts.model.Part part)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.updatePart(part);
	}

	/**
	* Updates the part in the database or adds it if it does not yet exist. Also notifies the appropriate model listeners.
	*
	* @param part the part
	* @param merge whether to merge the part with the current session. See {@link com.liferay.portal.service.persistence.BatchSession#update(com.liferay.portal.kernel.dao.orm.Session, com.liferay.portal.model.BaseModel, boolean)} for an explanation.
	* @return the part that was updated
	* @throws SystemException if a system exception occurred
	*/
	public com.liferay.training.parts.model.Part updatePart(
		com.liferay.training.parts.model.Part part, boolean merge)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.updatePart(part, merge);
	}

	/**
	* Returns the Spring bean ID for this bean.
	*
	* @return the Spring bean ID for this bean
	*/
	public java.lang.String getBeanIdentifier() {
		return _partLocalService.getBeanIdentifier();
	}

	/**
	* Sets the Spring bean ID for this bean.
	*
	* @param beanIdentifier the Spring bean ID for this bean
	*/
	public void setBeanIdentifier(java.lang.String beanIdentifier) {
		_partLocalService.setBeanIdentifier(beanIdentifier);
	}

	public java.lang.Object invokeMethod(java.lang.String name,
		java.lang.String[] parameterTypes, java.lang.Object[] arguments)
		throws java.lang.Throwable {
		return _partLocalService.invokeMethod(name, parameterTypes, arguments);
	}

	/**
	* Adds the Part to the database incrementing the primary key
	*
	* @throws PortalException
	*/
	public com.liferay.training.parts.model.Part addPart(
		com.liferay.training.parts.model.Part newPart, long userId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.addPart(newPart, userId);
	}

	/**
	* Gets a list with all the Parts in a group
	*/
	public java.util.List<com.liferay.training.parts.model.Part> getPartsByGroupId(
		long groupId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.getPartsByGroupId(groupId);
	}

	/**
	* Gets a list with a range of Parts from a group
	*/
	public java.util.List<com.liferay.training.parts.model.Part> getPartsByGroupId(
		long groupId, int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.getPartsByGroupId(groupId, start, end);
	}

	/**
	* Gets the number of Parts in a group
	*/
	public int getPartsCountByGroupId(long groupId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.getPartsCountByGroupId(groupId);
	}

	/**
	* Gets a list of Parts from a Manufacturer
	*/
	public java.util.List<com.liferay.training.parts.model.Part> getPartsbyManufacturer(
		long manufacturerId, long groupId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _partLocalService.getPartsbyManufacturer(manufacturerId, groupId);
	}

	/**
	 * @deprecated Renamed to {@link #getWrappedService}
	 */
	public PartLocalService getWrappedPartLocalService() {
		return _partLocalService;
	}

	/**
	 * @deprecated Renamed to {@link #setWrappedService}
	 */
	public void setWrappedPartLocalService(PartLocalService partLocalService) {
		_partLocalService = partLocalService;
	}

	public PartLocalService getWrappedService() {
		return _partLocalService;
	}

	public void setWrappedService(PartLocalService partLocalService) {
		_partLocalService = partLocalService;
	}

	private PartLocalService _partLocalService;
}