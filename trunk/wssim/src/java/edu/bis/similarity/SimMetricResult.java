package edu.bis.similarity;

public class SimMetricResult {
	
	private String MetricName ="";
	private float result=0;
	
	public SimMetricResult()
	{
		
	}
	public SimMetricResult(String name, float result)
	{
		this.MetricName = name;
		this.result= result;
	}
		
	
	public String getMetricName() {
		return MetricName;
	}
	
	public void setMetricName(String metricName) {
		MetricName = metricName;
	}
	
	public float getResult() {
		return result;
	}
	
	public void setResult(float result) {
		this.result = result;
	}
	
	

}
