package edu.bis.assignment;

/**
 * compute the maximum similarity score from a given matrix
 * using the Hungarian algorithm 
 * @author Tibermacine, Okba
 */

public class HungarianBipartiteMatcher {
	String [] left;
	String [] right;
	float [][]costMatrix;
	int   [][] result;
	
	
	public HungarianBipartiteMatcher(String [] _left, String [] _right, float [][] matrix)
	{
		this.left=_left;
		this.right=_right;
		this.costMatrix=copyOfMatrix(matrix);
		/*
		for (int i=0; i<left.length;i++)
		{ 
		System.out.println();
		for (int j=0; j< right.length;j++)
		{
			
			System.out.print ("\t"+left[i]+" / " + right[j]);
			System.out.print("["+i+"]["+j+"]");
			System.out.print (" = " + costMatrix[i][j]);
		}
		}*/
		
		float [][] workMatrix = workMatrix();
		AssignmentProblem assignement = new AssignmentProblem(workMatrix);
		HungarianAlgorithm hungarian = new HungarianAlgorithm();
		result = assignement.solve(hungarian);
		
	}
	
	// compute the score
	public float getScore()
	{
		float score=0;
		
		if(left.length>0 && right.length >0)
		{
		for (int i=0; i<left.length;i++)
		{
			if (result[i][0]<left.length && result[i][1]<right.length )
					{score += costMatrix[result[i][0]][result[i][1]];
					//System.err.println ("# "+left[result[i][0]]+" / " + right[result[i][1]] + " = " + costMatrix[result[i][0]][result[i][1]]);
					}
		}
		
		//System.err.println 
		score /=right.length ;
		}
		return score;
	}
	
	
	public int [][] getMapPair()
	{
		return result;
	}
	
	private float[][] workMatrix ()
	{ 
		float [][] rMatrix=CompleteMatrix();
		float max =0;
		
		for (int i=0; i< rMatrix.length;i++)
		for (int j=0; j< rMatrix[i].length;j++)
			if (max<rMatrix[i][j])
				max = rMatrix[i][j];
		
		for (int i=0; i< rMatrix.length;i++)
		{
			//System.out.print("\n");	
		
			for (int j=0; j< rMatrix[i].length;j++)
			{
				//System.out.print("\t "+rMatrix[i][j]);
				rMatrix[i][j]= (max + 100)- rMatrix[i][j];
				
			}
		}
		return rMatrix;
	}
	
	private float[][] CompleteMatrix()
	{
		float [][] mat=null;
		//System.out.println("left= "+left.length +"  Right="+right.length+" costmatrix="+costMatrix.length);
		
		if (left.length > right.length)
		{
		mat = new float [left.length][left.length];
		for( int i=0;i<left.length;i++)
			for (int j=0; j<left.length;j++)
				if (j<right.length)
					mat[i][j]=costMatrix[i][j];
				else
					mat[i][j]=0;
		}
		else
		{
			if (left.length < right.length)
			{
			mat = new float [right.length][right.length];
			for( int i=0;i<right.length;i++)
				for (int j=0; j<right.length;j++)
					if (i<left.length)
					{ //System.out.println("i= "+i +" < left="+left.length);
						mat[i][j]=costMatrix[i][j];
					}
					else
						mat[i][j]=0;
			}
			else 
				return copyOfMatrix(costMatrix);
		}
		
		return mat;
	}
	
	 private float[][] copyOfMatrix(float[][] cpMatrix) {
	        // make a copy of the passed array
	        float[][] retval = new float[cpMatrix.length][];
	        for (int i = 0; i < cpMatrix.length; i++) {
	            retval[i] = new float[cpMatrix[i].length];
	            System.arraycopy(cpMatrix[i], 0, retval[i], 0, cpMatrix[i].length);
	        }
	        return retval;
	    }
	
}
