package edu.bis.schemaSim;

import java.util.Iterator;

import org.w3c.rdf.model.ModelException;
import org.w3c.rdf.model.NodeFactory;
import org.w3c.rdf.util.RDFFactory;
import org.w3c.rdf.util.RDFFactoryImpl;

import edu.bis.similarity.WebServSimilarityAssessor;
import edu.bis.wsmodel.OperationInfo;
import edu.bis.wsmodel.ServiceInfo;

public class sf_MessagesTest {

	/**
	 * a test class for compute message similarity using SFA
	 * @param args
	 * @throws ModelException 
	 */
	public static void main(String[] args) throws ModelException {
		String wspath1="C:\\Documents and Settings\\Okba\\Desktop\\wstestl\\globalweather.WSDL";   
		String wspath2="C:\\Documents and Settings\\Okba\\Desktop\\wstestl\\globalweather.WSDL";
		WebServSimilarityAssessor ws = new WebServSimilarityAssessor(wspath1,wspath2);
		
		ServiceInfo s1 = ws.getWebServInfo1();
		ServiceInfo s2 = ws.getWebServInfo2();
		
		RDFFactory rf = new RDFFactoryImpl();
		NodeFactory nf = rf.getNodeFactory();
		
		// now create the first model
		Iterator iter = s1.getOperations();
		while (iter.hasNext()) {
			
			OperationInfo oper = (OperationInfo) iter.next();
			
			Iterator iter2 = s2.getOperations();
			while(iter2.hasNext())
			{
				OperationInfo oper2 = (OperationInfo) iter2.next();
				
				SF_MessageVsMessage sf= new SF_MessageVsMessage(oper.getInputMessageName(), oper.complexToFlat(oper.getInparametersComplex()), oper2.getInputMessageName(), oper2.complexToFlat(oper2.getInparametersComplex()));
				
				sf.Match();
				//sf.printResults(Message2Model.node_ParameterIdentifier);
				 sf.filterResult(Message2Model.node_ParameterNode);
				//sf.printResults();
			//	sf.printResults(Message2Model.node_ParameterIdentifier);
				sf.printFiltredResult();		
				//System.out.println("Sim(initial)= "+ sf.getSimilarity(SF_MessageVsMessage.Initial_Sim));
				//System.err.println("Sim(Flood)= "+ sf.getSimilarity(SF_MessageVsMessage.Flood_Sim));
				//System.err.println("Sim (Max (initial, flood) = " + sf.getSimilarity(SF_MessageVsMessage.Max_flood_initial_Sim));	
			}
		}
	}
}