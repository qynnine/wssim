package edu.bis.tests;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import edu.bis.similarity.StopwordFilter;

public class StopDemo {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

			List <String> words = new ArrayList<String>();
			String[] phrase = StringUtils.split("Technology is the usage and knowledge of tools, techniques, and crafts, or is systems or methods of organization, or is a material product (such as clothing) of these things. The word technology comes from the Greek technología (te???????a) — téchne (t????), 'craft' and -logía (-????a), the study of something, or the branch of knowledge of a discipline", " ");
			words.addAll(Arrays.asList(phrase));
			StopwordFilter filtre = new StopwordFilter();
			words= filtre.filtre(words);
			for (String st : words) {
				System.out.println(st);
			}
			

}
}
