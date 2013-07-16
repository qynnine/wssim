package edu.bis.schemaSim;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.w3c.rdf.model.Model;
import org.w3c.rdf.model.ModelException;
import org.w3c.rdf.model.NodeFactory;
import org.w3c.rdf.model.Resource;
import org.w3c.rdf.util.RDFFactory;
import edu.bis.wsmodel.ParameterInfo;

/**
 * this class creates a labeled graph (an RDF Model) that represents the given message signature.
 * @author Okba Tibermacine,
 *
 */

public class Message2Model {
	
	/** node types found in the graph  */
	public final static int node_Message = 0;
	public final static int node_MessageNode = 1;
	public final static int node_MessageIdentifier = 2;
	
	public final static int node_Parameter = 3;
	public final static int node_ParameterNode = 4;
	public final static int node_ParameterIdentifier = 5;
	
	public final static int node_ParameterType = 6;
	public final static int node_TypeNode = 7;
	public final static int node_TypeIdentifier = 8;
	
	/** a Map to store nodes and theirs associated types */ 
	private Map <Resource,Integer> nodesKind = new HashMap<Resource, Integer>();
	
	/** a Map that stores parameters type and theirs associated subGraphs */
	private Map<String, Type2Statement> map_types = new HashMap<String, Type2Statement>();
	
	/** a Map that stores parameters identifier and theirs associated subGraph */
	private Map<String, Parameter2Statement> map_parameters = new HashMap<String, Parameter2Statement>();
	
	private RDFFactory rf ;
	private NodeFactory nf;
	
	/** Message parameters List (ParameterInfo) */
	private List prameterList;
	
	/** the name of the message*/
	private String messageName;
	
	/** the RDF model (graph) that represent the message */
	private Model model;
	
	// default nodes
	public Resource mNode=null ;
	public Resource mtype=null;
	public Resource mName=null ;
    public Resource Name=null ;
    public Resource Type=null ;
    public Resource Parameter=null;
    public Resource lParameter=null;
    public Resource XMLType =null;
    public Resource ParameterType=null;
    
	
    /** constructor */
	public Message2Model(String messageName, List paramlist, RDFFactory rf, NodeFactory nf)
	{
		this.messageName=messageName;
		this.prameterList=paramlist;
		this.rf=rf;
		this.nf=nf;
		try {
			this.model=MessagetoModel(messageName, this.prameterList);
			} 
		catch (ModelException e) {
			 e.printStackTrace();
			}
			
	}
	
	/** Generate and RDF model from the message Names and its parameters List */
	private Model MessagetoModel(String messageName, List parameters) throws ModelException{
		
		// create graph/model A
	    Model A = rf.createModel();
	    
	    mNode = nf.createResource("M");
	    nodesKind.put(mNode, node_MessageNode);
	    
	    mtype = nf.createResource("Message");
	    nodesKind.put(mtype, node_Message);
	    
	    mName = nf.createResource(messageName);
	    nodesKind.put(mName, node_MessageIdentifier);
	    
	    Parameter = nf.createResource("Parameter");
	    nodesKind.put(Parameter, node_Parameter);
	    
	    ParameterType = nf.createResource("parameterType");
	    nodesKind.put(ParameterType, node_ParameterType);
	    
	    // Arc Name
	    Name = nf.createResource("Name");
	    
	    // Arc Type
	    Type = nf.createResource("Type");
	    
	    // Arc Parameter   
	    lParameter = nf.createResource("lParameter");
	    
	    // Arc XMLType
	    XMLType = nf.createResource("XMLType");
	    
	    // connecting nodes with Arcs
	    A.add(nf.createStatement(mNode, Name, mName));
	    A.add(nf.createStatement(mNode, Type, mtype));
	    
	    // creating types subgraphs
	    List l=parameters;
	    
	    for (Iterator iterator1 = l.iterator(); iterator1.hasNext();) {
			ParameterInfo element = (ParameterInfo) iterator1.next();
		
			if(!map_types.containsKey(element.getKind())){
				// type didn't generated before
				
				Type2Statement typeSG=new Type2Statement(element.getKind(), nf, Name, Type, ParameterType);
				
				// node type (set kind)
				nodesKind.put(typeSG.getNode(), node_TypeNode);
				
				// type Name node (set kind)
				nodesKind.put(typeSG.getTypeNameNode(), node_TypeIdentifier);
				
				A.add(typeSG.getStatement1());  
				A.add(typeSG.getStatement2());
				
				map_types.put(element.getKind(), typeSG);				
			}
		}
	    
	    // parameters
	    
	    int i=0;
	    for (Iterator iterator1 = l.iterator(); iterator1.hasNext();) {
	    	i++;
			ParameterInfo element = (ParameterInfo) iterator1.next();
			Type2Statement t=map_types.get(element.getKind());
			
			Parameter2Statement paramSG=new Parameter2Statement(element.getName(),element.getKind(), nf, Name, Parameter, XMLType, ParameterType, t.getNode(), i);
			
			// node of the parameter (set kind)
			nodesKind.put(paramSG.getNode(), node_ParameterNode);
			
			// node of the parameters name (set kind)
			nodesKind.put(paramSG.getParameterNameNode(), node_ParameterIdentifier);
			
			
			A.add(paramSG.getStatement1());
			A.add(paramSG.getStatement2());
			A.add(paramSG.getStatement3());
			map_parameters.put(element.getName(), paramSG);
			
			// link the node with its message
			A.add(nf.createStatement(mNode, lParameter, paramSG.getNode()));   // messagae ----> parameter   
						
		}
		return A;	
	}

	/**
	 * return the model that represents the message
	 * @return Model
	 */
	public Model getModel() {
		return model;
	}
	
	
	public Map<String, Type2Statement> getMap_types() {
		return map_types;
	}

	public Map<String, Parameter2Statement> getMap_parameters() {
		return map_parameters;
	}

	public String getMessName() {
		return messageName;
	}
	
	/** returns a map that represent message nodes with their associated kinds*/
	public Map<Resource, Integer> getNodesKind() {
		return nodesKind;
	}
}
