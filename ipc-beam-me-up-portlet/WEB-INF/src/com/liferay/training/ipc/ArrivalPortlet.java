package com.liferay.training.ipc;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;

import java.io.IOException;

import javax.portlet.Event;
import javax.portlet.EventRequest;
import javax.portlet.EventResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.ProcessEvent;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.xml.namespace.QName;

/**
 * Portlet implementation class ArrivalPortlet
 */
public class ArrivalPortlet extends GenericPortlet {

    public void init() {
        viewJSP = getInitParameter("view-template");
    }
    
    public void doView(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {
        
        include(viewJSP, renderRequest, renderResponse);
    }

    protected void include(
            String path, RenderRequest renderRequest,
            RenderResponse renderResponse)
        throws IOException, PortletException {

        PortletRequestDispatcher portletRequestDispatcher =
            getPortletContext().getRequestDispatcher(path);

        if (portletRequestDispatcher == null) {
            _log.error(path + " is not a valid include");
        }
        else {
            portletRequestDispatcher.include(renderRequest, renderResponse);
        }
    }
    
    @ProcessEvent(qname="{http://liferay.com/events}ipc.beammeup")
    public void arrivalDestination(EventRequest request, EventResponse response) {
    	Event event = request.getEvent();
    	String beammeup = (String)event.getValue();
    	response.setRenderParameter("beammeup", beammeup);
    	
		QName qName = new QName("http://liferay.com/events", "ipc.ijustgotbeamed");
		response.setEvent(qName, "I just got Beamed !");
		
		System.out.println("Got Beamed !");
    }
 
    protected String viewJSP;

    private static Log _log = LogFactoryUtil.getLog(ArrivalPortlet.class);

}
