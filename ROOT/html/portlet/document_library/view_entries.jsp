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
String navigation = ParamUtil.getString(request, "navigation", "home");

Folder folder = (Folder)request.getAttribute(WebKeys.DOCUMENT_LIBRARY_FOLDER);

long folderId = GetterUtil.getLong((String)request.getAttribute("view.jsp-folderId"));

long repositoryId = GetterUtil.getLong((String)request.getAttribute("view.jsp-repositoryId"));

long fileEntryTypeId = ParamUtil.getLong(request, "fileEntryTypeId", -1);

String dlFileEntryTypeName = LanguageUtil.get(pageContext, "basic-document");

int status = WorkflowConstants.STATUS_APPROVED;

if (permissionChecker.isCompanyAdmin() || permissionChecker.isGroupAdmin(scopeGroupId)) {
	status = WorkflowConstants.STATUS_ANY;
}

long categoryId = ParamUtil.getLong(request, "categoryId");
String tagName = ParamUtil.getString(request, "tag");

boolean useAssetEntryQuery = (categoryId > 0) || Validator.isNotNull(tagName);

String displayStyle = ParamUtil.getString(request, "displayStyle");

if (Validator.isNull(displayStyle)) {
	displayStyle = portalPreferences.getValue(PortletKeys.DOCUMENT_LIBRARY, "display-style", PropsValues.DL_DEFAULT_DISPLAY_VIEW);
}
else {
	boolean saveDisplayStyle = ParamUtil.getBoolean(request, "saveDisplayStyle");

	if (saveDisplayStyle && ArrayUtil.contains(displayViews, displayStyle)) {
		portalPreferences.setValue(PortletKeys.DOCUMENT_LIBRARY, "display-style", displayStyle);
	}
}

if (!ArrayUtil.contains(displayViews, displayStyle)) {
	displayStyle = displayViews[0];
}

PortletURL portletURL = liferayPortletResponse.createRenderURL();

portletURL.setParameter("struts_action", "/document_library/view");
portletURL.setParameter("folderId", String.valueOf(folderId));
portletURL.setParameter("displayStyle", String.valueOf(displayStyle));

int entryStart = ParamUtil.getInteger(request, "entryStart");
int entryEnd = ParamUtil.getInteger(request, "entryEnd", entriesPerPage);

SearchContainer searchContainer = new SearchContainer(liferayPortletRequest, null, null, "cur2", entryEnd / (entryEnd - entryStart), entryEnd - entryStart, portletURL, null, null);

List<String> headerNames = new ArrayList<String>();

for (String headerName : entryColumns) {
	if (headerName.equals("action")) {
		headerName = StringPool.BLANK;
	}
	else if (headerName.equals("name")) {
		headerName = "title";
	}

	headerNames.add(headerName);
}

searchContainer.setHeaderNames(headerNames);

EntriesChecker entriesChecker = new EntriesChecker(liferayPortletRequest, liferayPortletResponse);

entriesChecker.setCssClass("document-selector");

searchContainer.setRowChecker(entriesChecker);

Map<String, String> orderableHeaders = new HashMap<String, String>();

orderableHeaders.put("title", "title");
orderableHeaders.put("size", "size");
orderableHeaders.put("create-date", "creationDate");
orderableHeaders.put("modified-date", "modifiedDate");
orderableHeaders.put("downloads", "downloads");

String orderByCol = ParamUtil.getString(request, "orderByCol");
String orderByType = ParamUtil.getString(request, "orderByType");

if (Validator.isNull(orderByCol)) {
	orderByCol = portalPreferences.getValue(PortletKeys.DOCUMENT_LIBRARY, "order-by-col", StringPool.BLANK);
	orderByType = portalPreferences.getValue(PortletKeys.DOCUMENT_LIBRARY, "order-by-type", "asc");
}
else {
	boolean saveOrderBy = ParamUtil.getBoolean(request, "saveOrderBy");

	if (saveOrderBy) {
		portalPreferences.setValue(PortletKeys.DOCUMENT_LIBRARY, "order-by-col", orderByCol);
		portalPreferences.setValue(PortletKeys.DOCUMENT_LIBRARY, "order-by-type", orderByType);
	}
}

OrderByComparator orderByComparator = DLUtil.getRepositoryModelOrderByComparator(orderByCol, orderByType);

searchContainer.setOrderableHeaders(orderableHeaders);
searchContainer.setOrderByCol(orderByCol);
searchContainer.setOrderByComparator(orderByComparator);
searchContainer.setOrderByJS("javascript:" + liferayPortletResponse.getNamespace() + "sortEntries('" + folderId + "', 'orderKey', 'orderByType');");
searchContainer.setOrderByType(orderByType);

int folderStart = ParamUtil.getInteger(request, "folderStart");
int folderEnd = ParamUtil.getInteger(request, "folderEnd", SearchContainer.DEFAULT_DELTA);

List results = null;
int total = 0;

if (fileEntryTypeId >= 0) {
	Indexer indexer = IndexerRegistryUtil.getIndexer(DLFileEntryConstants.getClassName());

	if (fileEntryTypeId > 0) {
		DLFileEntryType dlFileEntryType = DLFileEntryTypeLocalServiceUtil.getFileEntryType(fileEntryTypeId);

		dlFileEntryTypeName = dlFileEntryType.getName();
	}

	SearchContext searchContext = SearchContextFactory.getInstance(request);

	searchContext.setAttribute("paginationType", "none");
	searchContext.setEnd(entryEnd);
	searchContext.setStart(entryStart);

	Hits hits = indexer.search(searchContext);

	total = hits.getLength();

	searchContainer.setTotal(total);

	if (total <= entryStart) {
		entryStart = (searchContainer.getCur() - 1) * searchContainer.getDelta();
		entryEnd = entryStart + searchContainer.getDelta();

		searchContext.setEnd(entryEnd);
		searchContext.setStart(entryStart);

		hits = indexer.search(searchContext);
	}

	results = new ArrayList();

	for (int i = 0; i < hits.getDocs().length; i++) {
		Document doc = hits.doc(i);

		long fileEntryId = GetterUtil.getLong(doc.get(Field.ENTRY_CLASS_PK));

		FileEntry fileEntry = null;

		try {
			fileEntry = DLAppLocalServiceUtil.getFileEntry(fileEntryId);
		}
		catch (Exception e) {
			if (_log.isWarnEnabled()) {
				_log.warn("Document library search index is stale and contains file entry {" + fileEntryId + "}");
			}

			continue;
		}

		results.add(fileEntry);
	}
}
else {
	if (navigation.equals("home")) {
		if (useAssetEntryQuery) {
			long[] classNameIds = {PortalUtil.getClassNameId(DLFileEntryConstants.getClassName()), PortalUtil.getClassNameId(DLFileShortcut.class.getName())};

			AssetEntryQuery assetEntryQuery = new AssetEntryQuery(classNameIds, searchContainer);

			assetEntryQuery.setEnd(entryEnd);
			assetEntryQuery.setExcludeZeroViewCount(false);
			assetEntryQuery.setStart(entryStart);

			total = AssetEntryServiceUtil.getEntriesCount(assetEntryQuery);

			searchContainer.setTotal(total);

			if (total <= entryStart) {
				entryStart = (searchContainer.getCur() - 1) * searchContainer.getDelta();
				entryEnd = entryStart + searchContainer.getDelta();

				assetEntryQuery.setEnd(entryEnd);
				assetEntryQuery.setStart(entryStart);
			}

			results = AssetEntryServiceUtil.getEntries(assetEntryQuery);
		}
		else {
			total = DLAppServiceUtil.getFoldersAndFileEntriesAndFileShortcutsCount(repositoryId, folderId, status, false);

			searchContainer.setTotal(total);

			if (total <= entryStart) {
				entryStart = (searchContainer.getCur() - 1) * searchContainer.getDelta();
				entryEnd = entryStart + searchContainer.getDelta();
			}

			results = DLAppServiceUtil.getFoldersAndFileEntriesAndFileShortcuts(repositoryId, folderId, status, false, entryStart, entryEnd, searchContainer.getOrderByComparator());
		}
	}
	else if (navigation.equals("mine") || navigation.equals("recent")) {
		long groupFileEntriesUserId = 0;

		if (navigation.equals("mine") && themeDisplay.isSignedIn()) {
			groupFileEntriesUserId = user.getUserId();
		}

		total = DLAppServiceUtil.getGroupFileEntriesCount(repositoryId, groupFileEntriesUserId, folderId);

		searchContainer.setTotal(total);

		if (total <= entryStart) {
			entryStart = (searchContainer.getCur() - 1) * searchContainer.getDelta();
			entryEnd = entryStart + searchContainer.getDelta();
		}

		results = DLAppServiceUtil.getGroupFileEntries(repositoryId, groupFileEntriesUserId, folderId, null, status, entryStart, entryEnd, null);
	}
}

searchContainer.setResults(results);

request.setAttribute("view_entries.jsp-total", String.valueOf(total));

request.setAttribute("view_entries.jsp-entryStart", String.valueOf(entryStart));
request.setAttribute("view_entries.jsp-entryEnd", String.valueOf(entryEnd));
%>

<c:if test="<%= results.isEmpty() %>">
	<div class="portlet-msg-info">
		<c:choose>
			<c:when test="<%= (fileEntryTypeId >= 0) %>">
				<c:choose>
					<c:when test="<%= total == 0 %>">
						<liferay-ui:message arguments="<%= HtmlUtil.escape(dlFileEntryTypeName) %>" key="there-are-no-documents-or-media-files-of-type-x" />
					</c:when>
					<c:otherwise>
						<liferay-ui:message arguments="<%= HtmlUtil.escape(dlFileEntryTypeName) %>" key="there-are-no-documents-or-media-files-of-type-x-on-this-page" />
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="<%= total == 0 %>">
						<liferay-ui:message key="there-are-no-documents-or-media-files-in-this-folder" />
					</c:when>
					<c:otherwise>
						<liferay-ui:message key="there-are-no-documents-or-media-files-on-this-page" />
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</div>
</c:if>

<%
boolean showSyncMessage = GetterUtil.getBoolean(SessionClicks.get(request, liferayPortletResponse.getNamespace() + "show-sync-message", "true"));

String cssClass = StringPool.BLANK;

if (results.isEmpty() || !showSyncMessage || !PropsValues.DL_SHOW_LIFERAY_SYNC_MESSAGE) {
	cssClass = "aui-helper-hidden";
}
%>

<div class="<%= cssClass %>" id="<portlet:namespace />syncNotification">
	<div class="lfr-message-info sync-notification" id="<portlet:namespace />syncNotificationContent">
		<a href="http://www.liferay.com/products/liferay-sync" target="_blank">
			<liferay-ui:message key="access-these-files-offline-using-liferay-sync" />
		</a>
	</div>
</div>

<%
for (int i = 0; i < results.size(); i++) {
	Object result = results.get(i);
%>

	<%@ include file="/html/portlet/document_library/cast_result.jspf" %>

	<c:choose>
		<c:when test="<%= fileEntry != null %>">
			<c:choose>
				<c:when test='<%= !displayStyle.equals("list") %>'>
					<c:choose>
						<c:when test="<%= DLFileEntryPermission.contains(permissionChecker, fileEntry, ActionKeys.VIEW) %>">

							<%
							PortletURL tempRowURL = liferayPortletResponse.createRenderURL();

							tempRowURL.setParameter("struts_action", "/document_library/view_file_entry");
							tempRowURL.setParameter("redirect", currentURL);
							tempRowURL.setParameter("fileEntryId", String.valueOf(fileEntry.getFileEntryId()));

							request.setAttribute("view_entries.jsp-fileEntry", fileEntry);
							request.setAttribute("view_entries.jsp-fileShortcut", fileShortcut);

							request.setAttribute("view_entries.jsp-tempRowURL", tempRowURL);
							%>

							<c:choose>
								<c:when test='<%= displayStyle.equals("icon") %>'>
									<liferay-util:include page="/html/portlet/document_library/view_file_entry_icon.jsp" />
								</c:when>
								<c:otherwise>
									<liferay-util:include page="/html/portlet/document_library/view_file_entry_descriptive.jsp" />
								</c:otherwise>
							</c:choose>
						</c:when>

						<c:otherwise>
							<div style="float: left; margin: 100px 10px 0px;">
								<img alt="<liferay-ui:message key="image" />" border="no" src="<%= themeDisplay.getPathThemeImages() %>/application/forbidden_action.png" />
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>

				<c:otherwise>
					<liferay-util:buffer var="fileEntryTitle">

						<%
						Map<String, Object> data = new HashMap<String, Object>();

						data.put("file-entry-id", fileEntry.getFileEntryId());

						PortletURL rowURL = liferayPortletResponse.createRenderURL();

						rowURL.setParameter("struts_action", "/document_library/view_file_entry");
						rowURL.setParameter("redirect", currentURL);
						rowURL.setParameter("fileEntryId", String.valueOf(fileEntry.getFileEntryId()));
						%>

						<liferay-ui:icon
							cssClass="document-display-style selectable"
							data="<%= data %>"
							image='<%= "../file_system/small/" + DLUtil.getFileIcon(fileEntry.getExtension()) %>'
							label="<%= true %>"
							localizeMessage="<%= false %>"
							message="<%= fileEntry.getTitle() %>"
							method="get"
							url="<%= rowURL.toString() %>"
						/>

						<%
						FileVersion latestFileVersion = fileEntry.getFileVersion();

						if ((user.getUserId() == fileEntry.getUserId()) || permissionChecker.isCompanyAdmin() || permissionChecker.isGroupAdmin(scopeGroupId) || DLFileEntryPermission.contains(permissionChecker, fileEntry, ActionKeys.UPDATE)) {
							latestFileVersion = fileEntry.getLatestFileVersion();
						}
						%>

						<c:if test="<%= latestFileVersion.isDraft() || latestFileVersion.isPending() %>">

							<%
							String statusLabel = WorkflowConstants.toLabel(latestFileVersion.getStatus());
							%>

							<span class="workflow-status-<%= statusLabel %>">
								(<liferay-ui:message key="<%= statusLabel %>" />)
							</span>
						</c:if>

						<c:if test="<%= fileEntry.isCheckedOut() %>">
							<liferay-ui:icon
								cssClass="document-display-style locked-icon"
								image="lock"
							/>
						</c:if>
					</liferay-util:buffer>

					<%
					List resultRows = searchContainer.getResultRows();

					ResultRow row = null;

					if (fileShortcut == null) {
						row = new ResultRow(fileEntry, fileEntry.getFileEntryId(), i);
					}
					else {
						row = new ResultRow(fileShortcut, fileShortcut.getFileShortcutId(), i);
					}

					row.setClassName("document-display-style");

					Map<String, Object> data = new HashMap<String, Object>();

					data.put("draggable", DLFileEntryPermission.contains(permissionChecker, fileEntry, ActionKeys.DELETE) || DLFileEntryPermission.contains(permissionChecker, fileEntry, ActionKeys.UPDATE));
					data.put("title", fileEntry.getTitle());

					row.setData(data);

					for (String columnName : entryColumns) {
						if (columnName.equals("action")) {
							row.addJSP("/html/portlet/document_library/file_entry_action.jsp");
						}

						if (columnName.equals("create-date")) {
							row.addText(dateFormatDateTime.format(fileEntry.getCreateDate()));
						}

						if (columnName.equals("downloads")) {
							row.addText(String.valueOf(fileEntry.getReadCount()));
						}

						if (columnName.equals("modified-date")) {
							row.addText(dateFormatDateTime.format(fileEntry.getModifiedDate()));
						}

						if (columnName.equals("name")) {
							TextSearchEntry folderTitleSearchEntry = new TextSearchEntry();

							folderTitleSearchEntry.setName(fileEntryTitle);

							row.addSearchEntry(folderTitleSearchEntry);
						}

						if (columnName.equals("size")) {
							row.addText(TextFormatter.formatKB(fileEntry.getSize(), locale) + "k");
						}
					}

					resultRows.add(row);
					%>

				</c:otherwise>
			</c:choose>
		</c:when>

		<c:when test="<%= curFolder != null %>">

			<%
			int foldersCount = DLAppServiceUtil.getFoldersCount(curFolder.getRepositoryId(), curFolder.getFolderId());
			int fileEntriesCount = DLAppServiceUtil.getFileEntriesAndFileShortcutsCount(curFolder.getRepositoryId(), curFolder.getFolderId(), status);

			String folderImage = "folder_empty";

			if ((foldersCount + fileEntriesCount) > 0) {
				folderImage = "folder_full_document";
			}
			%>

			<c:choose>
				<c:when test='<%= !displayStyle.equals("list") %>'>

					<%
					PortletURL tempRowURL = liferayPortletResponse.createRenderURL();

					tempRowURL.setParameter("struts_action", "/document_library/view");
					tempRowURL.setParameter("redirect", currentURL);
					tempRowURL.setParameter("folderId", String.valueOf(curFolder.getFolderId()));

					request.setAttribute("view_entries.jsp-folder", curFolder);
					request.setAttribute("view_entries.jsp-folderId", String.valueOf(curFolder.getFolderId()));
					request.setAttribute("view_entries.jsp-repositoryId", String.valueOf(curFolder.getRepositoryId()));

					request.setAttribute("view_entries.jsp-folderImage", folderImage);

					request.setAttribute("view_entries.jsp-tempRowURL", tempRowURL);
					%>

					<c:choose>
						<c:when test='<%= displayStyle.equals("icon") %>'>
							<liferay-util:include page="/html/portlet/document_library/view_folder_icon.jsp" />
						</c:when>

						<c:otherwise>
							<liferay-util:include page="/html/portlet/document_library/view_folder_descriptive.jsp" />
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<liferay-util:buffer var="folderTitle">

						<%
						Map<String, Object> data = new HashMap<String, Object>();

						data.put("folder", true);
						data.put("folder-id", curFolder.getFolderId());

						PortletURL rowURL = liferayPortletResponse.createRenderURL();

						rowURL.setParameter("struts_action", "/document_library/view");
						rowURL.setParameter("redirect", currentURL);
						rowURL.setParameter("folderId", String.valueOf(curFolder.getFolderId()));
						%>

						<liferay-ui:icon
							data="<%= data %>"
							image="<%= folderImage %>"
							label="<%= true %>"
							localizeMessage="<%= false %>"
							message="<%= curFolder.getName() %>"
							method="get"
							url="<%= rowURL.toString() %>"
						/>
					</liferay-util:buffer>

					<%
					List resultRows = searchContainer.getResultRows();

					ResultRow row = new ResultRow(curFolder, curFolder.getPrimaryKey(), i);

					row.setClassName("document-display-style");

					Map<String, Object> data = new HashMap<String, Object>();

					data.put("draggable", DLFolderPermission.contains(permissionChecker, curFolder, ActionKeys.DELETE) || DLFolderPermission.contains(permissionChecker, curFolder, ActionKeys.UPDATE));
					data.put("folder", true);
					data.put("folder-id", curFolder.getFolderId());
					data.put("title", curFolder.getName());

					row.setData(data);

					for (String columnName : entryColumns) {
						if (columnName.equals("action")) {
							row.addJSP("/html/portlet/document_library/folder_action.jsp");
						}

						if (columnName.equals("create-date")) {
							row.addText(dateFormatDateTime.format(curFolder.getCreateDate()));
						}

						if (columnName.equals("downloads")) {
							row.addText("--");
						}

						if (columnName.equals("modified-date")) {
							row.addText(dateFormatDateTime.format(curFolder.getModifiedDate()));
						}

						if (columnName.equals("name")) {
							TextSearchEntry folderTitleSearchEntry = new TextSearchEntry();

							folderTitleSearchEntry.setName(folderTitle);

							row.addSearchEntry(folderTitleSearchEntry);
						}

						if (columnName.equals("size")) {
							row.addText("--");
						}
					}

					resultRows.add(row);
					%>

				</c:otherwise>
			</c:choose>
		</c:when>
	</c:choose>

<%
}
%>

<c:if test='<%= displayStyle.equals("list") %>'>
	<liferay-ui:search-iterator paginate="<%= false %>" searchContainer="<%= searchContainer %>" />
</c:if>

<aui:script>
	Liferay.fire(
		'<portlet:namespace />pageLoaded',
		{
			paginator: {
				name: 'entryPaginator',
				state: {
					page: <%= (total == 0) ? 0 : searchContainer.getCur() %>,
					rowsPerPage: <%= searchContainer.getDelta() %>,
					total: <%= total %>
				}
			}
		}
	);
</aui:script>

<%!
private static Log _log = LogFactoryUtil.getLog("portal-web.docroot.html.portlet.document_library.view_entries_jsp");
%>