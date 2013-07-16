package edu.bis.wsmodel;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import javax.wsdl.Binding;
import javax.wsdl.BindingInput;
import javax.wsdl.BindingOperation;
import javax.wsdl.BindingOutput;
import javax.wsdl.Definition;
import javax.wsdl.Input;
import javax.wsdl.Message;
import javax.wsdl.Operation;
import javax.wsdl.Output;
import javax.wsdl.Part;
import javax.wsdl.Port;
import javax.wsdl.Service;
import javax.wsdl.extensions.ExtensibilityElement;
import javax.wsdl.extensions.UnknownExtensibilityElement;
import javax.wsdl.extensions.soap.SOAPAddress;
import javax.wsdl.extensions.soap.SOAPBinding;
import javax.wsdl.extensions.soap.SOAPBody;
import javax.wsdl.extensions.soap.SOAPOperation;
import javax.wsdl.factory.WSDLFactory;
import javax.wsdl.xml.WSDLReader;
import javax.xml.namespace.QName;

import org.exolab.castor.xml.schema.AttributeDecl;
import org.exolab.castor.xml.schema.ComplexType;
import org.exolab.castor.xml.schema.ElementDecl;
import org.exolab.castor.xml.schema.Group;
import org.exolab.castor.xml.schema.Particle;
import org.exolab.castor.xml.schema.Schema;
import org.exolab.castor.xml.schema.SimpleTypesFactory;
import org.exolab.castor.xml.schema.Structure;
import org.exolab.castor.xml.schema.XMLType;
import org.jdom.input.DOMBuilder;

/**
 * This class defines methods for building components to invoke a web service
 * by analyzing a WSDL contract document.
 *
 * @author Markus Reis, ARC
 * @author (Modified by) Okba Tibermacine, University of Biskra, Algeria
 * 
 * the code is modified to parse ComplexeType and attributes 
 */
public class ComponentBuilder {
	
	/** JWSDL Factory instance */
	WSDLFactory wsdlFactory = null;
	
	/** Castor simple types factory */
	SimpleTypesFactory simpleTypesFactory = null;
	
	/** WSDL type schema */
	private Vector wsdlTypes = new Vector();
	
	/** The default SOAP encoding to use. */
	public final static String DEFAULT_SOAP_ENCODING_STYLE = "http://schemas.xmlsoap.org/soap/encoding/";

	
	/** list */
	ArrayList complexParameterx= new ArrayList<String>();
	
	/** Map*/
	Map<ComplexType, ParameterInfo> ComplexTypes = new HashMap<ComplexType, ParameterInfo>();
 
	
	/**
	 * Constructor
	 */
	public ComponentBuilder() {
		try {
			wsdlFactory = WSDLFactory.newInstance();
			simpleTypesFactory = new SimpleTypesFactory();
			}
		catch (Throwable t) 
			{
			System.err.println(t.getMessage());
			}
	}
	
	public ServiceInfo buildserviceinformation(ServiceInfo serviceinfo) throws Exception{
	
		/** Create the WSDL Reader object */
		WSDLReader reader=wsdlFactory.newWSDLReader();
		
		reader.setFeature("javax.wsdl.verbose",false);
		reader.setFeature("javax.wsdl.importDocuments",true);
				
		Definition def=reader.readWSDL(null, serviceinfo.getWsdllocation());
		
		// Create a castor schema from the types element defined in WSDL
		// This method will return null if there are types defined in the WSDL
		wsdlTypes = createSchemaFromTypes(def);
		////System.out.println("Schemas of the WSDL have been successfully finished building, a total number of Schema Definition :"+wsdlTypes.size());
		
		/** Get the services defined in the document */
		Map services = def.getServices();
		if (services!= null) {
			
			/** Create a component for each service defined */
			Iterator svcIter = services.values().iterator();
			populateComponent(serviceinfo, (Service) svcIter.next());
			////System.out.println("*** Congratulations! Web service model: ServiceInfo have successfully built ***");
					
			}
		
		return serviceinfo;
	}

	private Schema createschemafromtype(org.w3c.dom.Element schemaElement,Definition wsdlDefinition) {
		////System.out.println ( "The Schema is now still a Dom-type <xsd:schema> elements, attributes are not enough fully, we must construct the namespace attributes such as");
		////System.out.println ( "Use JDom, should first element of Dom type <xsd:schema> into JDom type ...");
		////System.out.println ( "started to build ...");
		
		if (schemaElement == null) {
			System.err.println("Unable to find schema extensibility element in WSDL");
			return null;
		}

		DOMBuilder domBuilder = new DOMBuilder();
		org.jdom.Element jdomSchemaElement = domBuilder.build(schemaElement);
		
		if (jdomSchemaElement == null) {
			System.err.println("Unable to read schema defined in WSDL");
			return null;
		}
		
		Map namespaces = wsdlDefinition.getNamespaces();
		if (namespaces != null && !namespaces.isEmpty()) {
			////+System.out.println ( "WSDL document Definition of all namespace:");
			Iterator nsIter = namespaces.keySet().iterator();
			
			while (nsIter.hasNext()) {
				String nsPrefix = (String) nsIter.next();
				String nsURI = (String) namespaces.get(nsPrefix);
				////System.out.println ( "Namespace:" + nsPrefix + "" + nsURI);
			
				if (nsPrefix!=null&&nsPrefix.length() > 0) {
					org.jdom.Namespace nsDecl = org.jdom.Namespace.getNamespace(nsPrefix, nsURI);
					jdomSchemaElement.addNamespaceDeclaration(nsDecl);
				}
			}
		}
		
		jdomSchemaElement.detach();
		Schema schema = null;
		
		try {
			schema = XMLSupport.convertElementToSchema(jdomSchemaElement);
		}
		catch (Exception e) {
			//System.out.println("a");
			System.err.println(e.getMessage());
			
		}
		return schema;
	}

	
	protected Vector createSchemaFromTypes(Definition wsdlDefinition) {
		////System.out.println ( "enter createSchemaFromTypes () method");
		////System.out.println ( "began Types generate Schema, Definition under the Schema element of the number of types of elements can be more than pass the incoming parameter is a Definition object:");
		Vector schemas=new Vector();
		org.w3c.dom.Element schemaElementt=null;
		if (wsdlDefinition.getTypes()!= null) {
			Vector schemaExtElem=findExtensibilityElement(wsdlDefinition.getTypes().getExtensibilityElements(), "schema");
			for (int i = 0; i < schemaExtElem.size(); i++) {
				ExtensibilityElement schemaElement = (ExtensibilityElement) schemaExtElem.elementAt(i);
				if (schemaElement != null && schemaElement instanceof UnknownExtensibilityElement) {
					schemaElementt = ((UnknownExtensibilityElement) schemaElement).getElement();
					Schema schema = createschemafromtype(schemaElementt,wsdlDefinition);
					schemas.add(schema);
				}
			}
		}
					
		return schemas;
	}

	private ServiceInfo populateComponent(ServiceInfo component, Service service) {
				
		QName qName = service.getQName();
		
		String namespace = qName.getNamespaceURI();
				
		String name = qName.getLocalPart();
				
		/** set the name of the service*/
		component.setName(name);
		
		/** set the documentation of the service*/
		String documentation=null;
		
		if(service.getDocumentationElement()!=null&&service.getDocumentationElement().getFirstChild()!=null)
			documentation= service.getDocumentationElement().getFirstChild().getNodeValue();
		component.setDocumentation(documentation);
		
	  	Map ports=service.getPorts();
		Iterator portIter = ports.values().iterator();
		
		while (portIter.hasNext()) {
			Port port = (Port) portIter.next();
			Binding binding = port.getBinding();
			List operations=buildOperations(binding);
			Iterator operIter = operations.iterator();
		
			while (operIter.hasNext()) {
				OperationInfo operation = (OperationInfo) operIter.next();
				Vector addrElems = findExtensibilityElement(port.getExtensibilityElements(), "address");
				ExtensibilityElement element = (ExtensibilityElement) addrElems.elementAt(0);
				if (element != null && element instanceof SOAPAddress) {
					SOAPAddress soapAddr = (SOAPAddress) element;
					operation.setTargetURL(soapAddr.getLocationURI());
				}
				/** Add an operation to the serviceInfo*/
				component.addOperation(operation);
			}
		}
		return component;
	}

	private List buildOperations(Binding binding) {
		
		List operationInfos = new ArrayList();
		List operations=binding.getBindingOperations();
			
		if (operations!= null && !operations.isEmpty()) {
			Vector soapBindingElems = findExtensibilityElement(binding.getExtensibilityElements(), "binding");
			String style = "document"; // default
			
			ExtensibilityElement soapBindingElem = (ExtensibilityElement) soapBindingElems.elementAt(0);
			if (soapBindingElem != null	&& soapBindingElem instanceof SOAPBinding) {
				// SOAPBinding class representative is <wsdl:binding> under the sub-elements: <wsdlsoap:binding element >
				SOAPBinding soapBinding = (SOAPBinding) soapBindingElem;
				style = soapBinding.getStyle();
			}
		
			Iterator opIter = operations.iterator();
			while (opIter.hasNext()) {
				
				// BindingOperation class representative is <wsdl:binding> under the sub-elements: <wsdlsoap:operation> element >
				
				BindingOperation oper = (BindingOperation) opIter.next();
				Vector operElems = findExtensibilityElement(oper.getExtensibilityElements(), "operation");
				ExtensibilityElement operElem = (ExtensibilityElement) operElems.elementAt(0);
				
				// SOAPOperation class representative is <wsdlsoap:operation> under the sub-elements: <wsdlsoap:operation/>

				if (operElem != null && operElem instanceof SOAPOperation) {
					OperationInfo operationInfo = new OperationInfo(style);
					buildOperation(operationInfo, oper);
					
					/** Add an operationInfo to the list of the operations*/
					operationInfos.add(operationInfo);
				}
			}
		}

		return operationInfos;
	}

	private OperationInfo buildOperation(OperationInfo operationInfo,BindingOperation bindingOper) {
		
		Operation oper = bindingOper.getOperation();
				
		/** set the name of the operation*/
		operationInfo.setTargetMethodName(oper.getName());
		
		/** set the documentation of the operation*/ 
		String documentation=null;
		if(oper.getDocumentationElement()!=null)
			documentation=oper.getDocumentationElement().getFirstChild().getNodeValue();
		operationInfo.setDocumentation(documentation);
		
		Vector operElems = findExtensibilityElement(bindingOper.getExtensibilityElements(), "operation");
		ExtensibilityElement operElem = (ExtensibilityElement) operElems.elementAt(0);
		
		if (operElem != null && operElem instanceof SOAPOperation) {
			SOAPOperation soapOperation = (SOAPOperation) operElem;
			operationInfo.setSoapActionURI(soapOperation.getSoapActionURI());
		}
		
		BindingInput bindingInput = bindingOper.getBindingInput();
		BindingOutput bindingOutput = bindingOper.getBindingOutput();
		Vector bodyElems = findExtensibilityElement(bindingInput.getExtensibilityElements(), "body");
		ExtensibilityElement bodyElem = (ExtensibilityElement) bodyElems.elementAt(0);

		if (bodyElem != null && bodyElem instanceof SOAPBody) {
			SOAPBody soapBody = (SOAPBody) bodyElem;
			List styles = soapBody.getEncodingStyles();
			String encodingStyle = null;

			if (styles != null) {
				encodingStyle = styles.get(0).toString();
			}

			if (encodingStyle == null) {
				encodingStyle = DEFAULT_SOAP_ENCODING_STYLE;
			}

			operationInfo.setEncodingStyle(encodingStyle.toString());
			operationInfo.setTargetObjectURI(soapBody.getNamespaceURI());
		}

		Input inDef = oper.getInput();

		if (inDef != null) {
			Message inMsg = inDef.getMessage();
			if (inMsg != null) {
				operationInfo.setInputMessageName(inMsg.getQName().getLocalPart());
			
				//Construction of the input messages parameters 
				getParameterFromMessage(operationInfo, inMsg, 1);
				operationInfo.setInmessage(inMsg);
				
				if(inMsg.getDocumentationElement()!=null)
					operationInfo.setInputMessageText(inMsg.getDocumentationElement().getFirstChild().getNodeValue());
				else
					operationInfo.setInputMessageText("");
			}
		}

		Output outDef = oper.getOutput();

		if (outDef != null) {
			Message outMsg = outDef.getMessage();

			if (outMsg != null) {
				operationInfo.setOutputMessageName(outMsg.getQName().getLocalPart());
                
				//Construction output message parameters
				getParameterFromMessage(operationInfo, outMsg, 2);
				operationInfo.setOutmessage(outMsg);
				
				if(outMsg.getDocumentationElement()!=null)
					operationInfo.setOutputMessageText(outMsg.getDocumentationElement().getFirstChild().getNodeValue());
				else
					operationInfo.setOutputMessageText("");
			}
		}
		
		return operationInfo;
	}

	private void getParameterFromMessage(OperationInfo operationInfo, Message msg, int manner) {
        String tip="";
        if(manner==1){
        	tip="Input";
        }
        else{
        	tip="Output";
        }
        
      ////System.out.println("");
      ////System.out.println ("*** start building "+ operationInfo.getTargetMethodName () +" operation of all messages "+ tip +" parameter ***");
		
        List msgParts = msg.getOrderedParts(null);
		Schema wsdlType = null;
		Iterator iter = msgParts.iterator();
		
		while (iter.hasNext()) {
			Part part = (Part) iter.next();
			//String targetnamespace = "";
			XMLType xmlType=getXMLType(part, wsdlType, operationInfo);
		
			
			/** coded added by me  */
			if (xmlType==null || xmlType.getName()==null || xmlType.getName().equals("null")) 
			{
			// I have to look for the right schema !!!
			
				if(part.getElementName()==null)
				{
																
					part.setElementName(new QName(part.getTypeName().getLocalPart()));
										
					/** search for the Complex Type in the Schema */
					xmlType=(XMLType) getComplexType(part, wsdlType, operationInfo);
				}
			}
		/** done*/
			if(xmlType==null)
				{ /** double check*/
					xmlType=(XMLType) getComplexType(part, wsdlType, operationInfo);
				}
			
			if (xmlType!=null && xmlType.isComplexType()) {
				
				// creation of a new complex Parameter
				ParameterInfo ComplexParameter = new ParameterInfo();
				// set the parameter Name
				ComplexParameter.setName(part.getName());
				// set the name of the parameters complexType
				ComplexParameter.setKind(part.getElementName().getLocalPart());
				
				// parse the complexeType
				buildComplexParameter((ComplexType) xmlType, ComplexParameter ,operationInfo,	manner );
								
				// add the parameter to the inputParameterComplex or outputParameterComplex List.
				if(manner==1) operationInfo.addInparameterComplex(ComplexParameter.clone());
				else operationInfo.addOutparameterComplex(ComplexParameter.clone());	
				
				
			}
			else {
				////System.out.print ( "part of the referenced xml element is a simple type");
				if(part.getTypeName()!=null){
				String partName = part.getName();
				ParameterInfo parameter = new ParameterInfo();
				parameter.setName(partName);
				System.err.print("+++"+partName+" "+part.getTypeName());
				parameter.setKind(part.getTypeName().getLocalPart());
								
				if (manner == 1) {
					// 1 to build the operation, said input parameters
					operationInfo.addInparameter(parameter);
					operationInfo.addInparameterComplex(parameter.clone());
				} else {
					operationInfo.addOutparameter(parameter);
					operationInfo.addOutparameterComplex(parameter.clone());
				}
				}
			}
			operationInfo.setWsdltype(wsdlTypes);
		}
	}

	@SuppressWarnings("unchecked")
	private void buildComplexParameter(ComplexType type,ParameterInfo ComplexeParameter,OperationInfo operationInfo, int manner) {
		boolean bool=false;
		
		if (ComplexTypes!=null && ComplexTypes.containsKey(type))
		{ 
			/** this complex Type was processed before, then we recopy it's subElements to the new parameter*/
					
			// get the parameter which contains that type
			ParameterInfo par = ComplexTypes.get(type);
			
			//copy sub_elements into the Operation (in/out list)
			copySubElementsIntoOperation(par, operationInfo, manner);
			
			// clone the subelements of the found parameter to the new one
			ComplexeParameter.setSubParameters((ArrayList<ParameterInfo>) par.getSubParameters().clone());
		}
		else
		{
			// double check if the type was processed before
			if (wasTraited(ComplexeParameter.getKind()))
			{
			
				ParameterInfo par = getTraitedType(ComplexeParameter.getKind());
				
				//copy subelements into Operation
				copySubElementsIntoOperation(par, operationInfo, manner);
				
				// clone parameter
				ComplexeParameter.setSubParameters((ArrayList<ParameterInfo>) par.getSubParameters().clone());
			}
			else
			{	/** processing a new complexType*/
				
				/** this section was added by me to deal with attributes */
				
				Enumeration  attr= type.getAttributeDecls();
				while (attr.hasMoreElements())
				{
					AttributeDecl atrdec=(AttributeDecl) attr.nextElement();
					//System.err.println("attr: "+atrdec.getName()+ " : "+atrdec.getSimpleType().getName());
					
					/** add the attribute as a Simple Type */
					bool=true;
					
					ParameterInfo parameter = new ParameterInfo();
					parameter.setName (atrdec.getName());
					
					parameter.setKind (atrdec.getSimpleType().getName());
					
					ComplexeParameter.addsubParameter(parameter.clone());
				
					if (manner == 1) 
						operationInfo.addInparameter(parameter);										
														
					else
						operationInfo.addOutparameter(parameter);
					
				}
				/** attribute section done */
				
				
				// XML Schema specification defines a number of components,
				// If schema, complexType, simpleType, group, annotation, include, import, element and attribute and so on.
				// particleEnum is ComplexType child under the element content, it can be part of the components of the above combination of
				
				
				Enumeration particleEnum = type.enumerate ();
				// group is the element (can be a complex type) set
				Group group = null;
				
				/**if (! particleEnum.hasMoreElements ()) {
				 * 			//System.out.println (operationInfo + "operator does not require input parameters");
				 * 		}
				 * 		else */
				
				while (particleEnum.hasMoreElements()) {
					
					Particle particle = (Particle) particleEnum.nextElement();
					if (particle instanceof Group) {
						
						group = (Group) particle;
						break;
						}
					}
				/** this part was added to the original code*/
				if(group==null)
				{
					ParameterInfo parameter = new ParameterInfo();
					parameter.setName(ComplexeParameter.getName());
					parameter.setKind(ComplexeParameter.getKind());
					
					if (!bool) ComplexeParameter.addsubParameter(parameter.clone());
					
					if (manner == 1) 
						operationInfo.addInparameter(parameter);										
					else
						operationInfo.addOutparameter(parameter);
						ComplexTypes.put(type, ComplexeParameter.clone());
					
				}
				
				if (group != null) 
				{
					
					Enumeration groupEnum = group.enumerate();
					
					while (groupEnum.hasMoreElements()) {
						// Take a look at this complex data type
						Structure item = (Structure) groupEnum.nextElement();
												
						if (item.getStructureType()==Structure.ELEMENT) {
							
							ElementDecl elementDecl = (ElementDecl) item;
														
							XMLType xmlType = elementDecl.getType();
							
							/** Set the name of the complexTypes sub-element if it's null*/
							if (xmlType.getName()==null || xmlType.getName().equals("null")) 
								{
								// not found the right XmlType, 
								//if(xmlType.isComplexType()) System.err.println("XMLNULL:  Changed to"+elementDecl.getName());
														
								xmlType.setName(elementDecl.getName());
						
								}	
							
							if (!wasTraited(elementDecl.getType().getName()))
							{    /** the sub element doesn't processed before */
																
								if (xmlType != null && xmlType.isComplexType()&& (xmlType.getName()!=null && !xmlType.getName().equals("null"))) {
									/** subElement is a complexType */
									
									ParameterInfo subParameter = new ParameterInfo();
									subParameter.setName(elementDecl.getName());
									subParameter.setKind(elementDecl.getType().getName());
									buildComplexParameter((ComplexType)xmlType,subParameter,operationInfo, manner);
									ComplexeParameter.addsubParameter(subParameter);
									
								}
								else
								{
									/** subElement is a Simple Type */
									
									//System.err.println ( "now start to deal with simple data types");
									ParameterInfo parameter = new ParameterInfo();
									parameter.setName (elementDecl.getName());
									////System.out.println ( "Parameter name:" + elementDecl.getName());
									parameter.setKind (elementDecl.getType ().getName());
									////System.out.println ( "parameter type:" + elementDecl.getType().getName());
									
									ComplexeParameter.addsubParameter(parameter.clone());
								
									if (manner == 1) 
										operationInfo.addInparameter(parameter);										
																		
									else
										operationInfo.addOutparameter(parameter);
									
								}
								
								ComplexTypes.put(type, ComplexeParameter.clone());
							}
							else
							{
								ParameterInfo par = getTraitedType(elementDecl.getType().getName());
								
								//copy subelements into Operation
								copySubElementsIntoOperation(par, operationInfo, manner);
								
								// clone parameter
								ComplexeParameter.setSubParameters((ArrayList<ParameterInfo>) par.getSubParameters().clone());
							}
						}
					}
				}
			
			}
		}
	}

	
	private void copySubElementsIntoOperation(ParameterInfo par,OperationInfo operationInfo, int manner) {
		
		ArrayList subParameters = par.getSubParameters();
		for(int i=0; i < subParameters.size();i++)
		{
			ParameterInfo p = (ParameterInfo) subParameters.get(i);
			if (p.isComplex())
			{
				copySubElementsIntoOperation(p,operationInfo,manner);
			}
			else
			{
				if (manner == 1) 
					operationInfo.addInparameter(p);
					 
				else
					operationInfo.addOutparameter(p);
			}
		}
	}

	
	/** return true if a given type was already processed*/ 
	
	private boolean wasTraited(String str)
	{
		Boolean bool=false;
		Set set = null;
		if (ComplexTypes!=null && ComplexTypes.entrySet()!=null)
		set = ComplexTypes.entrySet();

		if (set!=null)
		{
	    Iterator i = set.iterator();

	    while(i.hasNext()){
	      Map.Entry me = (Map.Entry)i.next();
	      //System.out.println(me.getKey() + " : " + me.getValue() );
	      
	      ParameterInfo p = (ParameterInfo)me.getValue();
	      
	      if(p!=null && p.getKind() !=null && p.getKind().equals(str))
	      {
	    	  bool=true;
	    	  break;
	      }
	    }
	    }
		
		return bool;
	}
	
	private ParameterInfo getTraitedType(String str)
	{
		ParameterInfo parameter=null;
		
		Set set = ComplexTypes.entrySet();

	    Iterator i = set.iterator();

	    while(i.hasNext()){

	    	Map.Entry me = (Map.Entry)i.next();
	    	parameter=(ParameterInfo)me.getValue();
	      
	      if(parameter.getKind()!=null && parameter.getKind().equals(str) )
	      {
	    	return parameter.clone();
	      }
	     
	    }
		
		return null;
	}
	
	protected XMLType getXMLType(Part part, Schema wsdlType, OperationInfo operationInfo) {	
		if (wsdlTypes == null) {
			return null;
		}

		XMLType xmlType = null;
		
		if (part.getElementName()!= null) {

			String elemName=part.getElementName().getLocalPart();
			ElementDecl elemDecl = null;
			
			for (int i = 0; i < wsdlTypes.size(); i++) {
				wsdlType = (Schema) (wsdlTypes.elementAt(i));
			
				if (wsdlType!=null)
				{
				String targetnamespace=wsdlType.getTargetNamespace();
				operationInfo.setNamespaceURI(targetnamespace);
				elemDecl=wsdlType.getElementDecl(elemName);
				ComplexType cxtype=		wsdlType.getComplexType(elemName);
							
				if (elemDecl!=null) {
					break;
				}
				}
			}
			if (elemDecl!=null) {
				 xmlType = elemDecl.getType();
				////+System.out.println(xmlType);				
			}
		}
		return xmlType;
	}

	/** return a complex type of a given part from the global schema*/
	protected XMLType getComplexType(Part part, Schema wsdlType, OperationInfo operationInfo) {	
		
		if (wsdlTypes == null) {
			return null;
		}

		ComplexType xmlType = null;
		
		if (part.getElementName()!= null) {
			
			String elemName=part.getElementName().getLocalPart();
			
			for (int i = 0; i < wsdlTypes.size(); i++) {
				wsdlType = (Schema) (wsdlTypes.elementAt(i));
				
				if (wsdlType!=null)
				{
					String targetnamespace=wsdlType.getTargetNamespace();
					operationInfo.setNamespaceURI(targetnamespace);
					xmlType=wsdlType.getComplexType(elemName);
					
					if (xmlType!=null) 	break;
				}
			}			
		}
		
		return xmlType;
	}
	
	/** search for a given extensibility elements */
	private static Vector findExtensibilityElement(List extensibilityElements, String elementType) {
		int i = 0;
		Vector elements = new Vector();
		if (extensibilityElements!= null) {
			Iterator iter = extensibilityElements.iterator();
			while (iter.hasNext()) {
				ExtensibilityElement elment = (ExtensibilityElement)iter.next();
				if (elment.getElementType().getLocalPart().equalsIgnoreCase(elementType)) {
						elements.add(elment);
				}
			}
		}
		return elements;
	}
}
