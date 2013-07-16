package edu.bis.schemaSim;

import org.w3c.rdf.model.ModelException;
import org.w3c.rdf.model.NodeFactory;
import org.w3c.rdf.model.Resource;
import org.w3c.rdf.model.Statement;

/**
 * represents a parameters type in a message as a labeled subgraph
 * three main nodes
 *@author Okba Tibermacine, 
 * 
 */

public class Type2Statement {

	private	String typeName=null;
	
	NodeFactory nf =null;
	
	Resource node =null;   // Types main Node
	Resource typeNameNode =null;  // types Name
	
	Resource tParameterType =null;  //got from the outside
	Resource lName =null;			//got from the outside
	Resource lType =null;			//got from the outside
	
	Statement s1=null;			// node,lName,tName
	Statement s2=null;			// node,lType,tParameterType
	
	
	/**
	 * constructor 
	 * @param name
	 * @param f
	 * @param Name
	 * @param Type
	 * @param ParameterType
	 */
	
	public Type2Statement(String name, NodeFactory f, Resource Name, Resource Type, Resource ParameterType ) 
	{
		this.typeName=name;
		this.nf=f;
		this.lName=Name;
		this.lType=Type;
		this.tParameterType=ParameterType;
		
		//String n =;
		try {
			String n ="T&"+typeName;
			node = nf.createResource(n);
			typeNameNode= nf.createResource(typeName);
			s1=nf.createStatement(node, lName, typeNameNode);
			s2=nf.createStatement(node, lType, tParameterType);
			
		} catch (ModelException e) {
			e.printStackTrace();
		}
	}
	
	
	// return the main node of this type
	public Resource getNode() {
		return node;
	}

	// return the first statement  (node,lName,typeNameNode)
	public Statement getStatement1() {
		return s1;
	}

	// return the second statement (node,lType,tParameterType)
	public Statement getStatement2() {
		return s2;
	}
	
	// return the types name
	public String getTypeName() {
		return typeName;
	}
	
	
	// return the Type Name nodes
	public Resource getTypeNameNode() {
		return typeNameNode;
	}
}
