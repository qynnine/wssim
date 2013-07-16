 package edu.bis.wssimGUI;

import java.awt.EventQueue;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.PrintWriter;

import edu.bis.similarity.WebServSimilarityAssessor;

public class WsdlCollectionAssessor {

	static float [][] matrix1 ;
	static float [][] matrix2 ;
	/**
	 * @param args
	 * @author Okba, Tibermacine university of Biskra, Algeria
	 * @throws FileNotFoundException 
	 */
	public static void main(String[] args) throws FileNotFoundException {
		
		//String path = "C://Documents and Settings//Okba//Desktop//WS2//WS2";
		String path = "D://Developpement//eclipse//workspace1//WSSIM//wsdl//";
		String[] dir = listWsdls(path);
		 matrix1 =new float[dir.length][dir.length];
		 matrix2 =new float[dir.length][dir.length];
		int numberOfOperation=0;
		int numberOfMessage=0;
		int numberOfMessageParameter=0;
		boolean cnumber =false;
		for (int i=0; i<dir.length-1; i++)
		{
			cnumber =true;
			for (int j=i+1;j<dir.length;j++)
			{
				
				WebServSimilarityAssessor ws = new WebServSimilarityAssessor(path+"//"+dir[i], path+"//"+dir[j]);
				matrix1[i][j]=ws.getSimilarityScore();
				if(cnumber) {
					numberOfOperation += ws.getWs1Operations().length;
					numberOfMessage+=ws.get_leftInMessage().length+ws.get_leftOutMessage().length;
					if (ws.getMs_InOutMessages_Par()!=null )
					numberOfMessageParameter+=ws.getMs_InOutMessages_Par().length * ws.getMs_InOutMessages_Par()[0].length;
					cnumber=false;
				}
				
				WebServSimilarityAssessor ws2 = new WebServSimilarityAssessor(path+"//"+dir[j],path+"//"+dir[i]);
				matrix2[i][j]=ws2.getSimilarityScore();
				
			}
		}
		
		
		System.out.println("Number of operation ="+numberOfOperation);
		System.out.println("Number of message ="+numberOfMessage);
		System.out.println("Number of parameter ="+numberOfMessageParameter);
		File file = new File("resultatAB.txt");
		File file2 = new File("resultatBA.txt");
		PrintWriter output= new PrintWriter(file);
		PrintWriter output2= new PrintWriter(file2);
		
		// file header
		for (int i=0;i<dir.length;i++)
		{
			output.print("\t"+dir[i]+"\t");
			output2.print("\t"+dir[i]+"\t");
		}
		output.println();
		output2.println();
		
		
		for (int i=0;i<dir.length;i++)
		{
			output.print(dir[i]+"\t");
			output2.print(dir[i]+"\t");
			
			for (int j=0;j<dir.length;j++)
			{
				output.print(matrix1[i][j]+"\t");
				output2.print(matrix2[i][j]+"\t");
			}
			output.println();
			output2.println();
		}
			
		output.close();
		output2.close();
	}	
		
	public static String[] listWsdls(String folderPath)
	{
		String[] dir = new java.io.File(folderPath).list(new OnlyWsdls());
		java.util.Arrays.sort(dir); 
		
		return dir;
	}
    
	}	



	/** This class implements the FilenameFilter interface.
	* The Accepted method only returns true for .wsdl and .XML, .asmx files.
	*/
	class OnlyWsdls2 implements FilenameFilter {
	public boolean accept(File dir, String s) {
	if (s.endsWith(".wsdl") || s.endsWith(".xml") ||s.endsWith(".asmx"))
	return true;
	
	return false;
	}
	}
	



