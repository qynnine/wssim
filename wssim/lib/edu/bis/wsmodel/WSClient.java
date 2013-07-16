package edu.bis.wsmodel;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

public class WSClient {

	public static void testWSDL4J() {
		int i = 0, j = 0;
		try {
			ComponentBuilder builder = new ComponentBuilder();
			ServiceInfo serviceInfo = new ServiceInfo();
			//String wsdllocation = "c:\\2.wsdl";
			String wsdllocation = "D://Developpement//eclipse//workspace1//WSSIM//wsdl////Amount-of-moneycarPrice.wsdl";
			serviceInfo.setWsdllocation(wsdllocation);
			serviceInfo = builder.buildserviceinformation(serviceInfo);

			System.out.print("\n Documentation :");
			System.out.println(serviceInfo.getDocumentation());
			Iterator iter = serviceInfo.getOperations();
			
			System.out.println ();
			System.out.println ();
			System.out.println (serviceInfo.getName () + " Contient Les opérations Suivantes:");
	
			while (iter.hasNext()) {
				i++;
				OperationInfo oper = (OperationInfo) iter.next();
				
				System.out.println();
				System.out.println("Operation: " + i + " " + oper.getTargetMethodName());
				System.out.println();
				//System.out.println("Operation Type : "+oper.getOperationType());
				//System.out.println();
				System.out.println("Operation Documentation : "+oper.getDocumentation());
				System.out.println();
				
				//System.out.println("InputMessageName: "+oper.getInputMessageName());
				System.out.println("InputMessageName: "+oper.getInmessage().getQName().getLocalPart());
				System.out.println("InputMessageText: "+oper.getInputMessageText());
				
				System.out.println("OutputMessageName: "+oper.getOutputMessageName());
				System.out.println("OutMessageText: "+oper.getOutputMessageText());
				System.out.println("");
				Vector wsdltypess = oper.getWsdltype();
			/**					
				List inps = oper.getInparameters();
				List outps = oper.getOutparameters();
				System.out.println ( "the input parameters of this operation are: ");
				if (inps.size() == 0) {
					System.out.println ( "No Input Paramaters! ");
				} else {
					for (Iterator iterator1 = inps.iterator(); iterator1.hasNext();) {
						ParameterInfo element = (ParameterInfo) iterator1.next();
						System.out.println("Parameter name: " + element.getName()+" : "+element.getKind());
						//System.out.println("Parameter type: " + element.getKind());
					}
				}
				if (outps.size() == 0) {
					System.out.println ( "this operation do not return any parameters!");
				} else {
					System.out.println("The output parameters of this operation are:");
					for (Iterator iterator2 = outps.iterator(); iterator2.hasNext();) {
						ParameterInfo element = (ParameterInfo) iterator2.next();
						System.out.println("Parameter Name: " + element.getName() + " : "+ element.getKind() );
						
					}
				}
				**/
				
				//List inpsc = oper.getInparameters();
				List inpsc = OperationInfo.complexToFlat(oper.getInparametersComplex());
				List outpsc = oper.getOutparameters();
				
				
				System.out.println ( "the input complexeparameters of this operation are: ");
				if (inpsc.size() == 0) {
					System.out.println ( "No Input complexe Paramaters! ");
				} else {
					for (Iterator iterator1 = inpsc.iterator(); iterator1.hasNext();) {
						ParameterInfo element = (ParameterInfo) iterator1.next();
						System.out.println("Parameter name: " + element.getName()+" : "+element.getKind());
						//printSubParameters(element);						
					}
				}
				if (outpsc.size() == 0) {
					System.out.println ( "this operation do not return any parameters!");
				} else {
					System.out.println("The complexe output parameters of this operation are:");
					for (Iterator iterator2 = outpsc.iterator(); iterator2.hasNext();) {
						ParameterInfo element = (ParameterInfo) iterator2.next();
						System.out.println("Parameter Name: " + element.getName() + " : "+ element.getKind() );
						//printSubParameters(element);
					}
				}
				
				
				System.out.println("");
				
				if(oper.getInmessage().getDocumentationElement()!=null)
				{
				System.out.println("Input Message Documentation");
				//System.out.println(oper.getInmessage().getDocumentationElement().getTextContent());
				System.out.println(oper.getInputMessageText());
				}
				if(oper.getInmessage().getDocumentationElement()!=null){
				System.out.println("out Message Documentation");
				//System.out.println(oper.getInmessage().getDocumentationElement().toString());
				System.out.println(oper.getOutputMessageText());
				}
				System.out.println("");
			}
		}

		catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}

	private static void printSubParameters(ParameterInfo elem) {
		// TODO Auto-generated method stub
		ArrayList inpc = elem.getSubParameters();
		if(elem.isComplex())
		System.out.println ( "\tSub parameters of: "+ elem.getName()+" are :");
		if (inpc.size() == 0) {
			System.out.println ( "\tNo sub Parameters! ");
		} else {
			for(int i=0; i<inpc.size();i++)
			{
				ParameterInfo element = (ParameterInfo) inpc.get(i);
				System.out.println("\t\tParameter name: " + element.getName()+" : "+element.getKind());
				if (element.isComplex())
				{
				printSubParameters(element);	
				}	
			}		
		}
	}
		

	public static void main(String[] args) {
		WSClient.testWSDL4J();
	}
}
