package edu.bis.schemaSim;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.w3c.rdf.model.ModelException;
import org.w3c.rdf.model.NodeFactory;
import org.w3c.rdf.model.Resource;
import org.w3c.rdf.util.RDFFactory;
import org.w3c.rdf.util.RDFFactoryImpl;

import com.interdataworking.mm.alg.MapPair;
import com.interdataworking.mm.alg.Match;
import com.interdataworking.mm.alg.Match.PGNode;

import edu.bis.similarity.WebServSimilarityAssessor;
import edu.bis.wsmodel.MessageInfo;

/**
 * the class compute the similarity between two messages using the Flooding Similarity Algorithm,
 * the FSA was developed by Sergy Melnik and Al @ Stanford University.
 * 
 * both messages are translated to labeled graphs (RDF models),
 * an initial mapping between node pairs is set using computeIdentifierSimilarity and computeTypeSimilarity methods found in {@link WebServSimilarityAssessor},
 * results are obtained after applying FSA on the two models and the initial mapping.
 * after, filtering results the similarity score between the two models is computed.
 *  
 * @author Okba Tibermacine,
 *
 */

public class SF_MessageVsMessage {
	
	/** use this one for computing similarity between the two models using only Initial values */
	final static int Initial_Sim = 0;
	
	/** use this one for computing similarity between the two models using the values obtained after applying SFA */
	final static int Flood_Sim = 1;
	
	/** use this one for computing similarity between the two models using the max between initial values and the flood values*/
	final static int Max_flood_initial_Sim = 2;
	
	/** Name of the Message A*/
	private String messageName_A=null;
	
	/** List of Message A parameters */
	private List parameterList_A=null;
	
	/** Name of the Message B*/
	private String messageName_B=null;
	
	/** List of message B parameters  */
	private List parameterList_B=null;
		
	/**RDF model represents Message A*/
	Message2Model modelA;
	
	/**RDF model represents Message B*/
	Message2Model modelB;
	
	/** initial mapping List (collection of mapPaires) */
	List<MapPair> initMap = new ArrayList<MapPair>();
	
	/** instance of WebServSimilarityAssessor to compute identifiers and types similarity */
	WebServSimilarityAssessor ws=new WebServSimilarityAssessor();
	
	/** array of results */
	PGNode[] result =null;
	
	/** list of filtered results */
	ArrayList<PGNode> filtResult= new ArrayList<PGNode>();
	
	/** a map that return a node type from model A */
	Map <Resource,Integer> nodesKind_A = null;
	
	/**a map that return a node type from model B */
	Map <Resource,Integer> nodesKind_B = null;
	
	/** Similarity flooding instance */
	Match simFlood ;

	/**
	 * Class constructor 
	 * @param messageName1
	 * @param parameterList1
	 * @param messageName2
	 * @param parameterList2
	 */
	public SF_MessageVsMessage(String messageName1, List parameterList1, String messageName2, List parameterList2)
	{
		this.messageName_A=messageName1;
		this.parameterList_A=parameterList1;
		this.messageName_B=messageName2;
		this.parameterList_B=parameterList2;
		
		// default value for the SF Matcher
		simFlood = new Match();
		simFlood.formula = Match.FORMULA_FTT;
		simFlood.FLOW_GRAPH_TYPE = Match.FG_PRODUCT;
		simFlood.TEST=false;
	}
	
	/**
	 * second constructor from MessageInfo instances
	 * @param message1
	 * @param message2
	 */
	public SF_MessageVsMessage(MessageInfo message1, MessageInfo message2)
	{
		this.messageName_A=message1.getMessageName();
		this.parameterList_A=message1.getParameters();
		this.messageName_B=message2.getMessageName();
		this.parameterList_B=message2.getParameters();
		
		simFlood = new Match();
		simFlood.formula = Match.FORMULA_FFT;
		simFlood.FLOW_GRAPH_TYPE = Match.FG_PRODUCT;
		//simFlood.TEST=false;
	}
	
	/**
	 * this method run the SFA on the two models
	 */
	public void Match() throws ModelException
	{
		initialMapping();
		
		
	    result = simFlood.getMatch(modelA.getModel(), modelB.getModel(), initMap);
	}
	
	/** compute the initial mapping between two Models nodes */
	protected void initialMapping()
	{
		RDFFactory rf = new RDFFactoryImpl();
		NodeFactory nf = rf.getNodeFactory();
		
		// creation of an RDF model that represents the first message
		modelA=new Message2Model(messageName_A, parameterList_A, rf, nf);
		nodesKind_A = modelA.getNodesKind();
		// creation of an RDF model that represents the second message.
		modelB=new Message2Model(messageName_B, parameterList_B, rf, nf);
		nodesKind_B = modelB.getNodesKind();
		
		//Retrieving the subgraphs that represent the types which figure in the first message
		Map <String,Type2Statement> mapTypes1 =modelA.getMap_types();
		
		Set set1=mapTypes1.entrySet();
		Iterator i1=set1.iterator();
		
		//Retrieving the subgraphs that represent the types which figure in the second message
		Map <String,Type2Statement> mapTypes2 =modelB.getMap_types();
		
		Set set2=mapTypes2.entrySet();
		
		while(i1.hasNext())
		{ 		
			Map.Entry me1=(Map.Entry) i1.next();
			Type2Statement t2s1= (Type2Statement) me1.getValue();
			Iterator i2=set2.iterator();
			// for each element t2s1 we compare it with other types 
			while(i2.hasNext())
			{
				Map.Entry me2=(Map.Entry) i2.next();
				Type2Statement t2s2= (Type2Statement) me2.getValue();
				
				//we compute similarity between T2s1 and T2s2
				double d1=ws.computeTypeSimilarity(t2s1.getTypeName(),t2s2.getTypeName());
				
				//initial mapping between node that represent parameter type in Ms1 and parameter type in Ms2
				//initMap.add(new MapPair(t2s1.getNoeud(), t2s2.getNoeud(), ((d1+1)/2)));
				initMap.add(new MapPair(t2s1.getNode(), t2s2.getNode(), d1));
			
				//initial mapping between node that represent a parameter type name in Ms1 and a parameter name in Ms2
				initMap.add(new MapPair(t2s1.getTypeNameNode(), t2s2.getTypeNameNode(), d1));
						
			}	
		}
		
		/*** we compute similarity between parameters identifiers */
		// Retrieving the subgraphs that represent the parameters of the first message
		Map <String,Parameter2Statement> mapParams1 =modelA.getMap_parameters();
		
		Set setM1=mapParams1.entrySet();
		Iterator im1=setM1.iterator();
		
		// Retrieving the subgraphs that represent the parameters of the second message
		Map <String,Parameter2Statement> mapParams2 =modelA.getMap_parameters();
		
		Set setM2=mapParams2.entrySet();
		
		
		while(im1.hasNext())
		{
			Map.Entry mp1=(Map.Entry) im1.next();
			Parameter2Statement p2s1= (Parameter2Statement) mp1.getValue();
			Iterator im2=setM2.iterator();
			// for each element p2s1 we compare it with other types 
			while(im2.hasNext())
			{
				Map.Entry mp2=(Map.Entry) im2.next();
				Parameter2Statement p2s2= (Parameter2Statement) mp2.getValue();
				
				// initial mapping between T2s1 nodes and T2s2 nodes
				
				// Similarity between parameters identifiers
				double d1 =ws.computeIdentifierSimilarity(p2s1.getParameterName(), p2s2.getParameterName());	
				
				// we compute type node score ((dtype+1)/2))
				double dtype =ws.computeTypeSimilarity(p2s1.getparametersTypeName(), p2s2.getparametersTypeName());
				
				initMap.add(new MapPair(p2s1.getNode(), p2s2.getNode(), ((d1+dtype)/2)));
			//	initMap.add(new MapPair(p2s1.getNode(), p2s2.getNode(), (d1)));
				initMap.add(new MapPair(p2s1.getParameterNameNode(), p2s2.getParameterNameNode(), d1));
				
			}
		}
		
		/** initial mapping for the rest of nodes */
		
		// initial mapping of "Message / Message"
		initMap.add(new MapPair(modelA.mtype, modelB.mtype, 1));
		
		// initial mapping of "M/M"
		initMap.add(new MapPair(modelA.mNode, modelB.mNode, 1));
		
		// initial mapping of "ParameterType/ParameterType"
		initMap.add(new MapPair(modelA.ParameterType, modelB.ParameterType, 1));
		
		// initial mapping of "Parameter/Parameter"
		initMap.add(new MapPair(modelA.Parameter, modelB.Parameter, 1));
		
		//similarity between messages names
		double d1= ws.computeIdentifierSimilarity(modelA.getMessName(), modelB.getMessName());
		
		//initial mapping between messages names
		initMap.add(new MapPair(modelA.mName, modelB.mName, d1));
	}

	/** this method sort the obtained results*/
	public void sortResult()
	{
	MapPair.sort(result);
	}
	
	// select best scored mapPairs where source and target nodes are of type  nodeType 
	public void filterResult(int nodeType) throws ModelException 
	{
		filtResult.clear();
		PGNode P =null;
		sortResult();
		ArrayList<PGNode> tempList = new ArrayList<PGNode>();
		
		ArrayList <String> leftSelectedNodes = new ArrayList<String>();
		
		ArrayList <String> rightSelectedNodes = new ArrayList<String>();
		
		// fill the temp list
		for(int i=0;i<result.length;i++)
		{
			PGNode pgn = result[i];
			
			Resource N1=(Resource) pgn.getLeft();
			Resource N2=(Resource) pgn.getRight();
			
			if((nodesKind_A.get(N1) !=null && nodesKind_B.get(N2)!=null)&&
			(nodesKind_A.get(N1)==nodeType && nodesKind_B.get(N2)==nodeType))
				tempList.add(pgn);
		}
		
		// select best scored pairs
		for(int i=0;i<tempList.size()-1;i++)
		{
			P=null;
			PGNode p1= tempList.get(i);
			
			if((! leftSelectedNodes.contains(((Resource)p1.getLeft()).getLocalName()))&&(! rightSelectedNodes.contains(((Resource)p1.getRight()).getLocalName()))){
				// first time
				
				P=p1;
				for (int j=i+1;j<tempList.size();j++)
				{
					PGNode p2= tempList.get(j);
					
					if((P.sim<p2.sim)&&(! rightSelectedNodes.contains(((Resource)p2.getRight()).getLocalName()))){
						
						P=p2;	
					}
				}
				// best candidate
				filtResult.add(P);
				leftSelectedNodes.add(((Resource)P.getLeft()).getLocalName());
				rightSelectedNodes.add(((Resource)P.getRight()).getLocalName());
			}
			
		}
		
	}
	
	/** this method prints the results of mapPairs */
	public void printResults() throws ModelException
	{
		MapPair.sort(result);
		for (int i=0;i< result.length;i++){
			
			PGNode mp = result[i];
			
			Resource N1=(Resource) mp.getLeft();
			Resource N2=(Resource) mp.getRight();
			
				
				System.err.println("MapPair["+N1.getLocalName()+" : ("+nodesKind_A.get(N1)+") - "
					+ N2.getLocalName()+" : ("+nodesKind_B.get(N2)+") = "+mp.sim
					+ " (Sim0= "+mp.getSim0()+"; SimN= "+mp.getSimN()+"; SimN1=  "+mp.getSimN1() +") ].");			
		}
	}
		
	/**
	 * this method prints the mapPair results where source and target nodes are of type nodeType
	 * nodeType could be one of type nodes declared in {@link Message2Model} 
	 * @param nodeType
	 * @throws ModelException
	 */
	public void printResults(int nodeType) throws ModelException
	{
		MapPair.sort(result);
		for (int i=0;i< result.length;i++){
			
			PGNode mp = result[i];
			
			Resource N1=(Resource) mp.getLeft();
			Resource N2=(Resource) mp.getRight();
			
			if((nodesKind_A.get(N1)!=null && nodesKind_B.get(N2)!=null)&&
			(nodesKind_A.get(N1)==nodeType && nodesKind_B.get(N2)==nodeType))
			
				System.err.println("MapPair["+N1.getLocalName()+" : ("+nodesKind_A.get(N1)+") / "
					+ N2.getLocalName()+" : ("+nodesKind_B.get(N2)+") = "+mp.sim
					+ " (Sim0= "+mp.getSim0()+"; SimN= "+mp.getSimN()+"; SimN1=  "+mp.getSimN1() +") ].");			
		}
	}

	/**
	 * print Filtered results
	 * @throws ModelException
	 */
	public void printFiltredResult() throws ModelException
	{
		for (int i=0;i< filtResult.size();i++){
			
			PGNode mp = filtResult.get(i);
			
			Resource N1=(Resource) mp.getLeft();
			Resource N2=(Resource) mp.getRight();
			
				
				System.out.println("FR["+N1.getLocalName()+" : ("+nodesKind_A.get(N1)+") - "
					+ N2.getLocalName()+" : ("+nodesKind_B.get(N2)+") = "+mp.sim
					+ " (Sim0= "+mp.getSim0()+"; SimN= "+mp.getSimN()+"; SimN1=  "+mp.getSimN1() +") ].");			
		}
	}
	
	/**
	 * return the similarity between the two messages
	 * if bool = true (we compute the max score between two pairs (initial  and after flood)
	 * else  we took the value after flood.
	 * */
	public float getSimilarity(int valueType) throws ModelException
	{
		float score=0;
		
		filterResult(Message2Model.node_ParameterNode);
		
		for (int i=0;i< filtResult.size();i++)
			if (valueType==Max_flood_initial_Sim)
			{
				score+= Math.max(((filtResult.get(i)).sim),((filtResult.get(i)).getSim0())); 
			}
			else
				if(valueType==Initial_Sim)
					score+= (filtResult.get(i)).getSim0();
				else
					score+= (filtResult.get(i)).sim;
			
		return score/filtResult.size();		
	}
	
	/** Set the type of formula to be used in the SF Matcher $
	 * the default formula to be used is Match.FORMULA_FFT*/
	public void setSimFloodFormula(boolean [] formula)
	{
		simFlood.formula=formula;
	}
	
	/**
	 * Set the Flow Graph Type to the SF Matcher
	 * FG_PRODUCT ,FG_AVG , FG_EQUAL , FG_TOTALP, FG_TOTALS
	 * FG_AVG_TOTALS, FG_STOCHASTIC, FG_INCOMING
	 * @param fgType
	 */
	public void setSimFloodFlowGraphType(int fgType)
	{
		simFlood.FLOW_GRAPH_TYPE= fgType;
	}
	
	/**
	 * returns the filtred results
	 * @return ArrayList filtredResults
	 */
	public ArrayList<PGNode> getFiltResult() {
		return filtResult;
	}

}
