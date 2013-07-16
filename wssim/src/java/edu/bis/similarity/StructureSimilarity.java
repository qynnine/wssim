package edu.bis.similarity;

import java.util.ArrayList;

import uk.ac.shef.wit.simmetrics.similaritymetrics.AbstractStringMetric;
import uk.ac.shef.wit.simmetrics.similaritymetrics.ChapmanOrderedNameCompoundSimilarity;
import uk.ac.shef.wit.simmetrics.similaritymetrics.Jaro;
import uk.ac.shef.wit.simmetrics.similaritymetrics.JaroWinkler;
import uk.ac.shef.wit.simmetrics.similaritymetrics.Levenshtein;
import uk.ac.shef.wit.simmetrics.similaritymetrics.NeedlemanWunch;
import uk.ac.shef.wit.simmetrics.similaritymetrics.QGramsDistance;
import uk.ac.shef.wit.simmetrics.similaritymetrics.SmithWatermanGotoh;
import edu.bis.metrics.StoilosMetric;

public class StructureSimilarity {
	
	public final static int StoilosMetric = 0;
	//public final static int BlockDistance = 1;
	//public final static int ChapmanLengthDeviation = 1;
	//public final static int ChapmanMatchingSoundex = 2;
	//public final static int ChapmanMeanLength = 3;
	public final static int ChapmanOrderedNameCompoundSimilarity = 1;
	//public final static int CosineSimilarity = 6;
	//public final static int DiceSimilarity = 7;
	//public final static int EuclideanDistance = 8;
	//public final static int JaccardSimilarity = 9;
	public final static int Jaro = 2;
	public final static int JaroWinkler = 3;
	public final static int Levenshtein = 4;
	//public final static int MatchingCoefficient = 13;
	public final static int NeedlemanWunch = 5;
	//public final static int OverlapCoefficient = 15;
	public final static int QGramsDistance = 6;
	public final static int SmithWatermanGotoh = 7;
	//public final static int SmithWatermanGotohWindowedAffine = 11;	
	
	float score=0;
	boolean compute=false;
	String word1;
	String word2;
	
	protected ArrayList<AbstractStringMetric> list = new ArrayList<AbstractStringMetric>();
	protected ArrayList<SimMetricResult> resultList = new ArrayList<SimMetricResult>();

	public StructureSimilarity()
	{
		this.compute=false;
	}
	
	public void compute_Similarity(String s1, String s2){
		
		this.word1=s1;
		this.word2=s2;
		
		StoilosMetric d0 =new StoilosMetric();
		list.add(StoilosMetric,d0);
		
	//	BlockDistance d6 = new BlockDistance();
		//list.add(BlockDistance,d6);
		
	/*	ChapmanLengthDeviation d7 = new ChapmanLengthDeviation();
		list.add(ChapmanLengthDeviation, d7);
		
		ChapmanMatchingSoundex d8 = new ChapmanMatchingSoundex();
		list.add(ChapmanMatchingSoundex, d8);
		
		ChapmanMeanLength d9 = new ChapmanMeanLength();
		list.add(ChapmanMeanLength, d9);
		*/
		
		ChapmanOrderedNameCompoundSimilarity d10= new ChapmanOrderedNameCompoundSimilarity();
		list.add(ChapmanOrderedNameCompoundSimilarity, d10);
		
		//CosineSimilarity d1= new CosineSimilarity();
		//list.add(CosineSimilarity,d1);
		
		//DiceSimilarity d11 = new DiceSimilarity();
		//list.add(DiceSimilarity,d11);
		
		//EuclideanDistance d12= new EuclideanDistance();
		//list.add(EuclideanDistance, d12);
		
		//JaccardSimilarity d13= new JaccardSimilarity();
		//list.add(JaccardSimilarity, d13);
		
		Jaro d2 = new Jaro();
		list.add(Jaro,d2);

		JaroWinkler d3 = new JaroWinkler();
		list.add(JaroWinkler,d3);
		
		Levenshtein d4 = new Levenshtein();
		list.add(Levenshtein,d4);
		
		//MatchingCoefficient d14 = new MatchingCoefficient();
		//list.add(MatchingCoefficient, d14);
		
		NeedlemanWunch d15 = new NeedlemanWunch();
		list.add(NeedlemanWunch, d15);
		
		//OverlapCoefficient d16 = new OverlapCoefficient();
		//list.add(OverlapCoefficient, d16);
		
		QGramsDistance d5 = new QGramsDistance();
		list.add(QGramsDistance,d5);
		
		SmithWatermanGotoh d17 = new SmithWatermanGotoh();
		list.add(SmithWatermanGotoh, d17);
		
	//	SmithWatermanGotohWindowedAffine d18 = new SmithWatermanGotohWindowedAffine();
		//list.add(SmithWatermanGotohWindowedAffine,d18);

		
		for (int i=0; i<list.size();i++)
		{
			resultList.add(new SimMetricResult(list.get(i).getShortDescriptionString(), list.get(i).getSimilarity(s1,s2)));
		}
		
		sort(resultList);
		compute=true;
	}

	/** the class sort the result list*/
	private void sort(ArrayList<SimMetricResult> resultList2) {
		for(int i=0; i<resultList.size()-1;i++)
		{
			int index=i;
			for(int j=i;j<resultList.size();j++)
				if(resultList.get(j).getResult()>resultList.get(index).getResult())
				{
					index=j;
				}
			
			if(index!=i)
			{
				SimMetricResult sr= resultList.get(i);
				resultList.set(i, resultList.get(index));
				resultList.set(index, sr);
			}
		}
	}
	
	
	public float getMaxSimScore()
	{
		float score=0;
		if (!compute) return 0;
		return resultList.get(0).getResult();
	}
	
	public float getMinSimScore(int metricsNumber)
	{
		float score=1.1f;
		if (!compute) return 0;
		
		if(metricsNumber>=resultList.size()||metricsNumber==0)
		{
		for (int i=0; i<resultList.size();i++)
				if (score>resultList.get(i).getResult() && resultList.get(i).getResult()!=0)
					score=resultList.get(i).getResult();
		}
		else
			for (int i=0; i<metricsNumber;i++)
				if (score>resultList.get(i).getResult() && resultList.get(i).getResult()!=0)
					score=resultList.get(i).getResult();
			return score;
		
	}
	
	public float getAverageScore(int metricsNumber)
	{
		float score=0;
		if (!compute) return 0;
		
		
		if(metricsNumber>=resultList.size() || metricsNumber==0)
		{
			for (int i=0; i<resultList.size();i++)
				score+=resultList.get(i).getResult();
			return (score/resultList.size());
		}
		else 
		{
			for (int i=0; i<metricsNumber;i++)
				score+=resultList.get(i).getResult();
			return score/metricsNumber;
		}
	}
	
	/** dump to prompt the best computed result for a given number of metrics*/
	public void printResult(int metricsNumber)
	{
		if(metricsNumber>=resultList.size() || metricsNumber==0)
		for (int i=0; i<resultList.size();i++)
		{
			System.out.println(resultList.get(i).getMetricName()+" : "+resultList.get(i).getResult());
		}
		else
			for (int i=0; i<metricsNumber;i++)
			{
				System.out.println(resultList.get(i).getMetricName()+" : "+resultList.get(i).getResult());
			}
	}
	
	/** return the score of specified metric */
	public float GetScoreOfMetric(int metricName){
		
		AbstractStringMetric sm = list.get(metricName);
		return (float) sm.getSimilarity(word1, word2);
						
	}
	
}
