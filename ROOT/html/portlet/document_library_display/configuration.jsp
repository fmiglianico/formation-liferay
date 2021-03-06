<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */
--%>

<%@ include file="/html/portlet/document_library_display/init.jsp" %>

<%
String strutsAction = "/document_library_display";

if (portletResource.equals(PortletKeys.DOCUMENT_LIBRARY)) {
	strutsAction = "/document_library";
}

String redirect = ParamUtil.getString(request, "redirect");

String portletNameSpace = PortalUtil.getPortletNamespace(portletResource);
%>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationURL" />

<aui:form action="<%= configurationURL %>" method="post" name="fm" onSubmit='<%= "event.preventDefault(); " + renderResponse.getNamespace() + "saveConfiguration();" %>'>
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
	<aui:input name="redirect" type="hidden" value="<%= redirect %>" />
	<aui:input name="preferences--rootFolderId--" type="hidden" value="<%= rootFolderId %>" />
	<aui:input name="preferences--folderColumns--" type="hidden" />
	<aui:input name="preferences--fileEntryColumns--" type="hidden" />

	<liferay-ui:error key="rootFolderId" message="please-enter-a-valid-root-folder" />

	<liferay-ui:panel-container extended="<%= true %>" id="documentLibrarySettingsPanelContainer" persistState="<%= true %>">
		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="documentLibraryDisplay" persistState="<%= true %>" title="display-settings">
			<aui:input label="show-actions" name="preferences--showActions--" type="checkbox" value="<%= showActions %>" />

			<aui:input label="show-folder-menu" name="preferences--showFolderMenu--" type="checkbox" value="<%= showFolderMenu %>" />

			<aui:input label="show-navigation-links" name="preferences--showTabs--" type="checkbox" value="<%= showTabs %>" />

			<aui:input label="show-search" name="preferences--showFoldersSearch--" type="checkbox" value="<%= showFoldersSearch %>" />
		</liferay-ui:panel>

		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="documentLibraryFoldersListingPanel" persistState="<%= true %>" title="folders-listing">
			<aui:fieldset>
				<aui:field-wrapper label="root-folder">
					<portlet:renderURL var="viewFolderURL">
						<portlet:param name="struts_action" value='<%= strutsAction + "/view" %>' />
						<portlet:param name="folderId" value="<%= String.valueOf(rootFolderId) %>" />
					</portlet:renderURL>

					<aui:a href="<%= viewFolderURL %>" id="rootFolderName"><%= rootFolderName %></aui:a>

					<aui:button name="openFolderSelectorButton" onClick='<%= renderResponse.getNamespace() + "openFolderSelector();" %>' value="select" />

					<%
					String taglibRemoveFolder = "Liferay.Util.removeFolderSelection('rootFolderId', 'rootFolderName', '" + renderResponse.getNamespace() + "');";
					%>

					<aui:button disabled="<%= rootFolderId <= 0 %>" name="removeFolderButton" onClick="<%= taglibRemoveFolder %>" value="remove" />
				</aui:field-wrapper>

				<aui:input name="preferences--showSubfolders--" type="checkbox" value="<%= showSubfolders %>" />

				<aui:input name="preferences--foldersPerPage--" size="2" type="text" value="<%= foldersPerPage %>" />

				<aui:field-wrapper label="show-columns">

					<%
					Set availableFolderColumns = SetUtil.fromArray(StringUtil.split(allFolderColumns));

					// Left list

					List leftList = new ArrayList();

					for (int i = 0; i < folderColumns.length; i++) {
						String folderColumn = folderColumns[i];

						leftList.add(new KeyValuePair(folderColumn, LanguageUtil.get(pageContext, folderColumn)));
					}

					// Right list

					List rightList = new ArrayList();

					Arrays.sort(folderColumns);

					Iterator itr = availableFolderColumns.iterator();

					while (itr.hasNext()) {
						String folderColumn = (String)itr.next();

						if (Arrays.binarySearch(folderColumns, folderColumn) < 0) {
							rightList.add(new KeyValuePair(folderColumn, LanguageUtil.get(pageContext, folderColumn)));
						}
					}

					rightList = ListUtil.sort(rightList, new KeyValuePairComparator(false, true));
					%>

					<liferay-ui:input-move-boxes
						leftBoxName="currentFolderColumns"
						leftList="<%= leftList %>"
						leftReorder="true"
						leftTitle="current"
						rightBoxName="availableFolderColumns"
						rightList="<%= rightList %>"
						rightTitle="available"
					/>
				</aui:field-wrapper>
			</aui:fieldset>
		</liferay-ui:panel>

		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="documentLibraryDocumentsListingPanel" persistState="<%= true %>" title="documents-listing">
			<aui:fieldset>
				<aui:input label="documents-per-page" name="preferences--fileEntriesPerPage--" size="2" type="text" value="<%= fileEntriesPerPage %>" />

				<aui:field-wrapper label="show-columns">

					<%
					Set availableFileEntryColumns = SetUtil.fromArray(StringUtil.split(allFileEntryColumns));

					// Left list

					List leftList = new ArrayList();

					for (int i = 0; i < fileEntryColumns.length; i++) {
						String fileEntryColumn = fileEntryColumns[i];

						leftList.add(new KeyValuePair(fileEntryColumn, LanguageUtil.get(pageContext, fileEntryColumn)));
					}

					// Right list

					List rightList = new ArrayList();

					Arrays.sort(fileEntryColumns);

					Iterator itr = availableFileEntryColumns.iterator();

					while (itr.hasNext()) {
						String fileEntryColumn = (String)itr.next();

						if (Arrays.binarySearch(fileEntryColumns, fileEntryColumn) < 0) {
							rightList.add(new KeyValuePair(fileEntryColumn, LanguageUtil.get(pageContext, fileEntryColumn)));
						}
					}

					rightList = ListUtil.sort(rightList, new KeyValuePairComparator(false, true));
					%>

					<liferay-ui:input-move-boxes
						leftBoxName="currentFileEntryColumns"
						leftList="<%= leftList %>"
						leftReorder="true"
						leftTitle="current"
						rightBoxName="availableFileEntryColumns"
						rightList="<%= rightList %>"
						rightTitle="available"
					/>
				</aui:field-wrapper>
			</aui:fieldset>
		</liferay-ui:panel>

		<liferay-ui:panel collapsible="<%= true %>" extended="<%= true %>" id="documentLibraryDocumentsRatingsPanel" persistState="<%= true %>" title="ratings">
			<aui:input name="preferences--enableCommentRatings--" type="checkbox" value="<%= enableCommentRatings %>" />
		</liferay-ui:panel>
	</liferay-ui:panel-container>

	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>

<aui:script>
	function <portlet:namespace />openFolderSelector() {
		var folderWindow = window.open('<liferay-portlet:renderURL windowState="<%= LiferayWindowState.POP_UP.toString() %>" portletName="<%= portletResource %>"><portlet:param name="struts_action" value='<%= strutsAction + "/select_folder" %>' /></liferay-portlet:renderURL>', 'folder', 'directories=no,height=640,location=no,menubar=no,resizable=yes,scrollbars=yes,status=no,toolbar=no,width=830');

		folderWindow.focus();
	}

	function <%= portletNameSpace %>selectFolder(rootFolderId, rootFolderName) {
		var folderData = {
			idString: 'rootFolderId',
			idValue: rootFolderId,
			nameString: 'rootFolderName',
			nameValue: rootFolderName
		};

		Liferay.Util.selectFolder(folderData, '<liferay-portlet:renderURL portletName="<%= HtmlUtil.escapeJS(portletResource) %>"><portlet:param name="struts_action" value='<%= strutsAction + "/view" %>' /></liferay-portlet:renderURL>', '<portlet:namespace />');
	}

	Liferay.provide(
		window,
		'<portlet:namespace />saveConfiguration',
		function() {
			document.<portlet:namespace />fm.<portlet:namespace />folderColumns.value = Liferay.Util.listSelect(document.<portlet:namespace />fm.<portlet:namespace />currentFolderColumns);
			document.<portlet:namespace />fm.<portlet:namespace />fileEntryColumns.value = Liferay.Util.listSelect(document.<portlet:namespace />fm.<portlet:namespace />currentFileEntryColumns);

			submitForm(document.<portlet:namespace />fm);
		},
		['liferay-util-list-fields']
	);
</aui:script>

<c:if test="<%= SessionMessages.contains(renderRequest, portletDisplay.getId() + SessionMessages.KEY_SUFFIX_UPDATED_CONFIGURATION) %>">
	<aui:script position="inline" use="aui-base">
		var valueMap = {};

		var foldersPerPageInput = A.one('#<portlet:namespace />foldersPerPage');

		if (foldersPerPageInput) {
			valueMap.delta1 = foldersPerPageInput.val();
		}

		var fileEntriesPerPageInput = A.one('#<portlet:namespace />fileEntriesPerPage');

		if (fileEntriesPerPageInput) {
			valueMap.delta2 = fileEntriesPerPageInput.val();
		}

		var portlet = Liferay.Util.getTop().AUI().one('#p_p_id<%= portletNameSpace %>');

		portlet.refreshURL = portlet.refreshURL.replace(
			/(cur\d{1}|delta[12])(=|%3D)[^%&]+/g,
			function(match, param, equals) {
				return param + equals + (valueMap[param] || 1);
			}
		);
	</aui:script>
</c:if>