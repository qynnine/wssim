package edu.bis.tests;
import edu.bis.jwsl.*;
import edu.bis.similarity.HeuristicMatcher;

public class AccessingSimilarityDemo {

	/**
	 * this class is created to test the Java wordNet similarity library developed by
	 * 
	 * @param args
	 * @author Okba Tibermacine,
	 */
	public static void main(String[] args) {
		String [] phrase1 = new String [2];
		phrase1[0]="local";
		phrase1[1]="words";
		//phrase1[2]="";
		String [] phrase2 = new String[2];
		phrase2[1]="temperature";
		phrase2[0]="similarity";
		//phrase2[2]="defence";
		SimilarityAssessor sim = new SimilarityAssessor();
		
		float [][] simmatrix = new float[3][3];
		for(int i=0;i<2;i++)
			for(int j=0;j<2;j++)
			{
				try {
					simmatrix[i][j]=(float) sim.getSimilarity(phrase1[i], phrase2[j], SimilarityAssessor.PIRRO_SECO_METRIC);
					System.out.println("Semantic Similarity between "+phrase1[i]+" and "+ phrase2[j]+" score "+ simmatrix[i][j] +" using "+SimilarityAssessor.PIRRO_SECO_METRIC+" metric");
					
				} catch (WordNotFoundException e) {
						e.printStackTrace();
				}
			}

			
		HeuristicMatcher hmatcher = new HeuristicMatcher();
		float score= hmatcher.ComputeSetSimilarity(simmatrix, 1, 0.6F);
		//BipartiteMatcher bmatcher = new BipartiteMatcher(phrase1,phrase2,simmatrix);
		//double []weights=bmatcher.GetMapPairWeights();
		
		////for (int i=0; i<weights.length;i++)
			//for(int j=0; j<weights[0].length;j++)
		////	System.out.println("-"+weights[i]);
		System.out.println("our score is" + score);
		

		}
	}


