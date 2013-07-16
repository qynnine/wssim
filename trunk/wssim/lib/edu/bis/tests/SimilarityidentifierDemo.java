package edu.bis.tests;

import edu.bis.jwsl.SimilarityAssessor;
import edu.bis.similarity.WebServSimilarityAssessor;

public class SimilarityidentifierDemo {

	/**
	 * we test here the similarity between two identifiers, stop words are removed !
	 * identifiers could be messages parameters, messages names, operation names, web services names ..etc.
	 * @param args
	 * @author Okba TIBERMACINE
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		float score;
		WebServSimilarityAssessor wsim= new WebServSimilarityAssessor();
		score =wsim.computeIdentifierSimilarity("create", "generate");
		System.out.println("create/generate ="  + score); // to be deleted, just for test
		
		/*
		score =wsim.computeIdentifierSimilarity("NotFoundException", "IOException");
		System.out.println("NotFoundException / IOException ="+score); // to be deleted, just for test
		score= wsim.computeIdentifierSimilarity("computeSimilarity", "similarityComp");
		System.out.println("computeSimilarity / similarityComp ="+score); // to be deleted, just for test
		score = wsim.computeIdentifierSimilarity("Captcha", "CaptchaService");
		System.out.println("Captcha / CaptchaService ="+score); // to be deleted, just for test
		score= wsim.computeIdentifierSimilarity("ministry Of Defence ", "DefenceDepartement");
		System.out.println("ministry Of Defence / DefenceDepartement ="+score); // to be deleted, just for test
		score= wsim.computeIdentifierSimilarity("Constraint", "Decision");
		System.out.println("score(choice / Decision ="+score);
		*/
	}

}
