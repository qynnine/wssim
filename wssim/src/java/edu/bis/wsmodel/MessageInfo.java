package edu.bis.wsmodel;

import java.util.ArrayList;
import java.util.List;

import javax.wsdl.Message;

public class MessageInfo {
	/** The message name. */
	private String MessageName = "";
	/** The message Text. */
	private String MessageText = "";
	
	/**parameters list Of the Message, an element in the list corresponds to a ParameterInfo class */
	private List parameters = new ArrayList ();
	
	/** Operation corresponding to the message */
	private Message message;
	
	/** default constructor*/
	public MessageInfo()
	{
		
	}
	
	
	public MessageInfo(String name, String documentation, List parameterlist, Message message)
	{
		this.MessageName = name;
		this.MessageText = documentation;
		this.parameters = parameterlist;
		this.message = message;
	}
 
 	public String getMessageName() {
		return MessageName;
	}

	public void setMessageName(String messageName) {
		MessageName = messageName;
	}

	public String getMessageText() {
		return MessageText;
	}

	public void setMessageText(String messageText) {
		MessageText = messageText;
	}

	public List getParameters() {
		return parameters;
	}

	public void setParameters(List parameters) {
		this.parameters = parameters;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	
}