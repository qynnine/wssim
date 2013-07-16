package edu.bis.similarity;

import java.util.ArrayList;


import org.apache.commons.lang.StringUtils;

public class ParameterNameTokenizer {

	/**
	 * 
	 * @author TIBERMACINE Okba 
	 * the class splits a given parameter name into a list of tokens 
	 */

	public static ArrayList<String> getTokens(String paramaterName)	{
	
		ArrayList<String> result = new ArrayList<String>() ;
		
		char [] paraChars = paramaterName.toCharArray();
		String word="";
		int upperCounts =0;
		for (int i=0; i< paraChars.length;i++)
		{
		 	if (Character.isLowerCase(paraChars[i])){
		 		word=word + paraChars[i];
		 		upperCounts=0;
		 	}
		 	else
		 		if (Character.isUpperCase(paraChars[i])){
		 			if (upperCounts>0)
		 			{
		 				if (i+1<paraChars.length)
		 				{
		 					if(Character.isLowerCase(paraChars[i+1])){
		 						if (!word.equals("")) 
		 							result.add(word);
		 			 			word="";
		 			 			word =word + paraChars[i];
		 			 			upperCounts ++;	
		 					}
		 					else 
		 						word =word + paraChars[i];
		 				}
		 				else 
		 					word =word + paraChars[i];
		 			}
		 			else
		 			{
		 				if (!word.equals("")) 
 							result.add(word);
 			 			word="";
 			 			word =word + paraChars[i];
 			 			upperCounts ++;	
		 			}	
		 		}
		 		else 
		 			if ((paraChars[i]=='_') ||(paraChars[i]=='-')||(paraChars[i]==' ') ){
		 				if (!word.equals(""))
			 				result.add(word);
			 			word="";
			 			upperCounts=0;
		 			}
		}
		
		if (!word.equals(""))	result.add(StringUtils.lowerCase(word));
			
		return(result);
		
	}
}
