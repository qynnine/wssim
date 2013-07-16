package edu.bis.tests;

import edu.bis.similarity.WebServSimilarityAssessor;

public class webservDemo {
	/**
	 * @param args
	 * we test within  this class the WebServSimilarityAssessor !
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//String wspath1="C:\\Documents and Settings\\Okba\\Desktop\\flight2.xml";   
		//String wspath2="C:\\Documents and Settings\\Okba\\Desktop\\flight2.xml";
		String wspath2="D:\\Developpement\\eclipse\\workspace1\\WSSIM\\WS2\\WS2.1.wsdl";   //
		String wspath1="D:\\Developpement\\eclipse\\workspace1\\WSSIM\\WS2\\WS2.2.wsdl";
		WebServSimilarityAssessor ws = new WebServSimilarityAssessor(wspath1,wspath2);
		System.out.println("________________________________________________________________________________________");
		long pgstart = System.currentTimeMillis();
		float score  = ws.getSimilarityScore();
		long pgend = System.currentTimeMillis();
		
		System.out.println("________________________________________________________________________________________");
		System.out.println("similarity between the two web services = "+score + "calculated in :"+((long)(pgend-pgstart)/1000)+" sec.");
		System.out.println("========================================================================================");
		
		float[][] simMat= ws.getOpSimMatrix();
		float[][] execMat = ws.getOpExecTimeMatrix();
		String [] left = ws.getWs1Operations();
		String [] right = ws.getWs2Operations();
		for (int i=0; i<simMat.length;i++)
		{
			for (int j=0;j<simMat[0].length;j++)
			{
				System.out.println("\n * S( "+left[i]+" | "+ right[j]+" )= "+simMat[i][j]+ " calculated in "+ execMat[i][j]+" sec." );
			}
		}
		
	}
}
