package edu.bis.assignment;

/**
 * just for testing ! 
 * @author Okba
 *  TO BE DELETED
 */

public class AssignementDemo {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		float [][] aCostMatrix={{2,3,7},{4,5,7},{2,3,7},{4,5,7},{4,5,7}};
		
		
		//AssignmentProblem ass = new AssignmentProblem(aCostMatrix);
		//HungarianAlgorithm h = new HungarianAlgorithm();

		int [][] res=null;
		
	
		String []_left ={"a","b","c","d","e"};
		String []_right ={"1","2","3"};
		HungarianBipartiteMatcher hmg = new HungarianBipartiteMatcher(_left, _right, aCostMatrix);
		//System.out.println(res.length);
		System.out.println("\nScore+ ="+(float)hmg.getScore());
		res= hmg.getMapPair();
		for (int i=0; i<res.length;i++)
		{
			System.out.println("\n"+res[i][0]+"  "+res[i][1]);
			
		}
				
				
	}

}
