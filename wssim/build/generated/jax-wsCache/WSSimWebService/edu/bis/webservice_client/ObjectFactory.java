
package edu.bis.webservice_client;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the edu.bis.webservice_client package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _GetSubstitutableOperationsResponse_QNAME = new QName("http://webservice.bis.edu/", "getSubstitutableOperationsResponse");
    private final static QName _GetOperationPairInfoResponse_QNAME = new QName("http://webservice.bis.edu/", "GetOperationPairInfoResponse");
    private final static QName _GetServiceSimilarityResponse_QNAME = new QName("http://webservice.bis.edu/", "getServiceSimilarityResponse");
    private final static QName _GetServiceSimilarity_QNAME = new QName("http://webservice.bis.edu/", "getServiceSimilarity");
    private final static QName _GetSubstitutableOperations_QNAME = new QName("http://webservice.bis.edu/", "getSubstitutableOperations");
    private final static QName _GetOperationPairInfo_QNAME = new QName("http://webservice.bis.edu/", "GetOperationPairInfo");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: edu.bis.webservice_client
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link GetSubstitutableOperationsResponse }
     * 
     */
    public GetSubstitutableOperationsResponse createGetSubstitutableOperationsResponse() {
        return new GetSubstitutableOperationsResponse();
    }

    /**
     * Create an instance of {@link GetServiceSimilarityResponse }
     * 
     */
    public GetServiceSimilarityResponse createGetServiceSimilarityResponse() {
        return new GetServiceSimilarityResponse();
    }

    /**
     * Create an instance of {@link GetOperationPairInfoResponse }
     * 
     */
    public GetOperationPairInfoResponse createGetOperationPairInfoResponse() {
        return new GetOperationPairInfoResponse();
    }

    /**
     * Create an instance of {@link GetSubstitutableOperations }
     * 
     */
    public GetSubstitutableOperations createGetSubstitutableOperations() {
        return new GetSubstitutableOperations();
    }

    /**
     * Create an instance of {@link GetServiceSimilarity }
     * 
     */
    public GetServiceSimilarity createGetServiceSimilarity() {
        return new GetServiceSimilarity();
    }

    /**
     * Create an instance of {@link GetOperationPairInfo }
     * 
     */
    public GetOperationPairInfo createGetOperationPairInfo() {
        return new GetOperationPairInfo();
    }

    /**
     * Create an instance of {@link OperationPairSimilarity }
     * 
     */
    public OperationPairSimilarity createOperationPairSimilarity() {
        return new OperationPairSimilarity();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetSubstitutableOperationsResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.bis.edu/", name = "getSubstitutableOperationsResponse")
    public JAXBElement<GetSubstitutableOperationsResponse> createGetSubstitutableOperationsResponse(GetSubstitutableOperationsResponse value) {
        return new JAXBElement<GetSubstitutableOperationsResponse>(_GetSubstitutableOperationsResponse_QNAME, GetSubstitutableOperationsResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetOperationPairInfoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.bis.edu/", name = "GetOperationPairInfoResponse")
    public JAXBElement<GetOperationPairInfoResponse> createGetOperationPairInfoResponse(GetOperationPairInfoResponse value) {
        return new JAXBElement<GetOperationPairInfoResponse>(_GetOperationPairInfoResponse_QNAME, GetOperationPairInfoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetServiceSimilarityResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.bis.edu/", name = "getServiceSimilarityResponse")
    public JAXBElement<GetServiceSimilarityResponse> createGetServiceSimilarityResponse(GetServiceSimilarityResponse value) {
        return new JAXBElement<GetServiceSimilarityResponse>(_GetServiceSimilarityResponse_QNAME, GetServiceSimilarityResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetServiceSimilarity }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.bis.edu/", name = "getServiceSimilarity")
    public JAXBElement<GetServiceSimilarity> createGetServiceSimilarity(GetServiceSimilarity value) {
        return new JAXBElement<GetServiceSimilarity>(_GetServiceSimilarity_QNAME, GetServiceSimilarity.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetSubstitutableOperations }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.bis.edu/", name = "getSubstitutableOperations")
    public JAXBElement<GetSubstitutableOperations> createGetSubstitutableOperations(GetSubstitutableOperations value) {
        return new JAXBElement<GetSubstitutableOperations>(_GetSubstitutableOperations_QNAME, GetSubstitutableOperations.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetOperationPairInfo }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://webservice.bis.edu/", name = "GetOperationPairInfo")
    public JAXBElement<GetOperationPairInfo> createGetOperationPairInfo(GetOperationPairInfo value) {
        return new JAXBElement<GetOperationPairInfo>(_GetOperationPairInfo_QNAME, GetOperationPairInfo.class, null, value);
    }

}
