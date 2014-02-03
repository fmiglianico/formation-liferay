<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<portlet:defineObjects />
<%
	String ijustgotbeamed = (String) renderRequest.getParameter("ijustgotbeamed");
%>
<p>Click the link below to do a space travel!</p>
<a href="<portlet:actionURL name="beamMe"></portlet:actionURL>">Beam
	me!</a><br/><br/>
	
	<%
		if (ijustgotbeamed != null) {
	%>
	<%= ijustgotbeamed %>!
	<%
		}
	%>