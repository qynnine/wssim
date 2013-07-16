package edu.bis.similarity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.commons.lang.StringUtils;


public class StopwordFilter {
	
	//private static final String DEFAULT_STOPWORDS ="get post service by saopin saopout httpget httppost is a the for then"; 
	private static final String DEFAULT_STOPWORDS =
		 "a abaft able aboard about above according accordingly across actually afore aforesaid after afterwards" +
		 "again against agin ago aint ain't albeit all allow allows almost alone along alongside already also " +
		 "although always am american amid amidst among amongst an and anent another any anybody anyhow anyone " +
		 "anything anyway anyways anywhere apart appear appreciate appropriate are aren't around as a's aside ask " +
		 "asking aslant associated astride at athwart available away awfully b back bar barring be became because " +
		 "become becomes becoming been before beforehand behind being believe below beneath beside besides best " +
		 "better between betwixt beyond both brief but by c came can cannot cant can't cause causes certain " +
		 "certainly changes circa clearly close c'mon co com come comes concerning consequently consider " +
		 "considering contain containing contains corresponding cos could couldn't couldst course c's currently " +
		 "d dare dared daren't dares daring definitely described despite did didn't different directly do does " +
		 "doesn't doing done don't dost doth down downwards during durst e each early edu eg eight either else " +
		 "elsewhere em english enough entirely ere especially et etc even ever every everybody everyone everything " +
		 "everywhere ex exactly example except excepting f failing far few fifth first five followed following " +
		 "follows for former formerly forth four from further furthermore g get gets getting given gives go goes " +
		 "going gone gonna got gotta gotten greetings h had hadn't happens hard hardly has hasn't hast hath have " +
		 "haven't having he he'd he'll hello help hence her here hereafter hereby herein here's hereupon hers " +
		 "herself he's hi high him himself his hither home hopefully how howbeit however how's i i'd ie if " +
		 "ignored ill i'll i'm immediate immediately important in inasmuch inc indeed indicate indicated indicates " +
		 "inner inside insofar instantly instead into inward is isn't it it'd it'll its it's itself i've j just k " +
		 "keep keeps kept know known knows l large last lately later latter latterly least left less lest let " +
		 "let's like liked likely likewise little living long look looking looks ltd m mainly many may maybe mayn't " +
		 "me mean meanwhile merely mid midst might mightn't mine minus more moreover most mostly much must mustn't " +
		 "my myself n namely nd near nearly 'neath necessary need needed needing needn't needs neither never " +
		 "nevertheless new next nigh nigher nighest nine nisi no nobody non none noone no-one nor normally not " +
		 "nothing notwithstanding novel now nowhere o obviously o'er of off often oh ok okay old on once one ones " +
		 "oneself only onto open or other others otherwise ought oughtn't our ours ourselves out outside over " +
		 "overall own p particular particularly past pending per perhaps placed please plus possible present " +
		 "presumably probably provided provides providing public q qua que quite qv r rather rd re real really " +
		 "reasonably regarding regardless regards relatively respecting respectively right round s said same sans " +
		 "save saving saw say saying says second secondly see seeing seem seemed seeming seems seen self selves " +
		 "sensible sent serious seriously seven several shall shalt shan't she shed shell she's short should " +
		 "shouldn't since six small so some somebody somehow someone something sometime sometimes somewhat " +
		 "somewhere soon sorry special specified specify specifying still sub such summat sup supposing sure t " +
		 "take taken tell tends th than thank thanks thanx that that'd that'll thats that's the thee their" +
		 " theirs their's them themselves then thence there thereafter thereby therefore therein theres there's " +
		 "thereupon these they they'd they'll they're they've thine think third this tho thorough thoroughly those " +
		 "thou though three thro' through throughout thru thus thyself till to today together too took touching " +
		 "toward towards tried tries true truly try trying t's 'twas 'tween 'twere twice 'twill 'twixt two 'twould " +
		 "u un under underneath unfortunately unless unlike unlikely until unto up upon us use used useful uses " +
		 "using usually uucp v value various versus very via vice vis-a-vis viz vs w wanna want wanting wants was " +
		 "wasn't way we we'd welcome well we'll went were we're weren't wert we've what whatever what'll what's " +
		 "when whence whencesoever whenever when's where whereafter whereas whereby wherein where's whereupon " +
		 "wherever whether which whichever whichsoever while whilst whither who who'd whoever whole who'll whom " +
		 "whore who's whose whoso whosoever why will willing wish with within without wonder wont won't would " +
		 "wouldn't wouldst x y ye yes yet you you'd you'll your you're you're, yours yourself yourselves you've " +
		 "z zero saopin saopout service get set ";
	
	
	  private Set<String> stopwords = new HashSet<String>();
	  
	  public StopwordFilter() {
	  init();
	  }
	  
	  public StopwordFilter(String[] stopwords) {
		    this.stopwords.addAll(Arrays.asList(stopwords));
		  }
		  
		  public void init() {
		    try
		    {
			  if (stopwords.size() == 0) {
		      String[] stopwordArray = StringUtils.split(DEFAULT_STOPWORDS, " ");
		      stopwords.addAll(Arrays.asList(stopwordArray));
		    }
		    }
		    catch (Exception e)
		    {
		    	System.err.print(e);
		    }
		  }
		  

		  public List<String> filtre(List<String> wordList) {
		    
			  List<String> recognizedwords = new ArrayList<String>();
		   	  for (String st : wordList) {
		        if (!stopwords.contains(StringUtils.lowerCase(st))) {
		             	recognizedwords.add(StringUtils.lowerCase(st));
		             	
		        }
		   	  }
		   	  
		   	  return recognizedwords;
		  }
		  
}
