package com.liferay.training.ipc;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;

import java.io.IOException;
import java.util.Random;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Event;
import javax.portlet.EventRequest;
import javax.portlet.EventResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.ProcessAction;
import javax.portlet.ProcessEvent;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.xml.namespace.QName;

/**
 * Portlet implementation class BeamMeUpPortlet
 */
public class BeamMeUpPortlet extends GenericPortlet {

	public void init() {
		viewJSP = getInitParameter("view-template");
	}

	public void doView(RenderRequest renderRequest,
			RenderResponse renderResponse) throws IOException, PortletException {

		include(viewJSP, renderRequest, renderResponse);
	}

	protected void include(String path, RenderRequest renderRequest,
			RenderResponse renderResponse) throws IOException, PortletException {

		PortletRequestDispatcher portletRequestDispatcher = getPortletContext()
				.getRequestDispatcher(path);

		if (portletRequestDispatcher == null) {
			_log.error(path + " is not a valid include");
		} else {
			portletRequestDispatcher.include(renderRequest, renderResponse);
		}
	}

	@ProcessAction(name = "beamMe")
	public void beamMe(ActionRequest request, ActionResponse response) {
		String destinationType = null;
		// Send an Event that the ball has been pitched.
		Random random = new Random(System.currentTimeMillis());
		int transport = random.nextInt(3) + 1;
		switch (transport) {
		case 1:
			destinationType = "Landing on the planet xyz";
			break;
		case 2:
			destinationType = "Landing on the moon";
			break;
		case 3:
			destinationType = "Landing on the earth";
			break;
		// should never print
		default:
			destinationType = "Landing on the spaceship";
		}
		QName qName = new QName("http://liferay.com/events", "ipc.beammeup");
		response.setEvent(qName, destinationType);
	}
    
    @ProcessEvent(qname="{http://liferay.com/events}ipc.ijustgotbeamed")
    public void arrivalDestination(EventRequest request, EventResponse response) {
    	Event event = request.getEvent();
    	String ijustgotbeamed = (String)event.getValue();
    	response.setRenderParameter("ijustgotbeamed", ijustgotbeamed);
    }

	protected String viewJSP;

	private static Log _log = LogFactoryUtil.getLog(BeamMeUpPortlet.class);

}
