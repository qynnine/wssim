package edu.bis.tests;

import edu.bis.jwsl.SimilarityAssessor;
import edu.bis.jwsl.WordNotFoundException;



/**
 * 
 *  
 * Java WordNet Similarity Library
 * authors: Giuseppe Pirrò and Nuno Seco
 * 
 * for information contact Giuseppe at  gpirro@deis.unical.it
 *
 */
public class TestSemanticSymilarity
{

	/*
	 * this is a running example of how the library works
	 * You just have to specify two words and the metric you want to use
	 */
	
	
	public static void main(String argv[]) 
	{

		SimilarityAssessor sim=new SimilarityAssessor();
		int ff=0;
		String word2 = "Calculator";
		String word1 = "MathService";
		
		
			
		// you can choose the proper metric among the implemented one by specifying its name.
		String metric=SimilarityAssessor.RESNIK_METRIC;
		
		double score;
		try {
			score = sim.getSimilarity(word1, word2, metric);
			System.out.println("Semantic Similarity between "+word1+" and "+ word2+" score "+score +" using "+metric+" metric");
		
			
		} catch (WordNotFoundException e) {
			// TODO Auto-generated catch block
			ff=25225;
			
			//e.printStackTrace();
		}
		
	//	System.out.println(ff);
		
	}
	

}
