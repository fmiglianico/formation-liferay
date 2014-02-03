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

<%@ include file="/html/portlet/document_library/init.jsp" %>

<%
Folder folder = (com.liferay.portal.kernel.repository.model.Folder)request.getAttribute(WebKeys.DOCUMENT_LIBRARY_FOLDER);

long folderId = BeanParamUtil.getLong(folder, request, "folderId", rootFolderId);

if ((folder == null) && (folderId != DLFolderConstants.DEFAULT_PARENT_FOLDER_ID)) {
	try {
		folder = DLAppLocalServiceUtil.getFolder(folderId);
	}
	catch (NoSuchFolderException nsfe) {
		folderId = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;
	}
}

long repositoryId = scopeGroupId;

if (folder != null) {
	repositoryId = folder.getRepositoryId();
}

String displayStyle = ParamUtil.getString(request, "displayStyle");

if (Validator.isNull(displayStyle)) {
	displayStyle = portalPreferences.getValue(PortletKeys.DOCUMENT_LIBRARY, "display-style", PropsValues.DL_DEFAULT_DISPLAY_VIEW);
}

if (!ArrayUtil.contains(displayViews, displayStyle)) {
	displayStyle = displayViews[0];
}

int entryStart = ParamUtil.getInteger(request, "entryStart");
int entryEnd = ParamUtil.getInteger(request, "entryEnd", entriesPerPage);

int folderStart = ParamUtil.getInteger(request, "folderStart");
int folderEnd = ParamUtil.getInteger(request, "folderEnd", SearchContainer.DEFAULT_DELTA);

int folderRowsPerPage = folderEnd - folderStart;

String orderByCol = ParamUtil.getString(request, "orderByCol");
String orderByType = ParamUtil.getString(request, "orderByType");

if (Validator.isNotNull(orderByCol) && Validator.isNotNull(orderByType)) {
	portalPreferences.setValue(PortletKeys.DOCUMENT_LIBRARY, "order-by-col", orderByCol);
	portalPreferences.setValue(PortletKeys.DOCUMENT_LIBRARY, "order-by-type", orderByType);
}

request.setAttribute("view.jsp-folder", folder);

request.setAttribute("view.jsp-folderId", String.valueOf(folderId));

request.setAttribute("view.jsp-repositoryId", String.valueOf(repositoryId));
%>

<div id="<portlet:namespace />documentLibraryContainer">
	<aui:layout cssClass="lfr-app-column-view">
		<aui:column columnWidth="<%= 20 %>" cssClass="navigation-pane" first="<%= true %>">
			<liferay-util:include page="/html/portlet/document_library/view_folders.jsp" />

			<div class="folder-paginator"></div>
		</aui:column>

		<aui:column columnWidth="<%= showFolderMenu ? 80 : 100 %>" cssClass="context-pane" last="<%= true %>">
			<div class="lfr-header-row">
				<div class="lfr-header-row-content">
					<c:if test="<%= showFoldersSearch %>">
						<liferay-util:include page="/html/portlet/document_library/file_entry_search.jsp" />
					</c:if>

					<div class="toolbar">
						<liferay-util:include page="/html/portlet/document_library/toolbar.jsp" />
					</div>

					<div class="display-style">
						<span class="toolbar" id="<portlet:namespace />displayStyleToolbar"></span>
					</div>
				</div>
			</div>

			<div class="document-library-breadcrumb" id="<portlet:namespace />breadcrumbContainer">
				<liferay-util:include page="/html/portlet/document_library/breadcrumb.jsp" />
			</div>

			<liferay-portlet:renderURL varImpl="editFileEntryURL">
				<portlet:param name="struts_action" value="/document_library/edit_file_entry" />
			</liferay-portlet:renderURL>

			<aui:form action="<%= editFileEntryURL.toString() %>" method="get" name="fm2">
				<aui:input name="<%= Constants.CMD %>" type="hidden" />
				<aui:input name="redirect" type="hidden" value="<%= currentURL %>" />
				<aui:input name="repositoryId" type="hidden" value="<%= repositoryId %>" />
				<aui:input name="newFolderId" type="hidden" />
				<aui:input name="folderIds" type="hidden" />
				<aui:input name="fileEntryIds" type="hidden" />
				<aui:input name="fileShortcutIds" type="hidden" />

				<div class="document-container" id="<portlet:namespace />documentContainer">
					<liferay-util:include page="/html/portlet/document_library/view_entries.jsp" />
				</div>

				<div class="document-entries-paginator"></div>
			</aui:form>
		</aui:column>
	</aui:layout>
</div>

<%
int entriesTotal = GetterUtil.getInteger((String)request.getAttribute("view_entries.jsp-total"));
int foldersTotal = GetterUtil.getInteger((String)request.getAttribute("view_folders.jsp-total"));

entryEnd = GetterUtil.getInteger(request.getAttribute("view_entries.jsp-entryEnd"), entryEnd);
entryStart = GetterUtil.getInteger(request.getAttribute("view_entries.jsp-entryStart"), entryStart);

if (folder != null) {
	if (portletName.equals(PortletKeys.DOCUMENT_LIBRARY)) {
		PortalUtil.setPageSubtitle(folder.getName(), request);
		PortalUtil.setPageDescription(folder.getDescription(), request);
	}
}
%>

<aui:script>
	Liferay.provide(
		window,
		'<portlet:namespace />toggleActionsButton',
		function() {
			var A = AUI();

			var actionsButton = A.one('#<portlet:namespace />actionsButtonContainer');

			var hide = (Liferay.Util.listCheckedExcept(document.<portlet:namespace />fm2, '<portlet:namespace /><%= RowChecker.ALL_ROW_IDS %>Checkbox').length == 0);

			if (actionsButton) {
				actionsButton.toggle(!hide);
			}
		},
		['liferay-util-list-fields']
	);

	<portlet:namespace />toggleActionsButton();
</aui:script>

<span id="<portlet:namespace />displayStyleButtonsContainer">
	<liferay-util:include page="/html/portlet/document_library/display_style_buttons.jsp" />
</span>

<aui:script use="liferay-document-library">
	<liferay-portlet:resourceURL copyCurrentRenderParameters="<%= false %>" varImpl="mainURL" />

	new Liferay.Portlet.DocumentLibrary(
		{
			actions: {
				DELETE: '<%= Constants.DELETE %>',
				MOVE: '<%= Constants.MOVE %>'
			},
			allRowIds: '<%= RowChecker.ALL_ROW_IDS %>',
			defaultParams: {
				p_p_id: <%= portletId %>,
				p_p_lifecycle: 0
			},
			defaultParentFolderId: '<%= DLFolderConstants.DEFAULT_PARENT_FOLDER_ID %>',
			displayStyle: '<%= HtmlUtil.escapeJS(displayStyle) %>',
			displayViews: ['<%= StringUtil.merge(displayViews, "','") %>'],
			editEntryUrl: '<portlet:actionURL><portlet:param name="struts_action" value="/document_library/edit_entry" /></portlet:actionURL>',
			entriesTotal: <%= entriesTotal %>,
			entryEnd: <%= entryEnd %>,
			entryRowsPerPage: <%= entryEnd - entryStart %>,
			entryRowsPerPageOptions: [<%= StringUtil.merge(PropsValues.SEARCH_CONTAINER_PAGE_DELTA_VALUES) %>],
			entryStart: <%= entryStart %>,
			folderEnd: <%= folderEnd %>,
			folderId: <%= folderId %>,
			folderIdRegEx: /&?<portlet:namespace />folderId=([\d]+)/i,
			folderIdHashRegEx: /#.*&?<portlet:namespace />folderId=([\d]+)/i,
			folderRowsPerPage: <%= folderRowsPerPage %>,
			folderRowsPerPageOptions: [<%= StringUtil.merge(PropsValues.SEARCH_CONTAINER_PAGE_DELTA_VALUES) %>],
			folderStart: <%= folderStart %>,
			foldersTotal: <%= foldersTotal %>,
			form: {
				method: 'post',
				node: A.one(document.<portlet:namespace />fm2)
			},
			mainUrl: '<%= mainURL %>',
			moveEntryRenderUrl: '<portlet:renderURL><portlet:param name="struts_action" value="/document_library/move_entry" /></portlet:renderURL>',
			namespace: '<portlet:namespace />',
			portletId: '<%= portletId %>',
			rowIds: '<%= RowChecker.ROW_IDS %>',
			strutsAction: '/document_library/view',
			updateable: <%= DLFolderPermission.contains(permissionChecker, scopeGroupId, folderId, ActionKeys.UPDATE) %>
		}
	);
</aui:script>