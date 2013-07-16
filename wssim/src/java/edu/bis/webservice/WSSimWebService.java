/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.bis.webservice;

import edu.bis.serviceBuilder;
import edu.bis.similarity.WebServSimilarityAssessor;
import edu.bis.wsmodel.ServiceInfo;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author okba
 */
@WebService(serviceName = "WSSimWebService")
public class WSSimWebService {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetOperationPairInfo")
    public OperationPairSimilarity GetOperationPairInfo(@WebParam(name = "firstServiceURI") String firstServiceURI, @WebParam(name = "firstOperationName") String firstOperationName, @WebParam(name = "secondServiceURI") String secondServiceURI, @WebParam(name = "secondOperationName") String secondOperationName) {
       OperationPairSimilarity op = null;
        edu.bis.wsmodel.ServiceInfo serviceInfo1 = new ServiceInfo();
        serviceInfo1=edu.bis.serviceBuilder.BuildServiceInfo(serviceInfo1, firstServiceURI) ;
        
        edu.bis.wsmodel.ServiceInfo serviceInfo2 = new ServiceInfo();
        serviceInfo2=edu.bis.serviceBuilder.BuildServiceInfo(serviceInfo2, secondServiceURI) ;
        
        
       WebServSimilarityAssessor ws = new WebServSimilarityAssessor();
       ws.setWebServInfo1(serviceInfo1);
       ws.setWebServInfo2(serviceInfo2);
        
       boolean first=false;
       boolean second=false;
       int i=-1;
       int j=-1;
        for ( i=0;i<ws.getWs1Operations().length;i++)
        if (ws.getWs1Operations()[i].equals(firstOperationName)) 
        {first=true; break;}
        
          for ( j=0;j<ws.getWs2Operations().length;j++)
        if (ws.getWs2Operations()[j].equals(secondOperationName)) 
        { second=true; break;}
        
          if(first && second)
          {
          op=new OperationPairSimilarity();
          op.Operation_1=firstOperationName;
          op.Operation_2=secondOperationName;
          op.similarity=ws.getOpSimMatrix()[i][j];
          op.areComposabe=false;
          if (op.similarity>=0.5f) op.areSubstitutable=true;
          else
              op.areSubstitutable=false;
          }
        return op;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getServiceSimilarity")
    public Float getServiceSimilarity(@WebParam(name = "firstServiceURI") String firstServiceURI, @WebParam(name = "secondServiceURI") String secondServiceURI) {
        float simScore =0f;
        edu.bis.wsmodel.ServiceInfo serviceInfo1 = new ServiceInfo();
        serviceInfo1=edu.bis.serviceBuilder.BuildServiceInfo(serviceInfo1, firstServiceURI) ;
        
        edu.bis.wsmodel.ServiceInfo serviceInfo2 = new ServiceInfo();
        serviceInfo2=edu.bis.serviceBuilder.BuildServiceInfo(serviceInfo2, secondServiceURI) ;
        
        
       WebServSimilarityAssessor ws = new WebServSimilarityAssessor();
       ws.setWebServInfo1(serviceInfo1);
       ws.setWebServInfo2(serviceInfo2);
       simScore=ws.getSimilarityScore();
        return simScore;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getSubstitutableOperations")
    public java.lang.String [] getSubstitutableOperations(@WebParam(name = "firstServiceURI") String firstServiceURI, @WebParam(name = "secondServiceURI") String secondServiceURI) {
        String [] substitutes = new String[5];
        return substitutes;
    }
    
    
}
