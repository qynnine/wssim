package edu.bis.wsmodel;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import javax.wsdl.Message;


public class OperationInfo {
   
   /**SOAP operation type*/
    private String operationType = "";
	
    /** The SOAP encoding style to use. */
	private String encodingStyle = "";
	
	/** The URL where the target object is located. */
	private String targetURL = "";
	
	/** The namespace URI used for this SOAP operation. */
	private String namespaceURI = "";

	/** The URI of the target object to invoke for this SOAP operation. */
	private String targetObjectURI = "";

	/** The name used to when making an invocation. */
	private String targetMethodName = "";

	/** The input message. */
	private String inputMessageText = "";

	/** The output message. */
	private String outputMessageText = "";
	
	/** The name of input message. */
	private String inputMessageName = "";
	
	/** The name of output message. */
	private String outputMessageName = "";
	
	/** The action URI value to use when making a invocation. */
	private String soapActionURI = "";

	/** The encoding type "document" vs. "rpc" */
	private String style = "document";

	/** parameters list Of the input Message, an element in the list corresponds to a ParameterInfo class */
	private List inparameters = new ArrayList ();
	
	/**parameters list Of the output Message, an element in the list corresponds to a ParameterInfo class */
	private List outparameters = new ArrayList ();
	
	/** parameters list Of the input Message (Include Complexe types), an element in the list corresponds to a ParameterInfo class */
	private List inparameters_complex = new ArrayList ();
	
	/**parameters list Of the output Message, an element in the list corresponds to a ParameterInfo class */
	private List outparameters_Complex = new ArrayList ();
	
	
	/** Operation corresponding to the input message */
	private Message inmessage;
	/** Operation corresponding to the output message */
	
	private Message outmessage;
	
	/** Service corresponding to Schemas */
	private Vector wsdltypes;
    
	/** Operation documentation */
	private String documentation;
	
	/** parent service Identifier */
	private String serviceid;

	/**
    * Constructor
    */
	public OperationInfo() {
		super();
	}
	
	/**
    * Constructor
    *
    * @param style Pass "document" or "rpc"
    */
	public OperationInfo(String style) {
		super();
		setStyle(style);
	}

	/**
    * Gets the service identifier for this operation
    *
    * @return A string value that signifies the service identifier.
    */
	public String getServiceid() {
		return serviceid;
	}

	/**
    * Sets the service Identifier for this operation.
    *
    * @param   value    The service Identifier
    */
	public void setServiceid(String serviceid) {
		this.serviceid = serviceid;
	}

	
	public Vector getWsdltype() {
		return wsdltypes;
	}

	public void setWsdltype(Vector wsdltypes) {
		this.wsdltypes = wsdltypes;
	}

	public Message getInmessage() {
		return inmessage;
	}

	public void setInmessage(Message inmessage) {
		this.inmessage = inmessage;
	}

	public Message getOutmessage() {
		return outmessage;
	}

	public void setOutmessage(Message outmessage) {
		this.outmessage = outmessage;
	}

	public void addInparameter(ParameterInfo parameter) {
		this.inparameters.add(parameter);
	}

	public List getInparameters() {
		return inparameters;
	}
	
	public void addOutparameter(ParameterInfo parameter) {
		this.outparameters.add(parameter);
	}

	public List getOutparameters() {
		return this.outparameters;
	}

	public void addInparameterComplex(ParameterInfo parameter) {
		this.inparameters_complex.add(parameter);
	}
	
	public List getInparametersComplex() {
		return inparameters_complex;
	}
	
	public void addOutparameterComplex(ParameterInfo parameter) {
		this.outparameters_Complex.add(parameter);
	}

	public List getOutparametersComplex() {
		return this.outparameters_Complex;
	}
	
	public String getOperationType() {
		return operationType;
	}

	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}

	public void setEncodingStyle(String value) {
		encodingStyle = value;
	}

	public String getEncodingStyle() {
		return encodingStyle;
	}

	public void setTargetURL(String value) {
		targetURL = value;
	}

	public String getTargetURL() {
		return targetURL;
	}

	public void setNamespaceURI(String value) {
		namespaceURI = value;
	}

	public String getNamespaceURI() {
		return namespaceURI;
	}

	public void setTargetObjectURI(String value) {
		targetObjectURI = value;
	}

	public String getTargetObjectURI() {
		return targetObjectURI;
	}

	public void setTargetMethodName(String value) {
		targetMethodName = value;
	}

	public String getTargetMethodName() {
		return targetMethodName;
	}

	public void setInputMessageName(String value) {
		inputMessageName = value;
	}

	public String getInputMessageName() {
		return inputMessageName;
	}

	public void setOutputMessageName(String value) {
		outputMessageName = value;
	}

	public String getOutputMessageName() {
		return outputMessageName;
	}

	public void setInputMessageText(String value) {
		inputMessageText = value;
	}

	public String getInputMessageText() {
		return inputMessageText;
	}

	public void setOutputMessageText(String value) {
		outputMessageText = value;
	}

	public String getOutputMessageText() {
		return outputMessageText;
	}

	public void setSoapActionURI(String value) {
		soapActionURI = value;
	}

	public String getSoapActionURI() {
		return soapActionURI;
	}

	public void setStyle(String value) {
		style = value;
	}

	public String getStyle() {
		return style;
	}

	public String toString() {
		return getTargetMethodName();
	}
	
	public String getDocumentation() {
		return documentation;
	}

	public void setDocumentation(String documentation) {
		this.documentation = documentation;
	}
	
	
	/** return a complex parameters list to a flat one*/
	public static List complexToFlat(List l )
	{
		List<ParameterInfo> r=new ArrayList<ParameterInfo>();
		
		for (Iterator iterator1 = l.iterator(); iterator1.hasNext();) {
			ParameterInfo element = (ParameterInfo) iterator1.next();
			//System.out.println("Parameter name: " + element.getName()+" : "+element.getKind());
			if(element.isComplex())
				subParametersToFlatList(element,r);
			else
				r.add(element);
		}
	
		return r;
	}

	private static void subParametersToFlatList(ParameterInfo element, List r) {
		ArrayList list=element.getSubParameters();
		for(int i=0; i<list.size();i++)
		{
			ParameterInfo p = (ParameterInfo)list.get(i);
			if(p.isComplex())
				subParametersToFlatList(p, r);
			else
				r.add(p);
		}
		
	}
}
