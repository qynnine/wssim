package edu.bis.similarity;

import edu.bis.jwsl.SimilarityAssessor;
import edu.bis.jwsl.WordNotFoundException;

public class SemanticSimilarity {
	
	public final static int SemanticMetrics = 0;
	public final static int SemanticThenStructureMetrics= 1;
	private float jiang_MetricResult=0;
	private float lin_MetricResult=0;
	private float pirroSeco_MetricResult=0;
	private float resnik_MetricResult=0;
	private boolean semBool=true;
	
	SimilarityAssessor ss= new SimilarityAssessor();
	public SemanticSimilarity(String w1, String w2, int metricsType){
		
		try {
			jiang_MetricResult= (float) ss.getSimilarity(w1, w2,SimilarityAssessor.JIANG_METRIC );
			lin_MetricResult= (float) ss.getSimilarity(w1, w2,SimilarityAssessor.LIN );
			pirroSeco_MetricResult= (float) ss.getSimilarity(w1, w2,SimilarityAssessor.PIRRO_SECO_METRIC);
			resnik_MetricResult= (float) ss.getSimilarity(w1, w2,SimilarityAssessor.RESNIK_METRIC);
			
		} 
		catch (WordNotFoundException e) {
			
			semBool=false;
			if(metricsType==SemanticThenStructureMetrics)
			{
				StructureSimilarity strSim = new StructureSimilarity();
				strSim.compute_Similarity(w1, w2);
				float score =strSim.getAverageScore(0);
				//float score =strSim.GetScoreOfMetric(StructureSimilarity.StoilosMetric);
				jiang_MetricResult= score;
				lin_MetricResult= score;
				pirroSeco_MetricResult= score;
				resnik_MetricResult= score;
			}
			else
			{
				jiang_MetricResult= 0;
				lin_MetricResult= 0;
				pirroSeco_MetricResult= 0;
				resnik_MetricResult= 0;
			}
				
		}
	}
	
	public float getMaxScore()
	{
		return Math.max(Math.max(this.jiang_MetricResult,this.lin_MetricResult), Math.max(this.pirroSeco_MetricResult, this.resnik_MetricResult));
	}
	
	public boolean isSemMetricUsed()
	{
		return semBool;
	}
	public float getMinScore()
	{
		return Math.min(Math.min(this.jiang_MetricResult,this.lin_MetricResult), Math.min(this.pirroSeco_MetricResult, this.resnik_MetricResult));
	}
	
	public float getAverage()
	{
		return ((jiang_MetricResult+lin_MetricResult+pirroSeco_MetricResult+resnik_MetricResult)/4);
	}

	public float getJiang_MetricResult() {
		return jiang_MetricResult;
	}

	public float getLin_MetricResult() {
		return lin_MetricResult;
	}

	public float getPirroSeco_MetricResult() {
		return pirroSeco_MetricResult;
	}

	public float getResnik_MetricResult() {
		return resnik_MetricResult;
	}

}
