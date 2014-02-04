<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="sampleManufacturerServiceSoapProxyid" scope="session" class="com.liferay.training.parts.service.http.ManufacturerServiceSoapProxy" />
<%
if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
sampleManufacturerServiceSoapProxyid.setEndpoint(request.getParameter("endpoint"));
%>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        java.lang.String getEndpoint2mtemp = sampleManufacturerServiceSoapProxyid.getEndpoint();
if(getEndpoint2mtemp == null){
%>
<%=getEndpoint2mtemp %>
<%
}else{
        String tempResultreturnp3 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getEndpoint2mtemp));
        %>
        <%= tempResultreturnp3 %>
        <%
}
break;
case 5:
        gotMethod = true;
        String endpoint_0id=  request.getParameter("endpoint8");
            java.lang.String endpoint_0idTemp = null;
        if(!endpoint_0id.equals("")){
         endpoint_0idTemp  = endpoint_0id;
        }
        sampleManufacturerServiceSoapProxyid.setEndpoint(endpoint_0idTemp);
break;
case 10:
        gotMethod = true;
        com.liferay.training.parts.service.http.ManufacturerServiceSoap getManufacturerServiceSoap10mtemp = sampleManufacturerServiceSoapProxyid.getManufacturerServiceSoap();
if(getManufacturerServiceSoap10mtemp == null){
%>
<%=getManufacturerServiceSoap10mtemp %>
<%
}else{
        if(getManufacturerServiceSoap10mtemp!= null){
        String tempreturnp11 = getManufacturerServiceSoap10mtemp.toString();
        %>
        <%=tempreturnp11%>
        <%
        }}
break;
case 13:
        gotMethod = true;
        String companyId_1id=  request.getParameter("companyId16");
        long companyId_1idTemp  = Long.parseLong(companyId_1id);
        String groupId_2id=  request.getParameter("groupId18");
        long groupId_2idTemp  = Long.parseLong(groupId_2id);
        String userId_3id=  request.getParameter("userId20");
        long userId_3idTemp  = Long.parseLong(userId_3id);
        String name_4id=  request.getParameter("name22");
            java.lang.String name_4idTemp = null;
        if(!name_4id.equals("")){
         name_4idTemp  = name_4id;
        }
        String emailAddress_5id=  request.getParameter("emailAddress24");
            java.lang.String emailAddress_5idTemp = null;
        if(!emailAddress_5id.equals("")){
         emailAddress_5idTemp  = emailAddress_5id;
        }
        String phoneNumber_6id=  request.getParameter("phoneNumber26");
            java.lang.String phoneNumber_6idTemp = null;
        if(!phoneNumber_6id.equals("")){
         phoneNumber_6idTemp  = phoneNumber_6id;
        }
        String website_7id=  request.getParameter("website28");
            java.lang.String website_7idTemp = null;
        if(!website_7id.equals("")){
         website_7idTemp  = website_7id;
        }
        sampleManufacturerServiceSoapProxyid.addManufacturer(companyId_1idTemp,groupId_2idTemp,userId_3idTemp,name_4idTemp,emailAddress_5idTemp,phoneNumber_6idTemp,website_7idTemp);
break;
case 30:
        gotMethod = true;
        String manufacturerId_8id=  request.getParameter("manufacturerId33");
        long manufacturerId_8idTemp  = Long.parseLong(manufacturerId_8id);
        sampleManufacturerServiceSoapProxyid.deleteManufacturer(manufacturerId_8idTemp);
break;
case 35:
        gotMethod = true;
        String manufacturerId_9id=  request.getParameter("manufacturerId56");
        long manufacturerId_9idTemp  = Long.parseLong(manufacturerId_9id);
        com.liferay.training.parts.model.ManufacturerSoap getManufacturer35mtemp = sampleManufacturerServiceSoapProxyid.getManufacturer(manufacturerId_9idTemp);
if(getManufacturer35mtemp == null){
%>
<%=getManufacturer35mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">website:</TD>
<TD>
<%
if(getManufacturer35mtemp != null){
java.lang.String typewebsite38 = getManufacturer35mtemp.getWebsite();
        String tempResultwebsite38 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typewebsite38));
        %>
        <%= tempResultwebsite38 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">name:</TD>
<TD>
<%
if(getManufacturer35mtemp != null){
java.lang.String typename40 = getManufacturer35mtemp.getName();
        String tempResultname40 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typename40));
        %>
        <%= tempResultname40 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">emailAddress:</TD>
<TD>
<%
if(getManufacturer35mtemp != null){
java.lang.String typeemailAddress42 = getManufacturer35mtemp.getEmailAddress();
        String tempResultemailAddress42 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeemailAddress42));
        %>
        <%= tempResultemailAddress42 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">groupId:</TD>
<TD>
<%
if(getManufacturer35mtemp != null){
%>
<%=getManufacturer35mtemp.getGroupId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">userId:</TD>
<TD>
<%
if(getManufacturer35mtemp != null){
%>
<%=getManufacturer35mtemp.getUserId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">primaryKey:</TD>
<TD>
<%
if(getManufacturer35mtemp != null){
%>
<%=getManufacturer35mtemp.getPrimaryKey()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">companyId:</TD>
<TD>
<%
if(getManufacturer35mtemp != null){
%>
<%=getManufacturer35mtemp.getCompanyId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">manufacturerId:</TD>
<TD>
<%
if(getManufacturer35mtemp != null){
%>
<%=getManufacturer35mtemp.getManufacturerId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">phoneNumber:</TD>
<TD>
<%
if(getManufacturer35mtemp != null){
java.lang.String typephoneNumber54 = getManufacturer35mtemp.getPhoneNumber();
        String tempResultphoneNumber54 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typephoneNumber54));
        %>
        <%= tempResultphoneNumber54 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 58:
        gotMethod = true;
        String groupId_10id=  request.getParameter("groupId61");
        long groupId_10idTemp  = Long.parseLong(groupId_10id);
        com.liferay.training.parts.model.ManufacturerSoap[] getManufacturersByGroupId58mtemp = sampleManufacturerServiceSoapProxyid.getManufacturersByGroupId(groupId_10idTemp);
if(getManufacturersByGroupId58mtemp == null){
%>
<%=getManufacturersByGroupId58mtemp %>
<%
}else{
        String tempreturnp59 = null;
        if(getManufacturersByGroupId58mtemp != null){
        java.util.List listreturnp59= java.util.Arrays.asList(getManufacturersByGroupId58mtemp);
        tempreturnp59 = listreturnp59.toString();
        }
        %>
        <%=tempreturnp59%>
        <%
}
break;
}
} catch (Exception e) { 
%>
Exception: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.toString()) %>
Message: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.getMessage()) %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>