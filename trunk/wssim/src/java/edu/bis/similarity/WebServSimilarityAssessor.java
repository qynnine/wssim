package edu.bis.similarity;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.wsdl.Message;

import edu.bis.assignment.HungarianBipartiteMatcher;
import edu.bis.jwsl.SimilarityAssessor;
import edu.bis.jwsl.WordNotFoundException;
import edu.bis.metrics.StoilosMetric;
import edu.bis.wsmodel.*;
import uk.ac.shef.wit.simmetrics.similaritymetrics.AbstractStringMetric;
import uk.ac.shef.wit.simmetrics.similaritymetrics.CosineSimilarity;
import uk.ac.shef.wit.simmetrics.similaritymetrics.DiceSimilarity;
import uk.ac.shef.wit.simmetrics.similaritymetrics.JaccardSimilarity;
import uk.ac.shef.wit.simmetrics.similaritymetrics.Jaro;
import uk.ac.shef.wit.simmetrics.similaritymetrics.Levenshtein;
import uk.ac.shef.wit.simmetrics.similaritymetrics.NeedlemanWunch;
import uk.ac.shef.wit.simmetrics.similaritymetrics.SmithWatermanGotoh;
import com.wcohen.ss.TFIDF;

/**
 * WebServSimilarityAssessor class can be used to compute similarity between two web services
 * 
 * @author Tibermacine, Okba
 *
 */

public class WebServSimilarityAssessor {
	
	/** First Web Service Information Class */
	private ServiceInfo webServInfo1= new ServiceInfo() ;  	
	
	/** First Web Service Information Class */
	private ServiceInfo webServInfo2= new ServiceInfo();
	
	/** Similarity Metrics */
	public static final String Cosine_Similarity ="Cosine Similarity";
	public static final String Levenshtein ="Levenshtein";
	public static final String Jaccard_Similarity ="Jaccard Similarity";
	public static final String Jaro ="Jaro";
	public static final String Dice_Similarity ="Dice Similarity";
	public static final String NeedlemanWunch ="Needleman Wunch";
	public static final String SmithWatermanGotoh ="Smith Waterman Gotoh";
		
	// default semantic metric
	private String semanticMetric = SimilarityAssessor.PIRRO_SECO_METRIC;  
	// default structural metric
	private String structuralMetric = Levenshtein; 
	
	/** WebService Names Weight*/
	private float ws_NameWeight = 1;
	/** WebService Documentations Weight*/
	private float ws_DocumentationWeight = 1;
	/** WebService operations Weight*/
	private float ws_OperationSimilarityWeight = 1;
	
	/** Operation Names Weight */
	private float op_NameWeight = 1;
	/** Operation Documentations Weight */
	private float op_DocumentationWeight = 1;
	/** Operation Messages Weight */
	private float op_MessageSimilarityWeight = 1;
	
	/** Message Names Weight */
	private float ms_NameWeight = 1;
	/** Message Documentations Weight */
	private float ms_DocumentationWeight = 1;
	/** Message Parameters Weight */
	private float ms_parametersSimilarityWeight = 1;

	/** Similarity score between 2 web services names*/
	private float ws_NameScore = 0;
	/** Similarity score between 2 web services Documentations*/
	private float ws_DocumentationScore = 0;
	/** Similarity score between 2 web services operations*/
	private float ws_OperationSimilarityScore = 0;
	
	/** List of the first web service operations names */
	private String [] _leftOperations;
	/** List of the second web service operations names */
	private String [] _rightOperations;
	
	/** Matching pairs between 2 web services operations */
	private int [][] operationPairs=null;
	/** Similarity Matrix between the 2 web services operations*/
	private float [][]OpSimMatrix=null;
	/** Execution time for the 2 ws operations matching */
	private float [][]OpExecTimeMatrix=null;
	
	/*** List of the first web service input messages */
	private String [] _leftInMessage;
	/*** List of the second web service input messages */
	private String [] _rightInMessage;
	/*** List of the first web service output messages */
	private String [] _leftOutMessage;
	/*** List of the second web service output messages */
	private String [] _rightOutMessage;

	//**********************
	/** Similarity matrix between operations names*/
	private float [][]OpsNameMatrix=null;
	/** Similarity Matrix between operations output messages */
	private float [][]OpsOutMesMatrix=null;
	/** Similarity Matrix between operations input messages*/
	private float [][]OpsInMesMatrix=null;
	/** Similarity Matrix between 1Ws input messages and  2WS output message */
	private float [][]OpsIn_OutMesMatrix=null;
	/** Similarity Matrix between 1Ws output messages and  2WS input message */
	private float [][]OpsOut_InMesMatrix=null;
	/** Similarity matrix between operations documentations*/
	private float [][]OpsDocMatrix=null;
	
	// information about messages Matching
	/** Similarity matrix of the input_input messages documentation*/
	private float [][]ms_InMessages_Doc=null;
	/** Similarity matrix of the output_output messages documentation*/
	private float [][]ms_OutMessages_Doc=null;
	/** Similarity matrix of the input_output messages documentation*/
	private float [][]ms_InOutMessages_Doc=null;
	/** Similarity matrix of the output_input messages documentation*/
	private float [][]ms_OutInMessages_Doc=null;
	
	/** similarity matrix of the input message names */
	private float [][]ms_InMessages_Name=null;
	/** similarity matrix of the output message names */
	private float [][]ms_OutMessages_Name=null;
	/** similarity matrix of the input message names (in WS1) with output messages names (in WS2) */
	private float [][]ms_InOutMessages_Name=null;
	/** similarity matrix of the output message names (in WS1) with input messages names (in WS2) */
	private float [][]ms_OutInMessages_Name=null;
	
	/** similarity matrix of the input message parameters */
	private float [][]ms_InMessages_Par=null;
	/** similarity matrix of the output message names */
	private float [][]ms_OutMessages_Par=null;
	/** similarity matrix of the input message parameters (in WS1) with output messages parameters (in WS2) */
	private float [][]ms_InOutMessages_Par=null;
	/** similarity matrix of the output message parameters (in WS1) with input messages parameters (in WS2) */
	private float [][]ms_OutInMessages_Par=null;
	
	
	// global variabeles used in MessageSimilarity method
	/** similarity score between messages names */ 
	float messageNameSimScore=0 ;
	/** similarity score between messages documentations */
	float messageDocSimScore=0;
	/** similarity score between message parameters */
	float messageSimMatScore =0;
	
	/** Default Constructor*/
	public WebServSimilarityAssessor () {}
	
	
	/**
	 * constructor 
	 * @param wsdlLocation1, path of the first Web service
	 * @param wsdlLocation2, path of the second Web service
	 */
	public WebServSimilarityAssessor (String wsdlLocation1, String wsdlLocation2)
	{
		System.out.println("*/*/*/*/*/*/*/*/ \n"+wsdlLocation1+"\n"+wsdlLocation2+"\n */*/*/*/*/*/*/*/"); //// to be removed
		BuildServiceInfo(webServInfo1,wsdlLocation1);
		BuildServiceInfo(webServInfo2,wsdlLocation2);	
	}
	
	/**
	 * getSimilarityScore returns the similarity score between two web services.
	 */
	public float getSimilarityScore()
	{ 
		float overallScore=0;
		
		/** Firstly, we compute similarity between Web Services Names */ 
		float namesSimilarityScore=computeIdentifierSimilarity(webServInfo1.getName(), webServInfo2.getName());
		ws_NameScore = namesSimilarityScore;
		
		/** secondly,we compute similarity between the two web services documentations 
		 * using the IFTDF Method */
		float documentationSimilarityScore =0;
		if (webServInfo1.getDocumentation()!=null && webServInfo2.getDocumentation()!=null)
		documentationSimilarityScore = ComputeIFTDFSimilarity(webServInfo1.getDocumentation(),webServInfo1.getDocumentation());
		ws_DocumentationScore= documentationSimilarityScore;
		
		/** thirdly, we compute similarity between the two web services operations 
		 *  each operation in a web service is compared with all other operations in the second web service.
		 *  henceforth, we obtain a similarity matrix. this later is used by a heuristic or a bipartite matcher
		 *  to compute the best matching score (overall matrix score) between the operations. 
		 */
		
		float operationSimilarityScore=0;
		Iterator iterator1 = webServInfo1.getOperations();
		ArrayList<OperationInfo> webServOperList1 = new ArrayList<OperationInfo>();
				
		while (iterator1.hasNext()) {
			OperationInfo oper= (OperationInfo) iterator1.next();
			webServOperList1.add(oper);
		}
		
		int i;
		
		_leftOperations = new String[webServOperList1.size()];
		_leftInMessage = new String[webServOperList1.size()];
		_leftOutMessage = new String[webServOperList1.size()];
		
		for (i=0; i<webServOperList1.size();i++)
		{
			_leftOperations[i]=webServOperList1.get(i).getTargetMethodName();
			_leftInMessage[i]=webServOperList1.get(i).getInputMessageName();
			_leftOutMessage[i]= webServOperList1.get(i).getOutputMessageName();
			
		}
		
		Iterator iterator2 = webServInfo2.getOperations();
		ArrayList<OperationInfo> webServOperList2 = new ArrayList<OperationInfo>();
		
		while (iterator2.hasNext()) {
			OperationInfo oper= (OperationInfo) iterator2.next();
			webServOperList2.add(oper);
		}
		
		int j=0;
		 _rightOperations= new String[webServOperList2.size()];
		 _rightInMessage = new String[webServOperList2.size()];
		 _rightOutMessage = new String[webServOperList2.size()];
		
		for (j=0; j<webServOperList2.size();j++)
		{
			_rightOperations[j]=webServOperList2.get(j).getTargetMethodName();
			_rightInMessage[j]=webServOperList2.get(j).getInputMessageName();
			_rightOutMessage[j]= webServOperList2.get(j).getOutputMessageName();
		}
		
		/** filling the similarity matrix */ 
		if(webServOperList1.toArray().length>0 && webServOperList2.toArray().length>0)
		{
			int indi=webServOperList1.size();
			int indj=webServOperList2.size();
			OpSimMatrix= new float [indi][indj];
			OpExecTimeMatrix = new float [indi][indj];
			OpsNameMatrix= new float [indi][indj];
			OpsOutMesMatrix=new float [indi][indj];
			OpsInMesMatrix=new float [indi][indj];
			OpsDocMatrix=new float [indi][indj];
			OpsIn_OutMesMatrix = new float [indi][indj];
			OpsOut_InMesMatrix = new float [indi][indj];
			
			ms_InMessages_Doc=new float [indi][indj];
			ms_OutMessages_Doc=new float [indi][indj];
			ms_InOutMessages_Doc=new float [indi][indj];
			ms_OutInMessages_Doc=new float [indi][indj];
			
			ms_InMessages_Name=new float [indi][indj];
			ms_OutMessages_Name=new float [indi][indj];
			ms_InOutMessages_Name=new float [indi][indj];
			ms_OutInMessages_Name=new float [indi][indj];
			
			ms_InMessages_Par=new float [indi][indj];
			ms_OutMessages_Par=new float [indi][indj];
			ms_InOutMessages_Par=new float [indi][indj];
			ms_OutInMessages_Par=new float [indi][indj];
			
		}
			else 
			{
				OpSimMatrix =null;
				OpsNameMatrix=null;
				OpsOutMesMatrix =null;
				OpsInMesMatrix =null;
				OpsDocMatrix =null;
				OpsIn_OutMesMatrix =null;
				OpsOut_InMesMatrix =null;
				
			}
		
		for ( i=0;i<webServOperList1.size();i++)
			for (j=0;j<webServOperList2.size();j++)
			{
				long pgstart = System.currentTimeMillis();
				OpSimMatrix[i][j]=computeOperationSimilarity((OperationInfo)webServOperList1.toArray()[i], (OperationInfo) webServOperList2.toArray()[j]);
				long pgend = System.currentTimeMillis();
				OpExecTimeMatrix[i][j]=((float)(pgend-pgstart)/1000);
			}
		/**
		 * we can use Heuristic or HungarianBipartite Matcher to compute the best similarity score from the similarity matrix 
		 */
		
		/** heuristic Matcher*/ 
		// HeuristicMatcher matcher = new HeuristicMatcher();
		// operationSimilarityScore= matcher.ComputeSetSimilarity(simmatrix,1);
		
		/** HungarianBipartite Matcher
		 * this method gives a better results*/
		if(OpSimMatrix!=null)
		{
			//System.out.println("*/*/*/*/*/*/*/*/*/*/*/*/*/ All Operations:"+simmatrix.length + "]["+simmatrix[0].length);
			HungarianBipartiteMatcher matcher = new HungarianBipartiteMatcher(_leftOperations,_rightOperations,OpSimMatrix);
			operationSimilarityScore= matcher.getScore();
			operationPairs=matcher.getMapPair();
		}
		else operationSimilarityScore=0;
		  
		ws_OperationSimilarityScore= operationSimilarityScore;
		
		/** Finally, the overall similarity score is the average of the previous computed scores */
		if (webServInfo1.getDocumentation()!=null && webServInfo2.getDocumentation()!=null)
		{
			overallScore =((ws_NameWeight * namesSimilarityScore)+ (ws_DocumentationWeight *documentationSimilarityScore) + ( ws_OperationSimilarityWeight* operationSimilarityScore))/(ws_NameWeight + ws_DocumentationWeight + ws_OperationSimilarityWeight) ;
			System.out.print("\nNamesSimilarityScore * ("+ws_NameWeight +
					         ") + documentationSimilarityScore * ("+ws_DocumentationWeight +") + operationSimilarityScore * ("+ws_OperationSimilarityWeight+")= ");
			System.out.println((ws_NameWeight * namesSimilarityScore)+ (ws_DocumentationWeight *documentationSimilarityScore) + ( ws_OperationSimilarityWeight* operationSimilarityScore)+ " = " + overallScore );
		}
		else
		{	
			overallScore =((ws_NameWeight * namesSimilarityScore)+ ( ws_OperationSimilarityWeight* operationSimilarityScore))/(ws_NameWeight  + ws_OperationSimilarityWeight) ;
			System.out.print("\nNamesSimilarityScore * ("+ws_NameWeight +
					         ") + operationSimilarityScore * ("+ws_OperationSimilarityWeight+")= ");
			System.out.println((ws_NameWeight * namesSimilarityScore)+" + " +( ws_OperationSimilarityWeight* operationSimilarityScore)+ " = " + overallScore );
		
		
		}
		
		return overallScore ;
	}
	
	/**
	 * the method computes the similarity between two operations
	 * @param operation1
	 * @param operation2
	 * @return  similarity_score
	 */
	public float computeOperationSimilarity (OperationInfo operation1, OperationInfo operation2)
	{
		float oparationsOverallscore =0.0F;
				
		/** Firstly, we compute similarity between operation names */ 
		float operNameSimScore = computeIdentifierSimilarity(operation1.getTargetMethodName(), operation2.getTargetMethodName());
		
		/**save the result*/ 
		OpsNameMatrix[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=operNameSimScore;
		
		
		/** secondly, we compute similarity between operations documentation using IFTDF*/
		
		float operDocSimScore =0;
		if ( operation1.getDocumentation()!=null && operation2.getDocumentation()!=null
				&& operation1.getDocumentation()!="" && operation2.getDocumentation()!="")
		operDocSimScore = ComputeIFTDFSimilarity(operation1.getDocumentation(), operation2.getDocumentation());
		 
		OpsDocMatrix[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=operDocSimScore ;
		
		/** populate MessageInfo classes */
		MessageInfo inMessageinfo1= new MessageInfo(operation1.getInputMessageName(),operation1.getInputMessageText(),OperationInfo.complexToFlat(operation1.getInparametersComplex()),operation1.getInmessage());
		MessageInfo inMessageinfo2= new MessageInfo(operation2.getInputMessageName(),operation2.getInputMessageText(),OperationInfo.complexToFlat(operation2.getInparametersComplex()),operation2.getInmessage());
		MessageInfo outMessageinfo1= new MessageInfo(operation1.getOutputMessageName(),operation1.getOutputMessageText(),OperationInfo.complexToFlat(operation1.getOutparametersComplex()),operation1.getOutmessage());
		MessageInfo outMessageinfo2= new MessageInfo(operation2.getOutputMessageName(),operation2.getOutputMessageText(),OperationInfo.complexToFlat(operation2.getOutparametersComplex()),operation2.getOutmessage());

		/**thirdly, we compute similarity between operations messages */
		
		// compute similarity between input Messages 
		float inMessSimScore =computeMessageSimilarity(inMessageinfo1, inMessageinfo2);
		OpsInMesMatrix[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=inMessSimScore ;
		//System.err.println("#~inMessSimScore ["+inMessageinfo1.getMessageName()+"]["+inMessageinfo2.getMessageName()+"]="+inMessSimScore);
		
		ms_InMessages_Name[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageNameSimScore ;
		ms_InMessages_Doc[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageDocSimScore;
		ms_InMessages_Par[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageSimMatScore ;
		
		// compute similarity between output Messages
		float outMessSimScore =computeMessageSimilarity(outMessageinfo1, outMessageinfo2);
		OpsOutMesMatrix[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=outMessSimScore ;
		
		ms_OutMessages_Name[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageNameSimScore ;
		ms_OutMessages_Doc[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageDocSimScore;
		ms_OutMessages_Par[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageSimMatScore ;
		
		/** we can find dependencies between messages, InMessage / OutMessage and vis versa
		 *  by computing the similarity between them.
		 *  we deal with dependencies later on  
		 */
	
		float inoutMessSimScore =computeMessageSimilarity(inMessageinfo1, outMessageinfo2);
		OpsIn_OutMesMatrix[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=inoutMessSimScore ;
		
		ms_InOutMessages_Name[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageNameSimScore ;
		ms_InOutMessages_Doc[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageDocSimScore;
		ms_InOutMessages_Par[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageSimMatScore; 
		
		
		float outinMessSimScore =computeMessageSimilarity(outMessageinfo1, inMessageinfo2);
		OpsOut_InMesMatrix[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=outinMessSimScore ;
		
		ms_OutInMessages_Name[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageNameSimScore ;
		ms_OutInMessages_Doc[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageDocSimScore;
		ms_OutInMessages_Par[indexOf(operation1.getTargetMethodName(),_leftOperations)][indexOf(operation2.getTargetMethodName(),_rightOperations)]=messageSimMatScore; 
		
		/** finally,the similarity between the two operations is the average of the previous assessed scores  */
		
		if ( operation1.getDocumentation()!=null && operation2.getDocumentation()!=null
			&& operation1.getDocumentation()!="" && operation2.getDocumentation()!="")
			
			oparationsOverallscore =((operNameSimScore * op_NameWeight)+ (operDocSimScore * op_DocumentationWeight)
					+(((inMessSimScore + outMessSimScore)/2) * op_MessageSimilarityWeight))
					/(op_NameWeight + op_DocumentationWeight + op_MessageSimilarityWeight) ;
		else 
			oparationsOverallscore =  ((operNameSimScore * op_NameWeight) 
									+ (((inMessSimScore + outMessSimScore)/2) * op_MessageSimilarityWeight))
									/ (op_NameWeight +  op_MessageSimilarityWeight) ;
		
		//System.out.println("operNameSimScore * op_NameWeight= "+operNameSimScore * op_NameWeight);
		//System.out.println("((inMessSimScore ("+inMessSimScore +")+ outMessSimScore("+outMessSimScore+"))/2) * op_MessageSimilarityWeight) = "+((inMessSimScore + outMessSimScore)/2) * op_MessageSimilarityWeight);
		
		System.out.println("\nOp_sim ["+operation1.getTargetMethodName()+"]["+operation2.getTargetMethodName()+"]= "+oparationsOverallscore);
		
		return oparationsOverallscore;
	}
	
	/**
	 * this method computes the Similarity between two Messages 
	 * @param message1
	 * @param message2
	 * @return Message_similarity_score
	 */
	
	public float computeMessageSimilarity(MessageInfo message1, MessageInfo message2)
	{
		float overallMessageSimScore=0;
		float [][] mesSimMatrix;
		
		/** we can rewrite the following code in order to compute only messages with the same 
		 * number of parameters.
		 * 
		 * if(message1.getParameters().size()==message2.getParameters().size()){ 
		 */
		
		
		/** First, we compute similarity between message names */
		messageNameSimScore = computeIdentifierSimilarity(message1.getMessageName(), message2.getMessageName());
		
		/** Second, we compute similarity between messages documentations */
		messageDocSimScore=0;
		if (message1.getMessageText()!=null && message2.getMessageText()!=null
				&& message1.getMessageText()!="" && message2.getMessageText()!="")
		messageDocSimScore = ComputeIFTDFSimilarity(message1.getMessageText(), message2.getMessageText());
		
		// constructing the parameters similarity matrix  
		List parameterlist1 =message1.getParameters();
		List parameterlist2 =message2.getParameters();
		
		messageSimMatScore  =0;
				
		mesSimMatrix = new float[parameterlist1.size()][parameterlist2.size()];
		String []left = new String [parameterlist1.size()];
		String []right = new String [parameterlist2.size()];
		
		Iterator<ParameterInfo> iter1 = parameterlist1.listIterator();
		//Iterator<ParameterInfo> iter2 = parameterlist2.listIterator();
		
		int i=0;
		
		if (parameterlist1.size()>0 && parameterlist2.size()>0)
		{
		while (iter1.hasNext()&& i<parameterlist1.size())
		{
			ParameterInfo parameter1 = (ParameterInfo) iter1.next();
			left[i]=parameter1.getName();
			
			Iterator<ParameterInfo> iter3=parameterlist2.listIterator();
			int j=0;
			while(iter3.hasNext())
			{
				ParameterInfo parameter2 = (ParameterInfo) iter3.next();
				right[j]=parameter2.getName();
				mesSimMatrix[i][j]=computeParameterSimilarity(parameter1, parameter2);
				//System.out.println("@"+parameter1.getName()+" "+parameter2.getName()+" = "+mesSimMatrix[i][j]);
				j++;
			}
			i++;
		}
		
		
		/**
		 * we can use either  Heuristic or HungarianBipartite Matcher to compute the best similarity score 
		 * from the constructed similarity matrix. 
		 */
		
		/** heuristic Matcher*/ 
		// HeuristicMatcher matcher = new HeuristicMatcher();
		// simMatScore= matcher.ComputeSetSimilarity(mesSimMatrix,1);
	
		
		/** HungarianBipartite Matcher (it gives better results) */
		
		HungarianBipartiteMatcher matcher = new HungarianBipartiteMatcher(left,right,mesSimMatrix);
		messageSimMatScore = matcher.getScore();
		
		}		
		
		
		/** Finally, the overall similarity score is the average of the previous computed scores */
		
		if (message1.getMessageText()!=null && message2.getMessageText()!=null
			&& message1.getMessageText()!="" && message2.getMessageText()!="")
			{	
			overallMessageSimScore=((ms_NameWeight* messageNameSimScore) + 
									(ms_DocumentationWeight * messageDocSimScore) + 
									(ms_parametersSimilarityWeight * messageSimMatScore ))/
									(ms_NameWeight + ms_DocumentationWeight + ms_parametersSimilarityWeight);
			}
		else 	// in case where no documentation is found
			{
			
			overallMessageSimScore=((ms_NameWeight* messageNameSimScore) + 
					(ms_parametersSimilarityWeight * messageSimMatScore ))/
					(ms_NameWeight + ms_parametersSimilarityWeight);
			
			}
		
		return overallMessageSimScore ;
	}
	
	
	/**
	 * compute the similarity between two parameters 
	 * @param parameter1
	 * @param parameter2
	 * @return Paramaters_similarity_score
	 */
	
	public float computeParameterSimilarity(ParameterInfo parameter1,ParameterInfo parameter2 )
	{
		float score =0;
		
		/** First, we compute the similarity between parameters names */
		if (parameter1.getName().equalsIgnoreCase(parameter2.getName())) 
			score = 1;
		else
			score = computeIdentifierSimilarity(parameter1.getName(),parameter2.getName());
		
		/** Second, we compute similarity between parameter types */ 
		if (parameter1.getType()!=null & parameter2.getType()!=null)
		{
			if (parameter1.getType().equalsIgnoreCase(parameter2.getType()))
				score=(score +1)/2;
			else
				score = (score+computeTypeSimilarity(parameter1.getType(), parameter2.getType()))/2;
		}		
		
		return score;
	}
	
	/**
	 * compute the similarity between two identifiers,
	 * an identifier is a set of words 
	 * @param identifier1
	 * @param Identifier2
	 * @return
	 */
	
	public float computeIdentifierSimilarity(String identifier1, String identifier2)
	{
		float score=0.0F;
		float [][] simmatrix;
		if (identifier1==null || identifier2==null) return 0;
		
		if (identifier1.equalsIgnoreCase(identifier2))  return 1;
		
		IdentifierSimilarity idSim= new IdentifierSimilarity(identifier1, identifier2);
		
		//idSim.computeSemanticSimilarity(0);
		//score=idSim.getSemanticScore();
		
		idSim.computeStructureSimilarity();
		score=idSim.getStructScore();
		
		
		/*
	
		// Splitting the identifiers to a list of tokens
		List <String> id1List = new ArrayList<String>();
		id1List = ParameterNameTokenizer.getTokens(identifier1);
		
		List <String> id2List = new ArrayList<String>();
		id2List = ParameterNameTokenizer.getTokens(identifier2);		
		
		// removing stop words from the list of tokens
		StopwordFilter swfilter = new StopwordFilter();
		id1List = swfilter.filtre(id1List);
		id2List = swfilter.filtre(id2List);
				
		// constructing the similarity matrix 
		String []_left = id1List.toArray(new String[]{});
		String []_right =id2List.toArray(new String[]{});
		
		simmatrix=new float [_left.length][_right.length];
		
		for (int i=0; i<_left.length;i++)
			for(int j=0;j<_right.length;j++)
				simmatrix[i][j]=computeWordsSimilarity(_left[i], _right[j]);
				
	*/
		/** computer the overall matrix similarity score using heuristic or bipartite matcher*/
		
		/** a) Heuristic Matcher*/
		//  HeuristicMatcher matcher = new HeuristicMatcher();
		//  score= matcher.ComputeSetSimilarity(simmatrix,1);
		  
		
		/** b) HungarianBipartite matcher (it gives better results)*/
	/*	HungarianBipartiteMatcher matcher = new HungarianBipartiteMatcher(_left, _right, simmatrix);
		score= matcher.getScore();
		*/
		/** max between score and stoilos metric */
		
		return score;
		//return Math.max(score, (new StoilosMetric()).getSimilarity(identifier1, identifier1));
	}
	
	/**
	 * compute the similarity between two words
	 * it returns the semantic similarity score between the two given words if they exists in WordNet
	 * or the score of syntactical metric between them
	 * @param word1
	 * @param word2
	 * @param metric
	 * @return score
	 */
	
	public float computeWordsSimilarity(String word1, String word2)
	{
		float score =0.0F;
		
		if (word1.equalsIgnoreCase(word2)) return 1;
		
		SimilarityAssessor assessor = new SimilarityAssessor();
				
		try {
			score = (float) assessor.getSimilarity(word1, word2, semanticMetric);	
		} 
		catch (WordNotFoundException e) {
			// the exception means no semantics relation between words ! or one or both of words don't exist 
			// in the WordNet.
			
			score=0;
		
		
		
			
			/** we use one of the following metrics for computing structural similarity in case 
			 * where no semantic similarity is found */
			/**	
			// Jaro metric
			if (structuralMetric.equalsIgnoreCase(Jaro))
				{
				Jaro distance = new Jaro();
				score = distance.getSimilarity(word1, word2);
				return score;
				}
			
			// Levenshtein metric (Default)
			if (structuralMetric.equalsIgnoreCase(Levenshtein))
			{
				Levenshtein distance = new Levenshtein();
				score = distance.getSimilarity(word1, word2);
				return score;
			}
			
			// cosine similarity metric
			if (structuralMetric.equalsIgnoreCase(Cosine_Similarity))
			{
				CosineSimilarity distance = new CosineSimilarity();
				score = distance.getSimilarity(word1, word2);
				return score;
			}
			
			// Jaccard Similarity Metric
			if (structuralMetric.equalsIgnoreCase(Jaccard_Similarity))
			{
				JaccardSimilarity distance = new JaccardSimilarity();
				score = distance.getSimilarity(word1, word2);
				return score;
			}
			
			// Dice similarity metric
			if (structuralMetric.equalsIgnoreCase(Dice_Similarity))
			{
				DiceSimilarity distance = new DiceSimilarity();
				score = distance.getSimilarity(word1, word2);
				return score;
			}
			
			// NeedlemanWunch metric
			if (structuralMetric.equalsIgnoreCase(NeedlemanWunch))
			{
				NeedlemanWunch distance = new NeedlemanWunch();
				score = distance.getSimilarity(word1, word2);
				return score;
			}
			
			// SmithWatermanGotoh Metric
			if (structuralMetric.equalsIgnoreCase(SmithWatermanGotoh))
			{
				SmithWatermanGotoh distance = new SmithWatermanGotoh();
				score = distance.getSimilarity(word1, word2);
				return score;
			}
			*/
		}
	
		return score;
	}
	
	
	/**
	 * compute the similarity between two types
	 * @param type1
	 * @param type2
	 * @return
	 */
	
	public float computeTypeSimilarity(String type1, String type2){
		float score=0.0F;
		
		float [][] ScoreTable={{1.0F, 0.5F, 0.3F,0.1F, 0.1F},
				   {1.0F, 1.0F, 0.1F,0 , 0.1F},
				   {0.7F, 0.7F, 1.0F,0.8F, 0.3F},
				   {0.1F, 0, 0.1F,1.0F, 0},
				   {0.1F, 0, 0.1F,0, 1.0F},
					};

		Map <String,Integer> typeGroup = new HashMap<String, Integer>();
		
		// 1st group: Integer
		typeGroup.put("integer", 0);
		typeGroup.put("int", 0);
		typeGroup.put("byte", 0);
		typeGroup.put("short", 0);
		typeGroup.put("long", 0);
		
		//2nd group: real
		typeGroup.put("real", 1);
		typeGroup.put("float", 1);
		typeGroup.put("double", 1);
		typeGroup.put("decimal", 1);
		
		//3rd group: String
		typeGroup.put("string", 2);
		typeGroup.put("normalizedstring", 2);
		
		// 4th group: Date
		typeGroup.put("date", 3);
		typeGroup.put("datetime", 3);
		typeGroup.put("duration", 3);
		typeGroup.put("gday", 3);
		typeGroup.put("gmonth", 3);
		typeGroup.put("gmonthday", 3);
		typeGroup.put("gyear", 3);
		typeGroup.put("gyearmonth", 3);
		typeGroup.put("time", 3);
		// 5th group: boolean
		typeGroup.put("boolean", 4);
		typeGroup.put("bool", 4);
		
		int i=-1;
		int j=-1;
		
		if(typeGroup.containsKey(type1.toLowerCase()))
			i=typeGroup.get(type1.toLowerCase());
		
		if (typeGroup.containsKey(type2.toLowerCase()))
			j=typeGroup.get(type2.toLowerCase());
		
		if(i!=-1 && j!=-1)
			score=ScoreTable[i][j];
		
		
	return score;
		
	}
	
	
	
	/**
	 * compute the similarity between two texts by using the IFTDF method
	 * @param Text1
	 * @param Text2
	 * @return
	 */
	public float ComputeIFTDFSimilarity(String text1, String text2)
	{
		float score=0.0F;
				
		/*StringBuffer strBuf= new StringBuffer(text1);
				
		for(int i=0; i<text1.length();i++)
		if (!Character.isLetterOrDigit(text1.charAt(i)))
			strBuf.setCharAt(i,' ');
		
		text1=strBuf.toString();
		
		strBuf= new StringBuffer(text2);
				
		for(int i=0; i<text2.length();i++)
		if (!Character.isLetterOrDigit(text2.charAt(i)))
			strBuf.setCharAt(i,' ');
		
		text2=strBuf.toString();
		
		*/
		// compute TfIdf similarity between two texts 
		if (text1!="" && text2!="" && text1!=null && text2!=null){
		TFIDF  tfidf = new TFIDF();
		
		//tfidf.explainScore(text1, text1);
		score = (float) tfidf.score(text1, text2);
		}
		return score;
		
	}
	
		
	/** 
	 * build the web serviceInfo class from a given WSDL file location
	 * @param serviceinfo
	 * @param wsdlLocation
	 */
	
	protected void BuildServiceInfo(ServiceInfo serviceinfo, String wsdlLocation )
	{
		try
		{
		ComponentBuilder builder = new ComponentBuilder();
		String wsdllocation = wsdlLocation;
		serviceinfo.setWsdllocation(wsdllocation);
		serviceinfo = builder.buildserviceinformation(serviceinfo);
		
		}
		catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/** */
	public String getSemanticMetric() {
		return semanticMetric;
	}

	/** set the semantical similarity metric to be used*/
	public void setSemanticMetric(String semanticMetric) {
		this.semanticMetric = semanticMetric;
	}

	/** returns the  structural similarity metric used */
	public String getStructurealMetric() {
		return structuralMetric;
	}

	/** set the structual metric */
	public void setStructuralMetric(String structuralMetric) {
		this.structuralMetric = structuralMetric;
	}

	/** returns the webService names weight*/
	public float getWs_NameWeight() {
		return ws_NameWeight;
	}

	/** set the webService names weight*/
	public void setWs_NameWeight(float wsNameWeight) {
		ws_NameWeight = wsNameWeight;
	}

	/** returns the webService documentation weight */
	public float getWs_DocumentationWeight() {
		return ws_DocumentationWeight;
	}

	/** set the webService documentation weight */
	public void setWs_DocumentationWeight(float wsDocumentationWeight) {
		ws_DocumentationWeight = wsDocumentationWeight;
	}


	public float getWs_OperationSimilarityWeight() {
		return ws_OperationSimilarityWeight;
	}


	public void setWs_OperationSimilarityWeight(float wsOperationSimilarityWeight) {
		ws_OperationSimilarityWeight = wsOperationSimilarityWeight;
	}


	public float getOp_NameWeight() {
		return op_NameWeight;
	}


	public void setOp_NameWeight(float opNameWeight) {
		op_NameWeight = opNameWeight;
	}


	public float getOp_DocumentationWeight() {
		return op_DocumentationWeight;
	}


	public void setOp_DocumentationWeight(float opDocumentationWeight) {
		op_DocumentationWeight = opDocumentationWeight;
	}


	public float getOp_MessageSimilarityWeight() {
		return op_MessageSimilarityWeight;
	}


	public void setOp_MessageSimilarityWeight(float opMessageSimilarityWeight) {
		op_MessageSimilarityWeight = opMessageSimilarityWeight;
	}


	public float getMs_NameWeight() {
		return ms_NameWeight;
	}


	public void setMs_NameWeight(float msNameWeight) {
		ms_NameWeight = msNameWeight;
	}


	public float getMs_DocumentationWeight() {
		return ms_DocumentationWeight;
	}


	public void setMs_DocumentationWeight(float msDocumentationWeight) {
		ms_DocumentationWeight = msDocumentationWeight;
	}


	public float getMs_parametersSimilarityWeight() {
		return ms_parametersSimilarityWeight;
	}


	public void setMs_parametersSimilarityWeight(float msParametersSimilarityWeight) {
		ms_parametersSimilarityWeight = msParametersSimilarityWeight;
	}


	public float getWs_NameScore() {
		return ws_NameScore;
	}


	public float getWs_DocumentationScore() {
		return ws_DocumentationScore;
	}


	public float getWs_OperationSimilarityScore() {
		return ws_OperationSimilarityScore;
	}
	
	public String getWs1_Name()
	{
		return webServInfo1.getName();
	}
	
	public String getWs2_Name()
	{
		return webServInfo2.getName();
	}
	
	public String [] getWs1Operations()
	{
		return _leftOperations;
	}
	
	public String [] getWs2Operations()
	{
		return _rightOperations;
	}
	
	public int[][] getOperationPairs() {
		return operationPairs;
	}
	
	public float[][] getOpSimMatrix() {
		return OpSimMatrix;
	}
	
	/** returns the similarity matrix between operations names*/
	public float[][] getOpsNameMatrix() {
		return OpsNameMatrix;
	}
	
	/** returns the similarity Matrix between operations output messages */
	public float[][] getOpsOutMesMatrix() {
		return OpsOutMesMatrix;
	}

	/** returns the similarity Matrix between operations input messages*/
	public float[][] getOpsInMesMatrix() {
		return OpsInMesMatrix;
	}

	/** returns the similarity matrix between operations documentations*/
	public float[][] getOpsDocMatrix() {
		return OpsDocMatrix;
	}
	
	private int indexOf(String str, String[] strArray){
		int index=-1;
		for (int i=0; i< strArray.length;i++ )
			if(strArray[i].equals(str))
				return i;
		
		return index;
	}
		
	/*** returns the list of the first web service input messages */
	public String[] get_leftInMessage() {
		return _leftInMessage;
	}

	/*** returns the list of the second web service input messages */
	public String[] get_rightInMessage() {
		return _rightInMessage;
	}

	/*** returns the list of the first web service output messages */
	public String[] get_leftOutMessage() {
		return _leftOutMessage;
	}

	/*** returns the list of the second web service output messages */
	public String[] get_rightOutMessage() {
		return _rightOutMessage;
	}

	/** returns the similarity matrix between 1Ws input messages and  2WS output message */
	public float[][] getOpsIn_OutMesMatrix() {
		return OpsIn_OutMesMatrix;
	}

	/** returns the similarity matrix between 1Ws output messages and  2WS input message */
	public float[][] getOpsOut_InMesMatrix() {
		return OpsOut_InMesMatrix;
	}

	//******************************
	public float[][] getMs_InMessages_Doc() {
		return ms_InMessages_Doc;
	}


	public float[][] getMs_OutMessages_Doc() {
		return ms_OutMessages_Doc;
	}


	public float[][] getMs_InOutMessages_Doc() {
		return ms_InOutMessages_Doc;
	}


	public float[][] getMs_OutInMessages_Doc() {
		return ms_OutInMessages_Doc;
	}

	/** returns the similarity matrix of the input message names */
	public float[][] getMs_InMessages_Name() {
		return ms_InMessages_Name;
	}

	/** returns the similarity matrix of the output message names */
	public float[][] getMs_OutMessages_Name() {
		return ms_OutMessages_Name;
	}

	/** returns the similarity matrix of the input message names (in WS1) with output messages names (in WS2) */
	public float[][] getMs_InOutMessages_Name() {
		return ms_InOutMessages_Name;
	}

	/** returns the similarity matrix of the output message names (in WS1) with input messages names (in WS2) */
	public float[][] getMs_OutInMessages_Name() {
		return ms_OutInMessages_Name;
	}

	/** returns the similarity matrix of the input message parameters */
	public float[][] getMs_InMessages_Par() {
		return ms_InMessages_Par;
	}

	/** returns the similarity matrix of the output message names */
	public float[][] getMs_OutMessages_Par() {
		return ms_OutMessages_Par;
	}

	/** returns the similarity matrix of the input message parameters (in WS1) with output messages parameters (in WS2) */
	public float[][] getMs_InOutMessages_Par() {
		return ms_InOutMessages_Par;
	}

	/** returns the similarity matrix of the output message parameters (in WS1) with input messages parameters (in WS2) */
	public float[][] getMs_OutInMessages_Par() {
		return ms_OutInMessages_Par;
	}
	
	/** returns the first web service information object */
	public ServiceInfo getWebServInfo1() {
		return webServInfo1;
	}

	/** set the first web service information object */
	public void setWebServInfo1(ServiceInfo webServInfo1) {
		this.webServInfo1 = webServInfo1;
	}

	/** returns the second web service information object */
	public ServiceInfo getWebServInfo2() {
		return webServInfo2;
	}

	/** set the second web service information object */
	public void setWebServInfo2(ServiceInfo webServInfo2) {
		this.webServInfo2 = webServInfo2;
	}
	/** returns times execution*/
	public float[][] getOpExecTimeMatrix() {
		return OpExecTimeMatrix;
	}
	
}
