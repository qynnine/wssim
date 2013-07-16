package edu.bis.concurrent;

import edu.bis.similarity.WebServSimilarityAssessor;

public class TaskComputSim implements Runnable {
	
	WebServSimilarityAssessor ws= null;
	float score=0;
	float [][] execTimeMat = null;
	float [][] opSimMat = null;
	String [] ws1OpList = null;
	String [] ws2OpList = null;
	
	public TaskComputSim(String path1, String path2)
	{
		ws= new WebServSimilarityAssessor(path1, path2);
	}

	@Override
	public void run() {
		score=ws.getSimilarityScore();
		opSimMat= ws.getOpSimMatrix();
		execTimeMat = ws.getOpExecTimeMatrix();
		ws1OpList = ws.getWs1Operations();
		ws2OpList = ws.getWs2Operations();		
	}

	public float getScore() {
		return score;
	}

	public float[][] getExecTimeMat() {
		return execTimeMat;
	}

	public float[][] getOpSimMat() {
		return opSimMat;
	}

	public String[] getWs1OpList() {
		return ws1OpList;
	}

	public String[] getWs2OpList() {
		return ws2OpList;
	}
}
