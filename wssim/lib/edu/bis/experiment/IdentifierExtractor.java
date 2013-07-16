package edu.bis.experiment;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Scanner;

public class IdentifierExtractor {
	String[] dir;
	ArrayList <String> wordlist= new ArrayList<String>();
	public IdentifierExtractor() throws FileNotFoundException{
		String path = "D://Developpement//eclipse//workspace1//WSSIM//wsdl//";
		 dir = listWsdls(path);
	
			for (int i=0; i<dir.length-1; i++)
			{
				//System.out.println("file "+i);
				Scanner fileIn = new Scanner(new File(path+dir[i]));
				while (fileIn.hasNextLine())
				{
					String word="";
					String line =fileIn.nextLine();
					
					int pos =0;
					while (pos<line.length() && pos !=-1){
						pos= line.indexOf('"',pos);
						if (pos ==-1) break;
						int posf= line.indexOf('"',pos+1);
						word=line.substring(pos+1,posf);
						
						if(!(word.contains("http:")||wordlist.contains(word) || word.contains(" ")))
								wordlist.add(word);
						pos=posf+1;
						
					}										
				}
			}
	
		System.out.println(wordlist);
		System.out.println(wordlist.size());
	}
	
	
	
	public static String[] listWsdls(String folderPath)
	{
		String[] dir = new java.io.File(folderPath).list(new OnlyWsdls());
		java.util.Arrays.sort(dir); 
		
		return dir;
	}
    

	public static void main(String[] args) throws FileNotFoundException {
		IdentifierExtractor id = new IdentifierExtractor();

	}
	
}	
	class OnlyWsdls implements FilenameFilter {
		public boolean accept(File dir, String s) {
		if (s.endsWith(".wsdl") || s.endsWith(".xml") ||s.endsWith(".asmx"))
		return true;
		
		return false;
		}

}

