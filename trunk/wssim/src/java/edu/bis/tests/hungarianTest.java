package edu.bis.tests;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.bis.assignment.HungarianBipartiteMatcher;
import edu.bis.similarity.*;

public class hungarianTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
		String left[]={"a1","a2","a3"};
		String right[]={"b1","b2","b3"};
		float [][]matrix={{11,12,13.5F},{21.9F,22,23F},{31.2F,32,33}};
		HungarianBipartiteMatcher matcher = new HungarianBipartiteMatcher(right, right, matrix);
		System.out.println("score = " + matcher.getScore());
	*/
		
			// TODO Auto-generated method stub
		
		float [][] ScoreTable={{1.0F, 0.5F, 0.3F,0.1F, 0.1F},
							   {1.0F, 1.0F, 0.1F,0 , 0.1F},
							   {0.7F, 0.7F, 1.0F,0.8F, 0.3F},
							   {0.1F, 0, 0.1F,1.0F, 0},
							   {0.1F, 0, 0.1F,0, 1.0F},
								};
		
			Map <String,Integer> typeGroup = new HashMap<String, Integer>();
			
			// 1st group: Integer
			typeGroup.put("integer", 0);
			typeGroup.put("int", 0);
			typeGroup.put("byte", 0);
			typeGroup.put("short", 0);
			typeGroup.put("long", 0);
			
			//2nd group: real
			typeGroup.put("real", 1);
			typeGroup.put("float", 1);
			typeGroup.put("double", 1);
			typeGroup.put("decimal", 1);
			
			//3rd group: String
			typeGroup.put("string", 2);
			typeGroup.put("normalizedstring", 2);
			
			// 4th group: Date
			typeGroup.put("date", 3);
			typeGroup.put("datetime", 3);
			typeGroup.put("duration", 3);
			typeGroup.put("gday", 3);
			typeGroup.put("gmonth", 3);
			typeGroup.put("gmonthday", 3);
			typeGroup.put("gyear", 3);
			typeGroup.put("gyearmonth", 3);
			typeGroup.put("time", 3);
			
			// 5th group: boolean
			typeGroup.put("boolean", 4);
			typeGroup.put("bool", 4);
			
			String type1="int";
			String type2="int";
			float score=0.0F;
			int i=-1;
			int j=-1;
			if(typeGroup.containsKey(type1.toLowerCase()))
				i=typeGroup.get(type1.toLowerCase());
			
			if (typeGroup.containsKey(type2.toLowerCase()))
				j=typeGroup.get(type2.toLowerCase());
			
			if(i!=-1 && j!=-1)
				score=ScoreTable[i][j];
			
			System.out.println(type1+" / "+type2 +" = "+score);
				
				
		
		
	}

}
