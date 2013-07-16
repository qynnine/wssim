package edu.bis.tagger;

import java.io.IOException;

import edu.stanford.nlp.tagger.maxent.MaxentTagger;

public class TreeTagging {

	private String text;
	private String taggedText;
	MaxentTagger tagger = new MaxentTagger("lib/taggers/english-bidirectional-distsim.tagger");
	
	public String tagText(String text)throws IOException,ClassNotFoundException{
		this.text=text;
		taggedText = tagger.tagString(this.text);
		return taggedText;
	}
	
	public static void main(String[] args) throws ClassNotFoundException, IOException {
		
	String sample ="get weather by place name";
	TreeTagging tt = new TreeTagging();
	
	
	System.out.println(tt.tagText(sample));
	sample ="get weather by zip code";
	System.out.println(tt.tagText(sample));
	
	}

}
