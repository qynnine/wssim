package edu.bis.schemaSim;

import org.w3c.rdf.model.ModelException;
import org.w3c.rdf.model.NodeFactory;
import org.w3c.rdf.model.Resource;
import org.w3c.rdf.model.Statement;

/**
 * this class represents a Parameter identifier
 * it's a labeled sub graph containing three nodes, 
 * the first node is a main node on which two other nodes are connected
 * one for Parameter Type and the second to node Parameter.
 * @author Okba Tibermacine, 
 *
 */
public class Parameter2Statement {

	/** the Name of the Parameter */
	private String parameterName=null;
	
	/** the name of the Parameter Type*/
	private String parametersTypeName=null;

	/** the order of the parameter in the message*/
	private int order=-1;
	
	/** Node Factory Instance */
	NodeFactory nf =null;
	
	/** the main Node */
	private Resource node =null;
	
	/** the node that holds the parameter identifier */
	private Resource parametersNameNode =null;
	
	/** the node that represents the parameter type  */
	private Resource parametersTypeNode =null;		// got from the outside
	
	/** Node "Parameter" */
	Resource nParameter =null;	// got from the outside
	
	/** the label arc Name */
	Resource lName =null;   	// got from the outside
	
	/** the label arc Type */
	Resource ltype =null;		// got from the outside
	
	/** the label arc XMLType */
	Resource lXMLType =null; 	// got from the outside
	
	/** First statement that specify that arc lName connects Node to nName */
	Statement statement1=null;			// node,lName,nName
	
	/** Second statement that specify that arc lType connects Node to nParameter */
	Statement statement2=null;			// node,lType,nParameter
	
	/** Third statement that specify that arc lSqlType connects Node to nType */
	Statement statement3=null;			//node,lSqlType,ntype
	
	
	/**
	 * Default Constructor
	 * @param name   		for Parameter Name
	 * @param typeName		for paramater Type
	 * @param nfact			instance of NodeFactory
	 * @param Name			the Arc "Name"
	 * @param Parameter		the Node "Parameter"
	 * @param XMLType		the Arc "XMLType"
	 * @param Type			the Arc "Type"
	 * @param TypeNode		the node "TypeNode" 
	 * @param ordre			the order of the Parameter in the Message
	 * @throws ModelException
	 */
	public Parameter2Statement(String name,String typeName, NodeFactory nfact, Resource Name, Resource Parameter, Resource XMLType, Resource Type, Resource TypeNode, int ordre ) throws ModelException
	{
		this.parameterName = name;
		this.parametersTypeName=typeName;
		this.nf=nfact;
		this.order=ordre;
		this.lName=Name;
		this.ltype=Type;
		this.nParameter=Parameter;
		this.lXMLType=XMLType;
		this.parametersTypeNode=TypeNode;
		
		//String n ="Nod"+order +"("+name+")";
		String n ="&"+name;
		node = nf.createResource(n);
		parametersNameNode = nf.createResource(parameterName);
		
		statement1=nf.createStatement(node, lName, parametersNameNode);
		statement2=nf.createStatement(node, ltype, nParameter);
		statement3=nf.createStatement(node, lXMLType, parametersTypeNode);
	}

	/**
	 * this class returns the Main Node.
	 * @return (Resource) node.
	 */
	public Resource getNode() {
		return node;
	}

	/** returns the first statement.
	 * @return {@link Statement}.
	 */
	public Statement getStatement1() {
		return statement1;
	}

	/** returns the second statement.
	 * @return {@link Statement}.
	 */
	public Statement getStatement2() {
		return statement2;
	}

	/** returns the third statement.
	 * @return {@link Statement}
	 */
	public Statement getStatement3() {
		return statement3;
	}
	
	/** returns the parameterName.
	 * @return paramaterName.
	 */
	
	public String getParameterName() {
		return parameterName;
	}

	/** returns the order of the parameter*/
	public int getOrder() {
		return order;
	}
	
	/** returns the parameters identifier node*/
	public Resource getParameterNameNode() {
		return parametersNameNode;
	}
	
	/** returns the parameters type*/
	public String getparametersTypeName() {
		return parametersTypeName;
	}

	/** returns the parameters type Node */
	public Resource getParametersTypeNode() {
		return parametersTypeNode;
	}

}
