<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<portlet:defineObjects />
<%
	String beammeup = (String) renderRequest.getParameter("beammeup");
%>
<p>And the destination is....</p>
<p>
	<%
		if (beammeup != null) {
	%>
	<%=beammeup%>!
	<%
		} else {
	%>
	... waiting for transporting.
	<%
		}
	%>