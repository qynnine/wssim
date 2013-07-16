package edu.bis.wsmodel;

import java.util.ArrayList;

public class ParameterInfo {
	
	/** the name of the parameter */
	private String name; 
	
	/** the type of the parameter*/
	private String kind;
	
	/** the type Identifier*/
	private int id; // parameter identifier
	
	private String value; // parameter value
	
	
	private String serviceid; // service id
	
	private String operationname; // Operation Name
	
	private String inputtype=null;
	
	private String type;
	
	/** Boolean to indicate if */
	private Boolean complexType=false;
	
	/** sub parameters*/
	ArrayList <ParameterInfo> subParameters = new ArrayList<ParameterInfo>();
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getInputtype() {
		return inputtype;
	}
	public void setInputtype(String inputtype) {
		this.inputtype = inputtype;
	}
	public String getOperationname() {
		return operationname;
	}
	public void setOperationname(String operationname) {
		this.operationname = operationname;
	}
	public String getServiceid() {
		return serviceid;
	}
	public void setServiceid(String serviceid) {
		this.serviceid = serviceid;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String name2) {
		this.kind = name2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Boolean isComplex(){
		return complexType;
	}
	
	public void addsubParameter(ParameterInfo parameter){
		complexType=true;
		subParameters.add(parameter);
	}
	
	public ArrayList getSubParameters(){
		
		return (ArrayList) subParameters.clone();
	}
	
public void setSubParameters(ArrayList<ParameterInfo> subparameters){
		
		complexType=true;
		subParameters= subparameters;
	}
	
	public ParameterInfo clone()
	{
		ParameterInfo pr = new ParameterInfo();
		pr.complexType=this.complexType;
		pr.id=this.id;
		pr.inputtype=this.inputtype;
		pr.kind=this.kind;
		pr.name=this.name;
		pr.operationname=this.operationname;
		pr.serviceid=this.serviceid;
		pr.subParameters=(ArrayList<ParameterInfo>) this.subParameters.clone();
		pr.type=this.type;
		pr.value=this.value;
		
		return pr;
		
	}
}
