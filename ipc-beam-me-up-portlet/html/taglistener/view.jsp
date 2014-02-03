<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />
<%
	String tag = (String) renderRequest.getParameter("tag");
%>

This is the <b>Tag Listener Portlet</b> portlet in View mode.<br/><br/>
	
	<%
		if (tag != null) {
	%>
	<%= tag %>
	<%
		}
	%>
