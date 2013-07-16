package edu.bis.schemaSim;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.w3c.rdf.model.ModelException;
import org.w3c.rdf.model.NodeFactory;
import org.w3c.rdf.util.RDFFactory;
import org.w3c.rdf.util.RDFFactoryImpl;
import com.interdataworking.mm.alg.FilterBest;
import com.interdataworking.mm.alg.MapPair;
import com.interdataworking.mm.alg.Match;
import com.interdataworking.mm.alg.Match.PGNode;

import edu.bis.similarity.WebServSimilarityAssessor;
import edu.bis.wsmodel.OperationInfo;
import edu.bis.wsmodel.ParameterInfo;
import edu.bis.wsmodel.ServiceInfo;

public class WsFsMatcher {

	/**
	 * a test sample
	 * @param args
	 * @author Okba Tibermacine,
	 * @throws ModelException 
	 */
	
	public static void main(String[] args) throws ModelException {
		String wspath1="C:\\Documents and Settings\\Okba\\Desktop\\flight1.xml";   
		String wspath2="C:\\Documents and Settings\\Okba\\Desktop\\flight1.xml";
		WebServSimilarityAssessor ws = new WebServSimilarityAssessor(wspath1,wspath2);
		
		ServiceInfo s1 = ws.getWebServInfo1();
		ServiceInfo s2 = ws.getWebServInfo2();
		
		RDFFactory rf = new RDFFactoryImpl();
		NodeFactory nf = rf.getNodeFactory();
		
		// now create the first model
		Iterator iter = s1.getOperations();
		while (iter.hasNext()) {
			
			OperationInfo oper = (OperationInfo) iter.next();
			
			// create the message RDF model 
			//printList(OperationInfo.complexToFlat(oper.getInparametersComplex()));
						
			Message2Model m1=new Message2Model(oper.getInputMessageName(), OperationInfo.complexToFlat(oper.getInparametersComplex()), rf, nf);
						
			Iterator iter2 = s2.getOperations();
			while(iter2.hasNext())
			{
				OperationInfo oper2 = (OperationInfo) iter2.next();
				Message2Model m2 =new Message2Model(oper2.getInputMessageName(), OperationInfo.complexToFlat(oper2.getInparametersComplex()), rf, nf);
				
				// create initial Mapping
				
				List<MapPair> initMap = new ArrayList<MapPair>();
				
				Map <String,Type2Statement> mapTypes1 =m1.getMap_types();
						
				Set set1=mapTypes1.entrySet();
				Iterator i1=set1.iterator();
				
				Map <String,Type2Statement> mapTypes2 =m2.getMap_types();
				
				Set set2=mapTypes2.entrySet();
				Iterator i2=set2.iterator();
				
				while(i1.hasNext())
				{
					Map.Entry me1=(Map.Entry) i1.next();
					Type2Statement t2s1= (Type2Statement) me1.getValue();
					
					// for each element t2s1 we compare it with other types 
					while(i2.hasNext())
					{
						Map.Entry me2=(Map.Entry) i2.next();
						Type2Statement t2s2= (Type2Statement) me2.getValue();
						
						//NOW we compare T2s1 and T2s2
						double d1=simType2Type(t2s1.getTypeName(),t2s2.getTypeName());
						initMap.add(new MapPair(t2s1.getNode(), t2s2.getNode(), ((d1+1)/2)));
						initMap.add(new MapPair(t2s1.getTypeNameNode(), t2s2.getTypeNameNode(), d1));
						
						
					}	
									
				}
				
				// now we compare parameters 
				
				Map <String,Parameter2Statement> mapParams1 =m1.getMap_parameters();
				
				Set setM1=mapParams1.entrySet();
				Iterator im1=setM1.iterator();
				
				Map <String,Parameter2Statement> mapParams2 =m2.getMap_parameters();
				
				Set setM2=mapParams2.entrySet();
				Iterator im2=setM2.iterator();
				
				while(im1.hasNext())
				{
					Map.Entry mp1=(Map.Entry) im1.next();
					Parameter2Statement p2s1= (Parameter2Statement) mp1.getValue();
					
					// for each element p2s1 we compare it with other types 
					while(im2.hasNext())
					{
						Map.Entry mp2=(Map.Entry) im2.next();
						Parameter2Statement p2s2= (Parameter2Statement) mp2.getValue();
						
						// we compare T2s1 and T2s2
						//double d1=simString2String(p2s1.getPname(),p2s2.getPname());
						double d1 =ws.computeIdentifierSimilarity(p2s1.getParameterName(), p2s2.getParameterName());	
						// we compute type node score ((dtype+1)/2))
						double dtype =ws.computeIdentifierSimilarity(p2s1.getparametersTypeName(), p2s2.getparametersTypeName());
						
						initMap.add(new MapPair(p2s1.getNode(), p2s2.getNode(), ((d1+dtype)/2)));
						initMap.add(new MapPair(p2s1.getParameterNameNode(), p2s2.getParameterNameNode(), d1));
						
					}
								
				}
				
				// the rest of the nods
				initMap.add(new MapPair(m1.mtype, m2.mtype, 1));
				initMap.add(new MapPair(m1.mNode, m2.mNode, 1));
				//double d1=simString2String(m1.getMessName(),m2.getMessName());
				double d1= ws.computeIdentifierSimilarity(m1.getMessName(), m2.getMessName());
				initMap.add(new MapPair(m1.mName, m2.mName, d1));
				
				initMap.add(new MapPair(m1.ParameterType, m2.ParameterType, 1));
				initMap.add(new MapPair(m1.Parameter, m2.Parameter, 1));
					
				// use the SFA to compute results
				
				Match sf = new Match();
				sf.formula = Match.FORMULA_FTT;
			    sf.FLOW_GRAPH_TYPE = Match.FG_PRODUCT;

			    PGNode[] result = sf.getMatch(m1.getModel(), m2.getModel(), initMap);
			   // MapPair.sort(result);
			     Match.dump(result);
			    System.out.println("\n\n==============================================================");
				
			    //MapPair.printMap(new FilterBest().getFilterBest(Arrays.asList(result), true), System.out);
			    
			}

		}
	}

	
	private static void printList(List l)
	{
		for (Iterator it=l.iterator();it.hasNext();)
		{
			ParameterInfo element = (ParameterInfo) it.next();
			System.err.println("Parameter name: " + element.getName()+" : "+element.getKind());
			if (element.isComplex())
				System.err.println("ERRRRRRRRRRRRRRRRRRRROR");
		}
	}
	
	
	private static double simType2Type(String tname, String tname2) {
		
		
		if(tname.equalsIgnoreCase(tname2))
			return 1;
		else 
			return 0;
	}

}
