package edu.bis.experiment;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;

import edu.bis.similarity.IdentifierSimilarity;
import edu.bis.similarity.IdentifierSimilarity2;
import edu.bis.tagger.TreeTagging;

/**
 * @author Okba Tibermacine 
 * we Test in this classe results between IdentifierSimilarity without tags and Identifier Similarity Including Tags 
 */
public class IdentifierTaggingExperiment {

	
	
	
	public static void main(String[] args) throws FileNotFoundException {
	//	IdentifierExtractor id = new IdentifierExtractor();
	ArrayList <String> words = new ArrayList<String>();
	//	File fileOutid = new File(".\\identlist.txt");
	//	PrintWriter outputid= new PrintWriter(fileOutid);
	/*	for(int i=1;i<words.size();i++)
			outputid.println(words.get(i));
		
		outputid.close();
		*/
		
	Scanner sc= new Scanner(new File(".\\identlist.txt"));
	
	while (sc.hasNextLine())
	{
		words.add(sc.nextLine());
	}
	sc.close();
	
		File fileOut = new File(".\\IdentifierResults.txt");
		PrintWriter output= new PrintWriter(fileOut);
		TreeTagging tt = new TreeTagging();
		for(int i=1;i<words.size()-1;i++){
			for (int j=i+1;j<words.size();j++ )
			{
				System.out.println(i+" - "+j +" :");
				String w1 = words.get(i);
				String w2 = words.get(j);
				IdentifierSimilarity2 idsim = new IdentifierSimilarity2(w1, w2);
				idsim.computeStructureSimilarity();
				IdentifierSimilarity idtag = new IdentifierSimilarity(w1, w2, tt);
				idtag.computeStructureSimilarity();
				output.println(w1+" - "+w2+" = "+idsim.getStructScore()+" | "+idtag.getStructScore());
			}
		}
		
		output.close();

	}

}
