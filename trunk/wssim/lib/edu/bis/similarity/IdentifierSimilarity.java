package edu.bis.similarity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.bis.assignment.HungarianBipartiteMatcher;
import edu.stanford.db.rdf.syntax.generic.DumpConsumer;

public class IdentifierSimilarity {
	
	Map abrMap = new HashMap<String, ArrayList<String>>();
	
	private String id1 = null;
	private String id2 = null;
	private float structScore=0;
	private float semanticScore=0;
	private static boolean semTest=false;
	
	public IdentifierSimilarity (String word1, String word2) {
	
		this.id1 = word1;
		this.id2 = word2;
		this.semTest=false;
		
		// sample 
		ArrayList <String> wordsList = new ArrayList<String>();
		wordsList.add("Identification");
		wordsList.add("Identity");
		wordsList.add("identifier");
		abrMap.put("id", wordsList.clone());
		
		wordsList.clear();
		wordsList.add("Message");
		abrMap.put("msg", wordsList.clone());
		// a set of abbreviation should be added 
	}	
	
	public void computeStructureSimilarity()
	{
		StructureSimilarity strSim= new StructureSimilarity();
		strSim.compute_Similarity(id1, id2);
		structScore=strSim.getAverageScore(4);
		//structScore=strSim.GetScoreOfMetric(StructureSimilarity.StoilosMetric);
	}
	
	public void computeSemanticSimilarity(int strategy)
	{
		float score=0.0F;
		float [][] simmatrix;
				
		if (id1.equalsIgnoreCase(id2))  semanticScore= 1;
		else
		{
			
		// Splitting the identifiers to a list of tokens
		List <String> id1List = new ArrayList<String>();
		id1List = ParameterNameTokenizer.getTokens(id1);
		
		List <String> id2List = new ArrayList<String>();
		id2List = ParameterNameTokenizer.getTokens(id2);		
		
		// removing stop words from the list of tokens
		StopwordFilter swfilter = new StopwordFilter();
		id1List = swfilter.filtre(id1List);
		id2List = swfilter.filtre(id2List);
				
		
		// constructing the similarity matrix 
		String []_left = id1List.toArray(new String[]{});
		String []_right =id2List.toArray(new String[]{});
		simmatrix=new float [_left.length][_right.length];
		
		// I'll Use the TreeTagger here 
		
		for (int i=0; i<_left.length;i++)
			for(int j=0;j<_right.length;j++)
			{
				float k= checkAbbreviationScore(_left[i], _right[j]);
				if (k==-1||k==0)
					{				
						SemanticSimilarity sm= new SemanticSimilarity(_left[i], _right[j], SemanticSimilarity.SemanticThenStructureMetrics);
						simmatrix[i][j]=sm.getAverage();
						semTest= semTest || sm.isSemMetricUsed();
						
					}
				else
				simmatrix[i][j]=k;
			//	System.err.println(_left[j]+" "+_right[j]+" = "+simmatrix[i][j]);
			}
		
		if (_left.length>0 && _right.length>0){
		HungarianBipartiteMatcher matcher = new HungarianBipartiteMatcher(_left, _right, simmatrix);
		semanticScore= matcher.getScore();
		}
		else
			semanticScore=0;
		
		}
	}
	
	
	public float getStructScore() {
		return structScore;
	}

	public float getSemanticScore() {
		return semanticScore;
	}

	float checkAbbreviationScore(String word1, String word2){
		
		if(!(abrMap.containsKey(word1)) && !(abrMap.containsKey(word2)))
				return -1;
		else
		{
			if(abrMap.containsKey(word1))
			{
				ArrayList list = (ArrayList) abrMap.get(word1);
				for (int i=0; i<list.size();i++)
					if(((String)list.get(i)).equalsIgnoreCase(word2))
						return 1;
					return 0;
			}
			else{
				
			ArrayList list = (ArrayList) abrMap.get(word2);
			for (int i=0; i<list.size();i++)
				if(((String) list.get(i)).equalsIgnoreCase(word1)) return 1;
			return 0;
			}
		}
	}
	
	public static void dumpSimilarity(String s1, String s2)
	{
		float structScore=0;
		float semScore =0;
		float strWeight=0.8f;
		float semWeight=0.2f;
		
		System.out.print("["+s1+" - "+s2+"]");		
		
		IdentifierSimilarity idSim= new IdentifierSimilarity(s1, s2);
		
		idSim.computeStructureSimilarity();
		structScore=idSim.getStructScore();
		
		System.out.print("\t StrSim: "+ structScore);
		
		idSim.computeSemanticSimilarity(0);
		semScore=idSim.getSemanticScore();
		System.out.print("\t SemSim: "+ semScore);
		
		float total = (semScore + structScore) /2;
				
		System.out.print("\t AveSim : "+ total);
		
		/** strategy 1*/
		if(semScore==1&& structScore>=0.8)
			total= (semScore+structScore)/2;
		else
			if(semScore>=0.8 && structScore>=0.6)
			    total=semScore;
			else
				if(semScore>=0.6 && structScore>=0.6)
					total = semScore;
				else
					total= (float) ((0.6*semScore)+ (0.4*structScore));
		
		System.out.println("\t strategy : "+ total);
		

			
	}
	public static void main(String[] args) {
		
		  String s1,s2;

		 s1="CurrencyExchange"; s2="MoneyExchange"; dumpSimilarity(s1,s2); // similarity: very high  
		  s1="getMsgId"; s2="getMessageIdentifier"; dumpSimilarity(s1,s2); // similarity: very high
		  s1="getPersonIdentifier"; s2="getHumanId"; dumpSimilarity(s1,s2); // similarity: very high  
		  System.out.println();
		  s1="getWeatherByCityName"; s2="getWeather"; dumpSimilarity(s1,s2); // similarity: high
		  s1="getWeatherInState";  s2="getWeatherByCityName"; dumpSimilarity(s1,s2); // similarity: high  
		  s1="getUniversityName"; s2="getCollegeName"; dumpSimilarity(s1,s2); // similarity: high
		  System.out.println();
		  s1="getWeatherByPlaceName"; s2 = "getWeatherByZipCode";dumpSimilarity(s1,s2); // similarity: medium 
		  s1="getFlightBySourceAndDestination"; s2="getTravelByCityNames";dumpSimilarity(s1,s2); // similarity: medium
		  System.out.println();
		  s1="getWeather"; s2="getWeatherByProvince"; dumpSimilarity(s1,s2); // similarity: low  
		  s1="getScore"; s2="getScale"; dumpSimilarity(s1,s2); // similarity: low
		  System.out.println();
		  s1="getWeatherInState"; s2="convertCurrency"; dumpSimilarity(s1,s2); // similarity: very low
		  s1="getFlightForDestination"; s2="getWeatherInState"; dumpSimilarity(s1,s2); // similarity: very low
		
		  s1="getWeatherByPostalCode"; s2 = "getType";dumpSimilarity(s1,s2); // similarity: medium
		  
		  s1="code"; s2 = "give";dumpSimilarity(s1,s2); // similarity: medium
		   s2 = "weather";dumpSimilarity(s1,s2); // similarity: medium
		  s2 = "place";dumpSimilarity(s1,s2); // similarity: medium
		  s2 = "name";dumpSimilarity(s1,s2); // similarity: medium
		
	}

}
