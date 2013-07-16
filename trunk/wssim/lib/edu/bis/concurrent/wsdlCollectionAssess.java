package edu.bis.concurrent;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.PrintWriter;


public class wsdlCollectionAssess {
public static void main(String[] args) throws FileNotFoundException {
		
		//String path = ".//WSDL_COLLECTION//communication";
		String path = "C://Documents and Settings//Okba//Desktop//WS2//WS2";
		String[] dir = listWsdls(path);
		float [][] matrix1 =new float[dir.length][dir.length];
		float [][] matrix2 =new float[dir.length][dir.length];
	
		File file2 = new File(path+"\\detail.txt");
		PrintWriter outD= new PrintWriter(file2);
		for (int i=0; i<dir.length-1; i++)
		{
			for (int j=i;j<dir.length;j++)
			{
				Runnable r1= new TaskComputSim(path+"//"+dir[i], path+"//"+dir[j]);
				
				Thread thr = new Thread(r1);
				thr.start();
				while(thr.isAlive()){}
				matrix1[i][j]=(float)((TaskComputSim) r1).getScore();
				dump(dir[i],dir[j],((TaskComputSim) r1).getWs1OpList(),((TaskComputSim) r1).getWs2OpList(),((TaskComputSim) r1).getOpSimMat(),((TaskComputSim) r1).getExecTimeMat(),outD);
				
				// second
				Runnable r2= new TaskComputSim(path+"//"+dir[j],path+"//"+dir[i]);
				
				Thread thr2 = new Thread(r2);
				thr2.start();
				while(thr2.isAlive()){}
				matrix2[i][j]=(float)((TaskComputSim) r2).getScore();
				dump(dir[j],dir[i],((TaskComputSim) r2).getWs1OpList(),((TaskComputSim) r2).getWs2OpList(),((TaskComputSim) r2).getOpSimMat(),((TaskComputSim) r2).getExecTimeMat(),outD);
				
				
			}
		}
		outD.close();
		File file = new File(path+"\\ress.txt");
		
		PrintWriter output= new PrintWriter(file);
		
		for (int i=0;i<dir.length;i++)
		{
			for (int j=0;j<dir.length;j++)
			{
				output.print("("+dir[i]+" , "+dir[j]+" = "+matrix1[i][j]+" | "+matrix2[i][j]+" )\t");				
			}
			output.println();
		}
			
		output.close();
		}	
		
	private static void dump(String ws1Fname, String ws2Fname ,String[] ws1OpList, String[] ws2OpList,
		float[][] opSimMat, float[][] execTimeMat, PrintWriter outD) {
	
		for (int i=0; i<opSimMat.length;i++)
		{
			for (int j=0;j<opSimMat[0].length;j++)
			{
				outD.print("\n "+ws1Fname+" || "+ws2Fname+ " / " +ws1OpList[i]+" | "+ ws2OpList[j]+" = "+opSimMat[i][j]+ " calculated in "+ execTimeMat[i][j]+" sec." );
			}
		}
	
}

	public static String[] listWsdls(String folderPath)
	{
		String[] dir = new java.io.File(folderPath).list(new OnlyWsdls());
		java.util.Arrays.sort(dir); 
		
		return dir;
	}
    
	}	

	/** 
	* This class implements the FilenameFilter interface.
	* The Accept method only returns true for .wsdl and .XML, .asmx files.
	*/
	class OnlyWsdls implements FilenameFilter {
	public boolean accept(File dir, String s) {
	if (s.endsWith(".wsdl") || s.endsWith(".xml") ||s.endsWith(".asmx"))
	return true;
	
	return false;
	}
	}
