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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.liferay.portal.kernel.language.LanguageUtil" %>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil" %>
<%@ page import="com.liferay.portal.kernel.util.LocaleUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>

<%@ page import="java.util.Locale" %>

<%
String contentsLanguageId = ParamUtil.getString(request, "contentsLanguageId");
String cssClasses = ParamUtil.getString(request, "cssClasses");
String languageId = ParamUtil.getString(request, "languageId");
long wikiPageResourcePrimKey = ParamUtil.getLong(request, "wikiPageResourcePrimKey");
String attachmentURLPrefix = ParamUtil.getString(request, "attachmentURLPrefix");
boolean resizable = ParamUtil.getBoolean(request, "resizable");

String linkButtonBar = "['Link', 'Unlink']";

if (wikiPageResourcePrimKey > 0) {
	linkButtonBar = "['Link', 'Unlink', 'Image']";
}
%>

CKEDITOR.config.attachmentURLPrefix = '<%= HtmlUtil.escapeJS(attachmentURLPrefix) %>';

CKEDITOR.config.bodyClass = 'html-editor <%= HtmlUtil.escapeJS(cssClasses) %>';

<%
Locale contentsLocale = LocaleUtil.fromLanguageId(contentsLanguageId);

String contentsLanguageDir = LanguageUtil.get(contentsLocale, "lang.dir");
%>

CKEDITOR.config.contentsLangDirection = '<%= HtmlUtil.escapeJS(contentsLanguageDir) %>';

CKEDITOR.config.contentsLanguage = '<%= HtmlUtil.escapeJS(contentsLanguageId.replace("iw_", "he_")) %>';

CKEDITOR.config.decodeLinks = true;

CKEDITOR.config.disableObjectResizing = true;

CKEDITOR.config.extraPlugins = 'creole,wikilink';

CKEDITOR.config.format_tags = 'p;h1;h2;h3;h4;h5;h6;pre';

CKEDITOR.config.height = 265;

CKEDITOR.config.language = '<%= HtmlUtil.escapeJS(languageId.replace("iw_", "he_")) %>';

CKEDITOR.config.removePlugins = [
	'elementspath',
	'save',
	'font',
	'bidi',
	'colordialog',
	'colorbutton',
	'div',
	'flash',
	'font',
	'forms',
	'indent',
	'justify',
	'keystrokes',
	'link',
	'menu',
	'maximize',
	'newpage',
	'pagebreak',
	'preview',
	'print',
	'save',
	'scayt',
	'smiley',
	'showblocks',
	'stylescombo',
	'templates',
	'wsc'
].join();

<c:if test="<%= resizable %>">
	CKEDITOR.config.resize_dir = 'vertical';
</c:if>

CKEDITOR.config.resize_enabled = <%= resizable %>;

CKEDITOR.config.toolbar_creole = [
	['Cut','Copy','Paste','PasteText','PasteFromWord'],
	['Undo','Redo'],
	['Bold', 'Italic', '-', 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent' ],
	['Format'],
	<%= linkButtonBar %>,
	['Table', '-', 'HorizontalRule', 'SpecialChar' ],
	['Find','Replace','-','SelectAll','RemoveFormat'],
	['Source']
];

CKEDITOR.on(
	'dialogDefinition',
	function(event) {
		var dialogName = event.data.name;

		var dialogDefinition = event.data.definition;

		var infoTab;

		if (dialogName === 'cellProperties') {
			infoTab = dialogDefinition.getContents('info');

			infoTab.remove('bgColor');
			infoTab.remove('bgColorChoose');
			infoTab.remove('borderColor');
			infoTab.remove('borderColorChoose');
			infoTab.remove('colSpan');
			infoTab.remove('hAlign');
			infoTab.remove('height');
			infoTab.remove('htmlHeightType');
			infoTab.remove('rowSpan');
			infoTab.remove('vAlign');
			infoTab.remove('width');
			infoTab.remove('widthType');
			infoTab.remove('wordWrap');

			dialogDefinition.minHeight = 40;
			dialogDefinition.minWidth = 210;
		}
		else if (dialogName === 'table' || dialogName === 'tableProperties') {
			infoTab = dialogDefinition.getContents('info');

			infoTab.remove('cmbAlign');
			infoTab.remove('cmbWidthType');
			infoTab.remove('cmbWidthType');
			infoTab.remove('htmlHeightType');
			infoTab.remove('txtBorder');
			infoTab.remove('txtCellPad');
			infoTab.remove('txtCellSpace');
			infoTab.remove('txtHeight');
			infoTab.remove('txtSummary');
			infoTab.remove('txtWidth');

			dialogDefinition.minHeight = 180;
			dialogDefinition.minWidth = 210;
		}
	}
);