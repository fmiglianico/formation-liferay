<%@include file="/html/init.jsp"%>

<%
	boolean hasAddPermission = permissionChecker.hasPermission(
			scopeGroupId, "com.liferay.training.parts.model",
			scopeGroupId, "ADD_MANUFACTURER");
	boolean hasConfigurePermission = permissionChecker.hasPermission(
			scopeGroupId, "com.liferay.training.parts.model",
			scopeGroupId, ActionKeys.PERMISSIONS);
%>
<liferay-ui:success key="manufacturer-added"
	message="manufacturer-added-successfully" />
<liferay-ui:success key="manufacturer-updated"
	message="manufacturer-updated-successfully" />
<liferay-ui:success key="manufacturer-deleted"
	message="manufacturer-deleted-successfully" />

<%
	String redirect = PortalUtil.getCurrentURL(renderRequest);
%>

<aui:button-row cssClass="manufacturer-buttons">
	<c:if test='<%=hasAddPermission%>'>
		<portlet:renderURL var="addManufacturerURL">
			<portlet:param name="mvcPath"
				value="/html/manufacturer/edit_manufacturer.jsp" />
			<portlet:param name="redirect" value="<%=redirect%>" />
		</portlet:renderURL>

		<aui:script use="aui-button-item">
			var buttonRow = A.one(".manufacturer-buttons");
			
			var buttonLabel = "<liferay-ui:message key="add-manufacturer" />";
			
			var button = new A.ButtonItem({
				icon: 'plusthick',
				label: buttonLabel,
				handler: function(event) {
					location.href = "<%=addManufacturerURL.toString() %>";
				}
			}).render(buttonRow);
			
			A.getDoc().on('key', function() {
					button.fire('click');
				}, 'down:77+alt+shift');
		</aui:script>
		
	</c:if>
	<c:if test='<%= hasConfigurePermission %>'>
		<liferay-security:permissionsURL
			modelResource="com.liferay.training.parts.model"
			modelResourceDescription="parts-top-level-actions"
			resourcePrimKey="<%= String.valueOf(scopeGroupId) %>"
			var="permissionsURL" />

		<aui:script use="aui-button-item">
			var buttonRow = A.one(".manufacturer-buttons");
			
			var buttonLabel = "<liferay-ui:message key="Permissions" />";
			
			var button = new A.ButtonItem({
				icon: 'gear',
				label: buttonLabel,
				handler: function(event) {
					location.href = "<%=permissionsURL%>";
				}
			}).render(buttonRow);
		</aui:script>
	</c:if>

	    
</aui:button-row>

<liferay-ui:search-container
	emptyResultsMessage="manufacturer-empty-results-message">
	<liferay-ui:search-container-results
		results="<%=ManufacturerLocalServiceUtil
						.getManufacturersByGroupId(scopeGroupId,
								searchContainer.getStart(),
								searchContainer.getEnd())%>"
		total="<%=ManufacturerLocalServiceUtil
						.getManufacturersCountByGroupId(scopeGroupId)%>" />

	<liferay-ui:search-container-row
		className="com.liferay.training.parts.model.Manufacturer"
		keyProperty="manufacturerId" modelVar="manufacturer"
		escapedModel="<%=true%>">
		<liferay-ui:search-container-column-text name="name"
			value="<%=manufacturer.getName()%>" />

		<liferay-ui:search-container-column-text name="email-address"
			property="emailAddress" />

		<liferay-ui:search-container-column-text name="phone-number"
			property="phoneNumber" />

		<liferay-ui:search-container-column-text name="website"
			property="website" />

		<liferay-ui:search-container-column-jsp align="right"
			path="/html/manufacturer/manufacturer_actions.jsp" />
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>