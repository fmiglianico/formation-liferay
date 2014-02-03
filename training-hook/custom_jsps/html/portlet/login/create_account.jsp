
<%@ include file="/html/portlet/login/init.jsp"%>

<liferay-util:buffer var="html">
	<liferay-util:include
		page="/html/portlet/login/create_account.portal.jsp" />
</liferay-util:buffer>

<liferay-util:buffer var="customHtml">
	<liferay-ui:custom-attribute className="<%= User.class.getName() %>"
		classPK="<%= 0 %>" editable="<%= true %>" label="<%= true %>"
		name="interested-in-becoming-an-astronaut" />
</liferay-util:buffer>

<%
	int x = html.lastIndexOf("<script type=\"text/javascript\"");
	int y;
	if (x != -1) {
		y = html.indexOf("</script>", x);

		html = html.substring(0, x) + html.substring(y + 9);
	}

	html = html.replace(LanguageUtil.get(pageContext, "save"),
			LanguageUtil.get(pageContext, "create"));

	x = html.indexOf(LanguageUtil.get(pageContext, "last-name"));

	if (x != -1) {
		y = html.indexOf("</div>", x);

		html = html.substring(0, y) + customHtml + html.substring(y);
	}
%>

<%=html%>
