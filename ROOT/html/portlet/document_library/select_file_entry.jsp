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
Folder folder = (Folder)request.getAttribute(WebKeys.DOCUMENT_LIBRARY_FOLDER);

long folderId = BeanParamUtil.getLong(folder, request, "folderId", DLFolderConstants.DEFAULT_PARENT_FOLDER_ID);

long groupId = BeanParamUtil.getLong(folder, request, "groupId");

if (folder != null) {
	DLUtil.addPortletBreadcrumbEntries(folder, request, renderResponse);
}
%>

<aui:form method="post" name="fm">
	<liferay-ui:header
		title="home"
	/>

	<liferay-ui:breadcrumb showGuestGroup="<%= false %>" showLayout="<%= false %>" showParentGroups="<%= false %>" />

	<%
	PortletURL portletURL = renderResponse.createRenderURL();

	portletURL.setParameter("struts_action", "/document_library/select_file_entry");
	portletURL.setParameter("groupId", String.valueOf(groupId));
	portletURL.setParameter("folderId", String.valueOf(folderId));

	List<String> headerNames = new ArrayList<String>();

	headerNames.add("folder");
	headerNames.add("num-of-folders");
	headerNames.add("num-of-documents");

	SearchContainer searchContainer = new SearchContainer(renderRequest, null, null, SearchContainer.DEFAULT_CUR_PARAM, SearchContainer.DEFAULT_DELTA, portletURL, headerNames, null);

	int total = DLAppServiceUtil.getFoldersCount(groupId, folderId);

	searchContainer.setTotal(total);

	List results = DLAppServiceUtil.getFolders(groupId, folderId, searchContainer.getStart(), searchContainer.getEnd());

	searchContainer.setResults(results);

	List resultRows = searchContainer.getResultRows();

	for (int i = 0; i < results.size(); i++) {
		Folder curFolder = (Folder)results.get(i);

		curFolder = curFolder.toEscapedModel();

		ResultRow row = new ResultRow(curFolder, curFolder.getFolderId(), i);

		PortletURL rowURL = renderResponse.createRenderURL();

		rowURL.setParameter("struts_action", "/document_library/select_file_entry");
		rowURL.setParameter("groupId", String.valueOf(groupId));
		rowURL.setParameter("folderId", String.valueOf(curFolder.getFolderId()));

		// Name

		StringBundler sb = new StringBundler(4);

		sb.append("<img align=\"left\" border=\"0\" src=\"");
		sb.append(themeDisplay.getPathThemeImages());

		List<Long> subfolderIds = DLAppServiceUtil.getSubfolderIds(groupId, curFolder.getFolderId(), false);

		int foldersCount = subfolderIds.size();

		subfolderIds.clear();
		subfolderIds.add(curFolder.getFolderId());

		int fileEntriesCount = DLAppServiceUtil.getFoldersFileEntriesCount(groupId, subfolderIds, WorkflowConstants.STATUS_APPROVED);

		if ((foldersCount + fileEntriesCount) > 0) {
			sb.append("/common/folder_full_document.png\">");
		}
		else {
			sb.append("/common/folder_empty.png\">");
		}

		sb.append(curFolder.getName());

		row.addText(sb.toString(), rowURL);

		// Statistics

		row.addText(String.valueOf(foldersCount), rowURL);
		row.addText(String.valueOf(fileEntriesCount), rowURL);

		// Add result row

		resultRows.add(row);
	}
	%>

	<liferay-ui:search-iterator searchContainer="<%= searchContainer %>" />

	<c:if test="<%= !results.isEmpty() %>">
		<br />
	</c:if>

	<liferay-ui:header
		title="documents"
	/>

	<%
	headerNames.clear();

	headerNames.add("document");
	headerNames.add("size");

	if (PropsValues.DL_FILE_ENTRY_READ_COUNT_ENABLED) {
		headerNames.add("downloads");
	}

	headerNames.add("locked");

	searchContainer = new SearchContainer(renderRequest, null, null, "cur2", SearchContainer.DEFAULT_DELTA, portletURL, headerNames, null);

	total = DLAppServiceUtil.getFileEntriesCount(groupId, folderId);

	searchContainer.setTotal(total);

	results = DLAppServiceUtil.getFileEntries(groupId, folderId, searchContainer.getStart(), searchContainer.getEnd());

	searchContainer.setResults(results);

	resultRows = searchContainer.getResultRows();

	for (int i = 0; i < results.size(); i++) {
		FileEntry fileEntry = (FileEntry)results.get(i);

		fileEntry = fileEntry.toEscapedModel();

		ResultRow row = new ResultRow(fileEntry, fileEntry.getFileEntryId(), i);

		StringBundler sb = new StringBundler(9);

		sb.append("javascript:opener.");
		sb.append(renderResponse.getNamespace());
		sb.append("selectFileEntry('");
		sb.append(fileEntry.getFileEntryId());
		sb.append("', '");
		sb.append(UnicodeFormatter.toString(fileEntry.getTitle()));
		sb.append("'); window.close();");

		String rowHREF = sb.toString();

		// Title and description

		sb.setIndex(0);

		sb.append(DLUtil.getFileEntryImage(fileEntry, themeDisplay));
		sb.append(fileEntry.getTitle());

		if (Validator.isNotNull(fileEntry.getDescription())) {
			sb.append("<br />");
			sb.append(fileEntry.getDescription());
		}

		row.addText(sb.toString(), rowHREF);

		// Statistics

		row.addText(TextFormatter.formatKB(fileEntry.getSize(), locale) + "k", rowHREF);

		if (PropsValues.DL_FILE_ENTRY_READ_COUNT_ENABLED) {
			row.addText(String.valueOf(fileEntry.getReadCount()), rowHREF);
		}

		// Checked out

		row.addText(LanguageUtil.get(pageContext, fileEntry.isCheckedOut() ? "yes" : "no"), rowHREF);

		// Add result row

		resultRows.add(row);
	}
	%>

	<liferay-ui:search-iterator searchContainer="<%= searchContainer %>" />
</aui:form>