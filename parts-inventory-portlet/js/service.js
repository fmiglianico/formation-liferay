Liferay.Service.register("Liferay.Service.Inventory", "com.liferay.training.parts.service", "parts-inventory-portlet");

Liferay.Service.registerClass(
	Liferay.Service.Inventory, "Manufacturer",
	{
		addManufacturer: true,
		deleteManufacturer: true,
		getManufacturer: true,
		getManufacturersByGroupId: true
	}
);