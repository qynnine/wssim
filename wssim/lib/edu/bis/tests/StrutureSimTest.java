package edu.bis.tests;

import edu.bis.similarity.StructureSimilarity;
public class StrutureSimTest {

	/**
	 * @param args
	 */
	
	public static void main(String[] args) {
		
		String s1="msg"; String s2="message";
		int numOfMetrics = 5;
		
		StructureSimilarity StrSim = new StructureSimilarity();
		StrSim.compute_Similarity(s1, s2);
		StrSim.printResult(0);
		
		System.out.println ("# Max score = "+StrSim.getMaxSimScore());
		System.out.println ("# Min of the best "+numOfMetrics+" metrics = "+StrSim.getMinSimScore(numOfMetrics));
		System.out.println ("# Average of the best "+numOfMetrics+" metrics = "+StrSim.getAverageScore(0));
		
		/** we can get the result of a metric */
		System.out.println("Levenshtien = "+ StrSim.GetScoreOfMetric(StructureSimilarity.Levenshtein));
	}

	
}
