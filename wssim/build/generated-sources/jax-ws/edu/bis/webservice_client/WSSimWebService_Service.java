
package edu.bis.webservice_client;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.6-1b01 
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "WSSimWebService", targetNamespace = "http://webservice.bis.edu/", wsdlLocation = "http://localhost:8084/WSSIMWebApp/WSSimWebService?wsdl")
public class WSSimWebService_Service
    extends Service
{

    private final static URL WSSIMWEBSERVICE_WSDL_LOCATION;
    private final static WebServiceException WSSIMWEBSERVICE_EXCEPTION;
    private final static QName WSSIMWEBSERVICE_QNAME = new QName("http://webservice.bis.edu/", "WSSimWebService");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:8084/WSSIMWebApp/WSSimWebService?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        WSSIMWEBSERVICE_WSDL_LOCATION = url;
        WSSIMWEBSERVICE_EXCEPTION = e;
    }

    public WSSimWebService_Service() {
        super(__getWsdlLocation(), WSSIMWEBSERVICE_QNAME);
    }

    public WSSimWebService_Service(WebServiceFeature... features) {
        super(__getWsdlLocation(), WSSIMWEBSERVICE_QNAME, features);
    }

    public WSSimWebService_Service(URL wsdlLocation) {
        super(wsdlLocation, WSSIMWEBSERVICE_QNAME);
    }

    public WSSimWebService_Service(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, WSSIMWEBSERVICE_QNAME, features);
    }

    public WSSimWebService_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public WSSimWebService_Service(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns WSSimWebService
     */
    @WebEndpoint(name = "WSSimWebServicePort")
    public WSSimWebService getWSSimWebServicePort() {
        return super.getPort(new QName("http://webservice.bis.edu/", "WSSimWebServicePort"), WSSimWebService.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns WSSimWebService
     */
    @WebEndpoint(name = "WSSimWebServicePort")
    public WSSimWebService getWSSimWebServicePort(WebServiceFeature... features) {
        return super.getPort(new QName("http://webservice.bis.edu/", "WSSimWebServicePort"), WSSimWebService.class, features);
    }

    private static URL __getWsdlLocation() {
        if (WSSIMWEBSERVICE_EXCEPTION!= null) {
            throw WSSIMWEBSERVICE_EXCEPTION;
        }
        return WSSIMWEBSERVICE_WSDL_LOCATION;
    }

}
