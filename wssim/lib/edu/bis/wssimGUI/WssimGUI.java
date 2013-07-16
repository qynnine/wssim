package edu.bis.wssimGUI;
/**
 * this is a User interface 
 *@author Tibermacine, Okba 
 * 
 */

import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import javax.swing.Box;
import javax.swing.ButtonGroup;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.JTree;
import javax.swing.ListSelectionModel;
import javax.swing.border.TitledBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableModel;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;

import org.w3c.rdf.model.ModelException;
import org.w3c.rdf.model.Resource;

import com.interdataworking.mm.alg.Match;
import com.interdataworking.mm.alg.Match.PGNode;
import com.jgoodies.forms.layout.CellConstraints;
import com.jgoodies.forms.layout.FormLayout;

import edu.bis.jwsl.SimilarityAssessor;
import edu.bis.schemaSim.Message2Model;
import edu.bis.schemaSim.SF_MessageVsMessage;
import edu.bis.similarity.WebServSimilarityAssessor;
//import edu.bis.wsmodel.OperationInfo;
import edu.bis.wsmodel.*;


public class WssimGUI extends JFrame{
	
	// web similarity assessor
	WebServSimilarityAssessor ws;
	float similarityScore=0;
	
	// boolean computed = false;
	// booleans to deal with list selection
	boolean ws1In =false;
	boolean ws1Out =false;
	boolean ws2In =false;
	boolean ws2Out =false;
	
	// table of web service card
	private DefaultTableModel wstableModel;
	private DefaultTableModel optableModel;
	private DefaultTableModel mstableModel;
	private DefaultTableModel sftableModel;
	private DefaultListModel ws1OperlistModel,ws2OperListModel; 
	private DefaultListModel ws1InMessageListModel,ws2InMessageListModel;
	private DefaultListModel ws1OutMessageListModel,ws2OutMessageListModel; 
	
	// files filter
	private FileNameExtensionFilter wsdlfilter = new FileNameExtensionFilter("WSDL files (wsdl, xml, asmx)", "wsdl","xml","asmx");
	private String defaultPath=".\\";
	
	private	JSplitPane	splitPaneH;
	private JPanel leftPane;
	private JPanel properPane;
	private JPanel progressPanel;
	private JProgressBar progressBar= new JProgressBar();
		
	// buttons
	JButton wsBtn= new JButton("Web Services");
	JButton opBtn= new JButton("Operations");
	JButton msBtn= new JButton("Messages");
	JButton pmBtn= new JButton("Parameters");
	JButton sfBtn= new JButton("SF Messages");
	Color oldColor=null;
	//Selection Buttons Color
	Color newColor= new Color(184,207,229);//171,189,234);
	
	// text fields for Ws locations
	private JTextField ws1Text = new JTextField(30);
	private JTextField ws2Text = new JTextField(30);
	private JPanel centerPanel,cardPanel;
	private CardLayout cardLayout;
	private JPanel northPanel;
	
	private JLabel southtlab=new JLabel();
	
	// ws information
	private JTextField ws1Name;
	private JTextField ws2Name;
	private JFormattedTextField wsSimScore;
	
	// for operation Panel
	private JComboBox op1ComboBox;
	private JTextField op2Name;
	private JTextField opScore;
	private int [][] operationPaires;
	private String [] ws1Operations;
	private String [] ws2Operations;
	private String [] ws1InputMessages;
	private String [] ws1OutputMessages;
	private String [] ws2InputMessages;
	private String [] ws2OutputMessages;
	private float [][] opSimMatrix;
	JList ws1OperationList, ws2OperationList; 
	JList ws1InputMessageList, ws2InputMessageList;
	JList ws1OutputMessageList, ws2OutputMessageList; 
	private JLabel opsMatchingLabel = new JLabel("Matching between");
	private JLabel msMatchingLabel = new JLabel("Matching between");
	
	private float [][] opsNameMatrix;
	private float [][] opsDocMatrix;
	private float [][] opsInMessMatrix;
	private float [][] opsOutMessMatrix;
	private float [][] opsIn_OutMessMatrix;
	private float [][] opsOut_InMessMatrix;
	
	// metric 
	private String semanticMetric = SimilarityAssessor.PIRRO_SECO_METRIC;  // default semantic metric
	private String structuralMetric = WebServSimilarityAssessor.Levenshtein; // default structural metric
	
	// properties 
	JFormattedTextField ws_documentation_weight = new JFormattedTextField(NumberFormat.getNumberInstance(Locale.US));
	JFormattedTextField ws_name_weight = new JFormattedTextField(NumberFormat.getNumberInstance(Locale.US));
	JFormattedTextField ws_operation_weight = new JFormattedTextField(NumberFormat.getNumberInstance(Locale.US));
	JFormattedTextField op_name_weight = new JFormattedTextField(NumberFormat.getNumberInstance(Locale.US));
	JFormattedTextField op_documentation_weight = new JFormattedTextField(NumberFormat.getNumberInstance(Locale.US));
	JFormattedTextField op_message_weight = new JFormattedTextField(NumberFormat.getNumberInstance(Locale.US));
	JFormattedTextField ms_name_weight = new JFormattedTextField(NumberFormat.getNumberInstance(Locale.US));
	JFormattedTextField ms_documentation_weight = new JFormattedTextField(NumberFormat.getNumberInstance(Locale.US));
	JFormattedTextField ms_parameter_weight = new JFormattedTextField(NumberFormat.getNumberInstance(Locale.US));
	
	// the elements in the parameter pane
	JComboBox Ws1_MessageListCBX = new JComboBox();
	JComboBox Ws2_MessageListCBX = new JComboBox();
	ServiceInfo s1=new ServiceInfo();
	ServiceInfo s2=new ServiceInfo();
	DefaultMutableTreeNode tree_Ms1;
	DefaultMutableTreeNode tree_Ms2;
	JTree tree1;
	JTree tree2;
	
	// elements in sf Pane 
	JComboBox sfWs1_MessageListCBX = new JComboBox();
	JComboBox sfWs2_MessageListCBX = new JComboBox();
	
	JComboBox sfForumlaCBX = new JComboBox();
	JComboBox sfFlowGraphTypeCBX = new JComboBox();
	JButton sfExecute = new JButton("Execute");
	JTextField sfScore = new JTextField(10);
	SF_MessageVsMessage sfMatcher= null;
	
	
	public WssimGUI()
	{
		//computed = false;
		// Set BorderLayout with horizontal gap 5 and vertical gap 5
		setLayout(new BorderLayout(15, 15));
		leftPane = new JPanel(new BorderLayout(15, 15)); 
		properPane = new JPanel();
		properPane.setPreferredSize( new Dimension( 200, 300 ) );
        properPane.setMinimumSize( new Dimension( 200, 300 ) );
        properPane.setMaximumSize( new Dimension( 250, 300 ) );
		
		/** North*/
		createNorthPane();
		
		/** Center */
		createCenterPane();
				 
		 /** east */
		createEastPane();
		
		 /** west */
		createWestPane();
		
		 /** south */
		createSouthPane();		
		
		/** properpane*/
		
		createProperPane();
		
		sfForumlaCBX.addItem("FORMULA_FFT");
		sfForumlaCBX.addItem("FORMULA_FTF");
		sfForumlaCBX.addItem("FORMULA_FTT");
		sfForumlaCBX.addItem("FORMULA_TFF");
		sfForumlaCBX.addItem("FORMULA_TFT");
		sfForumlaCBX.addItem("FORMULA_TTF");
		sfForumlaCBX.addItem("FORMULA_TTT");
		
		sfFlowGraphTypeCBX.addItem("FG.PRODUCT");
		sfFlowGraphTypeCBX.addItem("FG.AVG");
		sfFlowGraphTypeCBX.addItem("FG.EQUAL");
		sfFlowGraphTypeCBX.addItem("FG.TOTALP");
		sfFlowGraphTypeCBX.addItem("FG.TOTALS");
		sfFlowGraphTypeCBX.addItem("FG.AVG_TOTALS");
		sfFlowGraphTypeCBX.addItem("FG.STOCHASTIC");
		sfFlowGraphTypeCBX.addItem("FG.INCOMING");
		
		
		splitPaneH = new JSplitPane( JSplitPane.HORIZONTAL_SPLIT );
		splitPaneH.setLeftComponent( properPane);
		splitPaneH.setRightComponent( leftPane );
		
		JScrollPane jsc=new JScrollPane(splitPaneH);
		add(jsc); 
		 
	}
	
	private void createSouthPane() {
		 
		 JPanel southPane = new JPanel();
		 southtlab = new JLabel(" we Put result here ");
		 southPane.add(southtlab);
		 southPane.setBorder(new TitledBorder(" Results "));
		 leftPane.add(southPane, BorderLayout.SOUTH);	
		
	}

	private void createWestPane() {

		 JPanel westPane = new JPanel();
		 JLabel leftlab = new JLabel("                    ");
		 westPane.add(leftlab);
		 //westPane.setBorder(new TitledBorder(""));
		 leftPane.add(westPane, BorderLayout.WEST);
		 
	}

	private void createEastPane() {

		JPanel eastPane = new JPanel();
		 JLabel rightlab = new JLabel("                    ");
		 eastPane.add(rightlab);
		// eastPane.setBorder(new TitledBorder(""));
		 leftPane.add(eastPane, BorderLayout.EAST);
		
	}

	private void createCenterPane() {
				
		 centerPanel = new JPanel(new BorderLayout(10,10));
		// centerPanel.setVisible(false);
		 JPanel buttonsPanelcentre = new JPanel(new GridLayout(1,1));
		// wsBtn= new JButton("Web Services");  global
		 wsBtn.addActionListener(new WsbListner());
		
		 oldColor=wsBtn.getBackground();
		 
		// JButton opBtn= new JButton("Operations");  GLOBAL
		 opBtn.addActionListener(new OpbListner());
		 
		 //JButton msBtn= new JButton("Messages"); GLOBAL
		 msBtn.addActionListener(new MsbListner());
		 
		 pmBtn.addActionListener(new PmbListner());
		 
		 sfBtn.addActionListener(new SfListner());
		 buttonsPanelcentre.add(wsBtn);
		 buttonsPanelcentre.add(opBtn);
		 buttonsPanelcentre.add(msBtn);
		 buttonsPanelcentre.add(pmBtn);
		 buttonsPanelcentre.add(sfBtn);
		 
		 centerPanel.add(buttonsPanelcentre,BorderLayout.SOUTH);
		 
		 cardPanel= new JPanel();
		 cardLayout = new CardLayout();
		 cardPanel.setLayout(cardLayout);
		 		
		 JPanel wsPanel = new JPanel();
		 
		 populateWsPanel(wsPanel);
		 		 
		 wsPanel.setBackground(new Color(241,245,252));
		 cardPanel.add(wsPanel,"Web Services");
		 
		 JPanel opPanel = new JPanel();
		 populateOpPanel(opPanel);
		 
		 opPanel.setBackground(new Color(255,255,255));//238,232,170));
		 cardPanel.add(opPanel,"Operations");
		 
		 JPanel msPanel = new JPanel();
		 populateMsPanel(msPanel);
		// msPanel.setBackground(new Color(171,189,234));//(250,248,204));
		 cardPanel.add(msPanel,"Messages");
		 
		 JPanel pmPanel = new JPanel();
		 populatePmPanel(pmPanel);
		// pmPanel.setBackground(new Color(171,100,234));//(250,248,204));
		 cardPanel.add(pmPanel,"Parameters");
		 
		 JPanel sfPanel = new JPanel();
		 populateSfPanel(sfPanel);
		// pmPanel.setBackground(new Color(171,100,234));//(250,248,204));
		 cardPanel.add(sfPanel,"SFMessages");
		 
		 
		 
		 centerPanel.setBorder(new TitledBorder(""));
		 centerPanel.add(cardPanel,BorderLayout.CENTER);
		 
		 leftPane.add(centerPanel,BorderLayout.CENTER);
	}

	/** Populate WsPanel */
	private void populateWsPanel(JPanel wsPanel) {
		
		Box box = Box.createVerticalBox();
		// layout that contains Ws info
		Box box1 = Box.createHorizontalBox();
		ws1Name = new JTextField(15);
		ws1Name.setHorizontalAlignment(JTextField.CENTER);
		ws1Name.setForeground(new Color(33,124,61));
		//ws1Name.setEditable(false);
		JLabel ws1label = new JLabel("WebService 1 :     ");
		box1.add(ws1label);
		box1.add(ws1Name);
		
		box1.add(Box.createHorizontalStrut(30));
		
		ws2Name = new JTextField(15);
		ws2Name.setHorizontalAlignment(JTextField.CENTER);
		ws2Name.setForeground(new Color(33,124,61));
		//ws2Name.setEditable(false);
		JLabel ws2label = new JLabel("WebService 2 : ");
		box1.add(ws2label);
		box1.add(ws2Name);
		
		// layout that contains score
		Box box2= Box.createHorizontalBox();
		JLabel wsScoreLabel= new JLabel("Similarity Score = ");
		
		wsSimScore = new JFormattedTextField(formatedNumber((float) 0));
		wsSimScore.setHorizontalAlignment(JTextField.CENTER);
		wsSimScore.setForeground(new Color(195,0,0));
		//wsSimScore.setEditable(false);
		box2.add(wsScoreLabel);
		box2.add(wsSimScore);
		box2.add(Box.createHorizontalStrut(288));
		
		// Layout that contains similarity matrix
		
		String[] columnNames = {" ", "Names similarity ", "Operations similarity", "Documentation similarity"};
		// Create table data
		Object[][] data = {{" Weight", "","",""},
							{" Score" }};//formatedNumber(0),formatedNumber(0),formatedNumber(0)}};
		
		wstableModel = new DefaultTableModel(data, columnNames);
		JTable simTable = new JTable(wstableModel);
		simTable.setRowHeight(25);
		
		JScrollPane scrollpane = new JScrollPane(simTable);
		scrollpane.setPreferredSize(new Dimension(100,70));
		
		box.add(Box.createVerticalStrut(40));
		box.add(box1);
		box.add(Box.createVerticalStrut(20));
		box.add(box2);
		box.add(Box.createVerticalStrut(40));
		box.add(scrollpane);
		box.add(Box.createVerticalStrut(40));
		wsPanel.add(box);
		
	}

	/** Populate OpPanel */
	private void populateOpPanel(JPanel opPanel) {
		Box box = Box.createVerticalBox();
		
		// the first level  operation selection
		Box box1=Box.createHorizontalBox();
		JLabel op1label = new JLabel("Select Operation");
		op1label.setMaximumSize(new Dimension(100,20));
		box1.add(op1label);
		box1.add(Box.createHorizontalStrut(10));
		op1ComboBox = new JComboBox();
		op1ComboBox.addActionListener(new Op1CmbListner());
		op1ComboBox.addItem(" ");
		op1ComboBox.setPreferredSize(new Dimension(10,20));
		box1.add(op1ComboBox);
		box1.add(Box.createHorizontalStrut(175)); // to adjust the comboBox
		
		Box box2=Box.createHorizontalBox();
		box2.add(Box.createHorizontalStrut(20));
		JLabel op2label = new JLabel("Best Matching with :");
		box2.add(op2label);
		box2.add(Box.createHorizontalStrut(10));
		op2Name = new JTextField(20);
		op2Name.setEditable(false);
		box2.add(op2Name);
		box2.add(Box.createHorizontalStrut(20));
		
		JLabel op3label = new JLabel("score =");
		box2.add(op3label);
		box2.add(Box.createHorizontalStrut(10));
		opScore= new JTextField(5);
		opScore.setEditable(false);
		box2.add(opScore);
		
		
		// table of the comparison of two operations
		JPanel textPanel = new JPanel();
		textPanel.add(opsMatchingLabel);
		
		Box box3 = Box.createHorizontalBox();
				
		String[] columnNames = {" ", "Names", "Input Message","Output Message" ,"Documentation"};
		// Create table data
		Object[][] data = {{" Weight", "","",""},{" Score" }};
		
		optableModel = new DefaultTableModel(data, columnNames);
		JTable op2Table = new JTable(optableModel);
		op2Table.setRowHeight(25);
		
		JScrollPane scrollpane2 = new JScrollPane(op2Table);
		scrollpane2.setPreferredSize(new Dimension(120,70));
		
		box3.add(scrollpane2);
		
		
		Box box4 = Box.createHorizontalBox();
	    
		Box box41 = Box.createVerticalBox();
		box41.add(new JLabel("                   WebS 1 : Operations List"));
		
		ws1OperlistModel = new DefaultListModel();
		ws2OperListModel = new DefaultListModel();
		ws1OperationList = new JList(ws1OperlistModel);
		ws1OperationList.addListSelectionListener(new ws1OperListSelectionListener());

		ws1OperationList.setFixedCellWidth(180);
		ws1OperationList.setFixedCellHeight(20);
		ws1OperationList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		JScrollPane ws1opSCLBR = new JScrollPane(ws1OperationList);
		box41.add(ws1opSCLBR);
		
		Box box42 = Box.createVerticalBox();
		box42.add(new JLabel("                  WebS 2 : Operations List"));
		
		ws2OperationList = new JList(ws2OperListModel);
		ws2OperationList.addListSelectionListener(new ws2OperListSelectionListener());
		ws2OperationList.setFixedCellWidth(180);
		ws2OperationList.setFixedCellHeight(20);
		ws2OperationList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		JScrollPane ws2opSCLBR = new JScrollPane(ws2OperationList);
		box42.add(ws2opSCLBR);
		
		box4.add(box41);
		box4.add(Box.createHorizontalStrut(20));
		box4.add(box42);
		
		box.add(Box.createVerticalStrut(30));
		box.add(box1);
		box.add(Box.createVerticalStrut(20));
		box.add(box2);
		box.add(Box.createVerticalStrut(60));
		box.add(textPanel);
		box.add(box3);
		box.add(Box.createVerticalStrut(60));
		box.add(box4);
		
		opPanel.add(box);
	}
	
	/** Populate MsPanel*/
	private void populateMsPanel (JPanel msPanel){
		Box box = Box.createVerticalBox();
		
		Box box1 = Box.createHorizontalBox();
	    Box box11 = Box.createVerticalBox();
		box11.add(new JLabel("             WebS 1 : Input Messages List"));
		
		ws1InMessageListModel = new DefaultListModel();
		ws2InMessageListModel= new DefaultListModel();
		
		ws1InputMessageList = new JList(ws1InMessageListModel);
		ws1InputMessageList.addListSelectionListener(new ws1InMessSelectionListener());

		ws1InputMessageList.setFixedCellWidth(170);
		ws1InputMessageList.setFixedCellHeight(15);
		ws1InputMessageList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		JScrollPane ms1InMessSCLBR = new JScrollPane(ws1InputMessageList);
		box11.add(ms1InMessSCLBR);
		
		Box box12 = Box.createVerticalBox();
		box12.add(new JLabel("             WebS 2 : Input Messages List"));
		
		ws2InputMessageList= new JList(ws2InMessageListModel);
		ws2InputMessageList.addListSelectionListener(new ws2InMessSelectionListener());
		ws2InputMessageList.setFixedCellWidth(170);
		ws2InputMessageList.setFixedCellHeight(15);
		ws2InputMessageList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		JScrollPane ms2InMessSCLBR = new JScrollPane(ws2InputMessageList);
		box12.add(ms2InMessSCLBR );
		/**********-*/
		
		box11.add(Box.createVerticalStrut(10));
		box11.add(new JLabel("          WebS 1 : Output Messages List"));
		
		ws1OutMessageListModel = new DefaultListModel();
		ws2OutMessageListModel= new DefaultListModel();
		
		ws1OutputMessageList = new JList(ws1OutMessageListModel);
		ws1OutputMessageList.addListSelectionListener(new ws1OutMessSelectionListener());

		ws1OutputMessageList.setFixedCellWidth(170);
		ws1OutputMessageList.setFixedCellHeight(15);
		ws1OutputMessageList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		JScrollPane ms1OutMessSCLBR = new JScrollPane(ws1OutputMessageList);
		box11.add(ms1OutMessSCLBR );
		
		box12.add(Box.createVerticalStrut(10));
		box12.add(new JLabel("          WebS 2 : Output Messages List"));
		
		ws2OutputMessageList = new JList(ws2OutMessageListModel);
		ws2OutputMessageList.addListSelectionListener(new ws2outMessSelectionListener());
		ws2OutputMessageList.setFixedCellWidth(170);
		ws2OutputMessageList.setFixedCellHeight(15);
		ws2OutputMessageList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		JScrollPane ms2OutMessSCLBR = new JScrollPane(ws2OutputMessageList);
		box12.add(ms2OutMessSCLBR  );
		
		
		box1.add(box11);
		box1.add(Box.createHorizontalStrut(20));
		box1.add(box12);
		
		
		// table of the comparison of two messages
		JPanel textPanel = new JPanel();
		textPanel.add(msMatchingLabel);
		
		Box box3 = Box.createHorizontalBox();
				
		String[] columnNames = {" ", "Names", "Parameters" ,"Documentation"};
		// Create table data
		Object[][] data = {{" Weight", "","",""},{" Score" }};
		
		mstableModel = new DefaultTableModel(data, columnNames);
		JTable ms2Table = new JTable(mstableModel);
		ms2Table.setRowHeight(25);
		
		JScrollPane scrollpane2 = new JScrollPane(ms2Table);
		scrollpane2.setPreferredSize(new Dimension(120,70));
		
		box3.add(scrollpane2);
		

		
		box.add(Box.createVerticalStrut(40));
		box.add(box1);
		box.add(Box.createVerticalStrut(30));
		box.add(textPanel);
		box.add(box3);
		
		
		msPanel.add(box);
	}

	/** populate paraPanel */
	private void populatePmPanel(JPanel pmPanel)
	{
		Box box = Box.createVerticalBox();
		
		Box box1 = Box.createHorizontalBox();
	    
		Box box11 = Box.createVerticalBox();
	    
		box11.add(Box.createVerticalStrut(20));
	    
		box11.add(new JLabel("Service 1 : Messages List "));
	  //  box11.add(Box.createVerticalStrut(10));
	    
	    // ComboBox to store Messages list
	    box11.add(Ws1_MessageListCBX);
	    Ws1_MessageListCBX.addActionListener(new Ws1_MessageListCBXListner()); 
	    Ws1_MessageListCBX.setPreferredSize(new Dimension(180,20));
	    box11.add(Box.createVerticalStrut(20));
			    
	    box11.add(new JLabel("Parameters are :"));
		//box11.add(Box.createVerticalStrut(10));
		
		tree_Ms1 = new DefaultMutableTreeNode("Parameters List");
		tree1= new JTree(tree_Ms1);
		tree1.setVisible(true);
		//tree1.setPreferredSize(new Dimension(80,145));
		JScrollPane treePane1 = new JScrollPane(tree1);
		treePane1.setPreferredSize(new Dimension(80,300));
		box11.add(treePane1);
		
		// second Service
		
		Box box12 = Box.createVerticalBox();
		
		box12.add(Box.createVerticalStrut(20));
	    
		box12.add(new JLabel("Service 2 : Messages List "));
	    //box12.add(Box.createVerticalStrut(10));
	    
	    // ComboBox to store Messages list
	    box12.add(Ws2_MessageListCBX);
	    Ws2_MessageListCBX.addActionListener(new Ws2_MessageListCBXListner()); 
	    Ws2_MessageListCBX.setPreferredSize(new Dimension(180,20));    
	    box12.add(Box.createVerticalStrut(20));
		   
	    box12.add(new JLabel("Parameters are :"));
		//box12.add(Box.createVerticalStrut(10));
		
		
		tree_Ms2 = new DefaultMutableTreeNode("Parameters List");
		tree2= new JTree(tree_Ms2);
		//	tree2.setPreferredSize(new Dimension(80,150));
		
		JScrollPane treePane2 = new JScrollPane(tree2);
		treePane2.setPreferredSize(new Dimension(80,300));
		box12.add(treePane2);
		
		box1.add(box11);
		box1.add(Box.createHorizontalStrut(20));
		box1.add(box12);
		
		box.add(box1);
		pmPanel.add(box);
		
	}
	
	/** populate sfPanel */
	private void populateSfPanel(JPanel sfPanel)
	{
	//TODO : have to complete this section
		
		Box box = Box.createVerticalBox();
		Box box1 = Box.createHorizontalBox();
		JPanel panA= new JPanel(new GridLayout(2,1));
		panA.add(new JLabel("Messages List (web service1)   "));
		
		panA.add(sfWs1_MessageListCBX);
		Dimension dim= new Dimension(230, 25);
		sfWs1_MessageListCBX.setMinimumSize(dim);
		sfWs1_MessageListCBX.setMaximumSize(dim);
		sfWs1_MessageListCBX.setPreferredSize(dim);
		box1.add(panA);
		
		box1.add(Box.createHorizontalStrut(100));
		
		JPanel panB= new JPanel(new GridLayout(2,1));
		panB.add(new JLabel("Messages List (web service2)     "));
		
		panB.add(sfWs2_MessageListCBX);
		sfWs2_MessageListCBX.setMinimumSize(dim);
		sfWs2_MessageListCBX.setMaximumSize(dim);
		sfWs2_MessageListCBX.setPreferredSize(dim);
		box1.add(panB);
		
		// Sf parameters
		
		Box box2 = Box.createHorizontalBox();
		JPanel panC= new JPanel(new GridLayout(2,1));
		panC.add(new JLabel("Select SF Formula"));
		
		panC.add(sfForumlaCBX);
		sfForumlaCBX.setMinimumSize(dim);
		sfForumlaCBX.setMaximumSize(dim);
		sfForumlaCBX.setPreferredSize(dim);
		box2.add(panC);
		
		box2.add(Box.createHorizontalStrut(100));
		
		JPanel panD= new JPanel(new GridLayout(2,1));
		panD.add(new JLabel("Select a Flow Graph Type"));
		
		panD.add(sfFlowGraphTypeCBX);
		sfFlowGraphTypeCBX.setMinimumSize(dim);
		sfFlowGraphTypeCBX.setMaximumSize(dim);
		sfFlowGraphTypeCBX.setPreferredSize(dim);
		box2.add(panD);
		
		// Execution button and sim score 
		
		Box box3 = Box.createHorizontalBox();
		JPanel panE= new JPanel(new GridLayout(2,1));
		panE.add(sfExecute);
		sfExecute.addActionListener(new SfActionListner());
		box3.add(panE);
		box3.add(Box.createHorizontalStrut(10));
		JPanel panF= new JPanel();
		panF.add(new JLabel("score : "));
		panF.add(sfScore);
		sfScore.setPreferredSize(dim);
		box3.add(panF);
		
		
		// now the table of scores 
		
		Box box4 = Box.createHorizontalBox();
		
		String[] columnNames = {"Node A", "Node B", "Similarity","Initial Sim" ,"N0","N1"};
		// Create table data
		Object[][] data = {{" ", "","",""},{" ", "","",""}};
		
		sftableModel = new DefaultTableModel(data, columnNames);
		JTable sf2Table = new JTable(sftableModel);
		sf2Table.setRowHeight(25);
		
		JScrollPane scrollpane = new JScrollPane(sf2Table);
		scrollpane.setPreferredSize(new Dimension(120,250));
		
		box4.add(scrollpane);
		
		box.add(box2);
		box.add(Box.createVerticalStrut(10));
		box.add(box1);
		box.add(Box.createVerticalStrut(40));
		box.add(box3);
		box.add(Box.createVerticalStrut(30));
		box.add(box4);
		sfPanel.add(box);
		
	}
		
	/** NorthPanel*/
	private void createNorthPane() {
		
		JPanel p1 = new JPanel();
		p1.setLayout(new GridLayout(2,1));
		
		JPanel p11 = new JPanel();
		JPanel p12 = new JPanel();
		JLabel ws1Label = new JLabel("Web Service 1 :");
		//ws1Text.setBackground(new Color(254,250,245));
		
		JButton ws1btn = new JButton("....");
		ws1btn.addActionListener(new Ws1btnListner());
		
		JLabel ws2Label = new JLabel("Web Service 2 :");
		
		JButton ws2btn = new JButton("....");
		ws2btn.addActionListener(new Ws2btnListner());
		
		ws1Text.setText("");
		ws2Text.setText("");
		p11.add(ws1Label); p11.add(ws1Text); p11.add(ws1btn);
		p12.add(ws2Label); p12.add(ws2Text); p12.add(ws2btn);
		
		p1.add(p11); p1.add(p12);
		p1.setBorder(new TitledBorder("Web Services Location"));
		
		JPanel p2 = new JPanel();
		JButton btnCompute = new JButton("Compute Similarity");
		btnCompute.addActionListener(new ComputeListner());
		p2.add(btnCompute);
		
		northPanel = new JPanel(new FlowLayout());
		northPanel.add(p1);
		northPanel.add(p2);
		
		leftPane.add(northPanel,BorderLayout.NORTH);
		
	}


	private void createProperPane()
	{
		   JRadioButton rBstr_Cosine_Similarity = new JRadioButton();
		   JRadioButton rBstr_Levenshtein = new JRadioButton();
		   JRadioButton rBstr_Jaccard_Similarity = new JRadioButton();
		   JRadioButton rBstr_Jaro = new JRadioButton();
		   JRadioButton rBstr_SmithWatermanGotoh = new JRadioButton();
		   JRadioButton rBstr_Dice_Similarity = new JRadioButton();
		   JRadioButton rBstr_NeedlemanWunch = new JRadioButton();
		   JRadioButton rBsem_RESNIK_METRIC = new JRadioButton();
		   JRadioButton rBsem_JIANG_METRIC = new JRadioButton();
		   JRadioButton rBsem_LIN_METRIC = new JRadioButton();
		   JRadioButton rBsem_PIRRO_SECO_METRIC = new JRadioButton();
		   ButtonGroup structGroup = new ButtonGroup();
		   ButtonGroup semGroup = new ButtonGroup();
		   
		   
		   /** SEMANTIC METRICS*/
		   JPanel jpanely1 = new JPanel();
		   FormLayout formlayouty1 = new FormLayout("FILL:148PX:NONE","CENTER:25PX:NONE,CENTER:25PX:NONE,CENTER:25PX:NONE,CENTER:25PX:NONE");
		   CellConstraints ccy = new CellConstraints();
		   jpanely1.setLayout(formlayouty1);

		   rBsem_RESNIK_METRIC.setActionCommand("Resnik Metric");
		   rBsem_RESNIK_METRIC.setFont(new Font("Dialog",Font.PLAIN,12));
		   rBsem_RESNIK_METRIC.setName("rBsem_RESNIK_METRIC");
		   rBsem_RESNIK_METRIC.setText("Resnik Metric");
		   semGroup.add(rBsem_RESNIK_METRIC);
		   rBsem_RESNIK_METRIC.setHorizontalAlignment(JRadioButton.RIGHT);
		   rBsem_RESNIK_METRIC.setHorizontalTextPosition(JRadioButton.LEFT);
		   rBsem_RESNIK_METRIC.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
					
						semanticMetric=SimilarityAssessor.RESNIK_METRIC;
					}
				});
			  jpanely1.add(rBsem_RESNIK_METRIC,ccy.xy(1,4));

		   rBsem_JIANG_METRIC.setActionCommand("Jiang Metric");
		   rBsem_JIANG_METRIC.setFont(new Font("Dialog",Font.PLAIN,12));
		   rBsem_JIANG_METRIC.setName("rBsem_JIANG_METRIC");
		   rBsem_JIANG_METRIC.setText("Jiang Metric");
		   semGroup.add(rBsem_JIANG_METRIC);
		   rBsem_JIANG_METRIC.setHorizontalAlignment(JRadioButton.RIGHT);
		   rBsem_JIANG_METRIC.setHorizontalTextPosition(JRadioButton.LEFT);
		   rBsem_JIANG_METRIC.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
					semanticMetric=SimilarityAssessor.JIANG_METRIC;
				}
			});
		    jpanely1.add(rBsem_JIANG_METRIC,ccy.xy(1,2));

		    rBsem_LIN_METRIC.setActionCommand("Lin Metric");
		    rBsem_LIN_METRIC.setFont(new Font("Dialog",Font.PLAIN,12));
		    rBsem_LIN_METRIC.setName("rBsem_LIN_METRIC");
		    rBsem_LIN_METRIC.setText("Lin Metric");
		    semGroup.add(rBsem_LIN_METRIC);
		    rBsem_LIN_METRIC.setHorizontalAlignment(JRadioButton.RIGHT);
		    rBsem_LIN_METRIC.setHorizontalTextPosition(JRadioButton.LEFT);
		    rBsem_LIN_METRIC.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
					
					semanticMetric=SimilarityAssessor.LIN;
				}
			});
		    jpanely1.add(rBsem_LIN_METRIC,ccy.xy(1,3));

		    rBsem_PIRRO_SECO_METRIC.setActionCommand("Pirro_Seco Metric");
		    rBsem_PIRRO_SECO_METRIC.setFont(new Font("Dialog",Font.PLAIN,12));
		    rBsem_PIRRO_SECO_METRIC.setName("rBsem_PIRRO_SECO_METRIC");
		    rBsem_PIRRO_SECO_METRIC.setText("Pirro_Seco Metric");
		    semGroup.add(rBsem_PIRRO_SECO_METRIC);
		    rBsem_PIRRO_SECO_METRIC.setHorizontalAlignment(JRadioButton.RIGHT);
		    rBsem_PIRRO_SECO_METRIC.setHorizontalTextPosition(JRadioButton.LEFT);
		    rBsem_PIRRO_SECO_METRIC.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
					semanticMetric=SimilarityAssessor.RESNIK_METRIC;
				}
			});
		    jpanely1.add(rBsem_PIRRO_SECO_METRIC,ccy.xy(1,1));
     
		    addFillComponents(jpanely1,new int[0],new int[0]);
		    rBsem_PIRRO_SECO_METRIC.setSelected(true);
		   
		   
		   
		   
		  /**STRUCTURAL METRICS*/ 
		 
		   JPanel jpanels1 = new JPanel();
		   FormLayout formlayouts1 = new FormLayout("FILL:150PX:NONE","CENTER:25PX:NONE,CENTER:24PX:NONE,CENTER:25PX:NONE,CENTER:25PX:NONE,CENTER:25PX:NONE,CENTER:25PX:NONE,CENTER:30PX:NONE");
		   CellConstraints ccs = new CellConstraints();
		   jpanels1.setLayout(formlayouts1);

		    rBstr_Cosine_Similarity.setFont(new Font("Dialog",Font.PLAIN,12));
		    rBstr_Cosine_Similarity.setName("rBstr_Cosine_Similarity");
		    rBstr_Cosine_Similarity.setText("Cosine Similarity");
		    structGroup.add(rBstr_Cosine_Similarity);
		    rBstr_Cosine_Similarity.setHorizontalAlignment(JRadioButton.RIGHT);
		    rBstr_Cosine_Similarity.setHorizontalTextPosition(JRadioButton.LEFT);
		    rBstr_Cosine_Similarity.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
				structuralMetric=WebServSimilarityAssessor.Cosine_Similarity;	
				}
			});
		    jpanels1.add(rBstr_Cosine_Similarity,ccs.xy(1,2));

		    rBstr_Levenshtein.setFont(new Font("Dialog",Font.PLAIN,12));
		    rBstr_Levenshtein.setText("Levenshtein");
		    structGroup.add(rBstr_Levenshtein);
		    rBstr_Levenshtein.setHorizontalAlignment(JRadioButton.RIGHT);
		    rBstr_Levenshtein.setHorizontalTextPosition(JRadioButton.LEFT);
		    rBstr_Levenshtein.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
				structuralMetric=WebServSimilarityAssessor.Levenshtein;		
				}
			});
		    jpanels1.add(rBstr_Levenshtein,ccs.xy(1,1));

		    rBstr_Jaccard_Similarity.setFont(new Font("Dialog",Font.PLAIN,12));
		    rBstr_Jaccard_Similarity.setName("rBstr_Jaccard_Similarity");
		    rBstr_Jaccard_Similarity.setText("Jaccard Similarity");
		    structGroup.add(rBstr_Jaccard_Similarity);
		    rBstr_Jaccard_Similarity.setHorizontalAlignment(JRadioButton.RIGHT);
		    rBstr_Jaccard_Similarity.setHorizontalTextPosition(JRadioButton.LEFT);
		    rBstr_Jaccard_Similarity.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
				structuralMetric=WebServSimilarityAssessor.Jaccard_Similarity;				
				}
			});
		    jpanels1.add(rBstr_Jaccard_Similarity,ccs.xy(1,3));
		    
		    rBstr_Jaro.setFont(new Font("Dialog",Font.PLAIN,12));
		    rBstr_Jaro.setName("rBstr_Jaro");
		    rBstr_Jaro.setText("Jaro");
		    structGroup.add(rBstr_Jaro);
		    rBstr_Jaro.setHorizontalAlignment(JRadioButton.RIGHT);
		    rBstr_Jaro.setHorizontalTextPosition(JRadioButton.LEFT);
		    rBstr_Jaro.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
				structuralMetric=WebServSimilarityAssessor.Jaro;				
				}
			});
		    jpanels1.add(rBstr_Jaro,ccs.xy(1,4));

		    rBstr_SmithWatermanGotoh.setFont(new Font("Dialog",Font.PLAIN,12));
		    rBstr_SmithWatermanGotoh.setName("rBstr_SmithWatermanGotoh");
		    rBstr_SmithWatermanGotoh.setText("SmithWatermanGotoh");
		    structGroup.add(rBstr_SmithWatermanGotoh);
		    rBstr_SmithWatermanGotoh.setHorizontalAlignment(JRadioButton.RIGHT);
		    rBstr_SmithWatermanGotoh.setHorizontalTextPosition(JRadioButton.LEFT);
		    rBstr_SmithWatermanGotoh.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
				structuralMetric=WebServSimilarityAssessor.SmithWatermanGotoh;				
				}
			});
		    jpanels1.add(rBstr_SmithWatermanGotoh,ccs.xy(1,7));

		      
		    rBstr_Dice_Similarity.setFont(new Font("Dialog",Font.PLAIN,12));
		    rBstr_Dice_Similarity.setName("rBstr_Dice_Similarity");
		    rBstr_Dice_Similarity.setText("Dice Similarity");
		    structGroup.add(rBstr_Dice_Similarity);
		    rBstr_Dice_Similarity.setHorizontalAlignment(JRadioButton.RIGHT);
		    rBstr_Dice_Similarity.setHorizontalTextPosition(JRadioButton.LEFT);
		    rBstr_Dice_Similarity.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
				structuralMetric=WebServSimilarityAssessor.Dice_Similarity;				
				}
			});
		    jpanels1.add(rBstr_Dice_Similarity,ccs.xy(1,5));

		    rBstr_NeedlemanWunch.setFont(new Font("Dialog",Font.PLAIN,12));
		    rBstr_NeedlemanWunch.setName("rBstr_NeedlemanWunch");
		    rBstr_NeedlemanWunch.setText("NeedlemanWunch");
		    structGroup.add(rBstr_NeedlemanWunch);
		    rBstr_NeedlemanWunch.setHorizontalAlignment(JRadioButton.RIGHT);
		    rBstr_NeedlemanWunch.setHorizontalTextPosition(JRadioButton.LEFT);
		    rBstr_NeedlemanWunch.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent arg0) {
				structuralMetric=WebServSimilarityAssessor.NeedlemanWunch;				
				}
			});
		    jpanels1.add(rBstr_NeedlemanWunch,ccs.xy(1,6));
		    rBstr_Levenshtein.setSelected(true);
		    addFillComponents(jpanels1,new int[0],new int[0]);
		   
		  
		    /**  WEIGHTS **/
		  JPanel jpanel1 = new JPanel();
	      FormLayout formlayout1 = new FormLayout("FILL:90PX:NONE,FILL:15PX:NONE,FILL:47PX:NONE","CENTER:30PX:NONE,CENTER:108PX:NONE,CENTER:30PX:NONE,CENTER:183PX:NONE,CENTER:31PX:NONE,CENTER:25PX:NONE,CENTER:DEFAULT:NONE,CENTER:DEFAULT:NONE,CENTER:DEFAULT:NONE,CENTER:30PX:NONE,CENTER:DEFAULT:NONE,CENTER:DEFAULT:NONE,CENTER:DEFAULT:NONE,CENTER:DEFAULT:NONE,CENTER:30PX:NONE,CENTER:DEFAULT:NONE,CENTER:DEFAULT:NONE,CENTER:DEFAULT:NONE");
	      CellConstraints cc = new CellConstraints();
	      jpanel1.setLayout(formlayout1);

	      JLabel jlabel1 = new JLabel();
	      jlabel1.setFont(new Font("Dialog",Font.PLAIN,12));
	      jlabel1.setText("Names");
	      jpanel1.add(jlabel1,new CellConstraints(1,6,1,1,CellConstraints.RIGHT,CellConstraints.DEFAULT));

	      JLabel jlabel2 = new JLabel();
	      jlabel2.setFont(new Font("Dialog",Font.PLAIN,12));
	      jlabel2.setText("Documentation");
	      jpanel1.add(jlabel2,new CellConstraints(1,7,1,1,CellConstraints.RIGHT,CellConstraints.DEFAULT));

	      JLabel jlabel3 = new JLabel();
	      jlabel3.setFont(new Font("Dialog",Font.PLAIN,12));
	      jlabel3.setText("Operations");
	      jpanel1.add(jlabel3,new CellConstraints(1,8,1,1,CellConstraints.RIGHT,CellConstraints.DEFAULT));

	      ws_documentation_weight.setName("ws_documentation_weight");
	      ws_documentation_weight.setColumns(3);
	      ws_documentation_weight.setVerifyInputWhenFocusTarget(true);
	      ws_documentation_weight.setValue(1);
	      ws_documentation_weight.setHorizontalAlignment(JTextField.CENTER);
	      jpanel1.add(ws_documentation_weight,cc.xy(3,7));

	      ws_name_weight.setName("ws_name_weight");
	      ws_name_weight.setColumns(3);
	      ws_name_weight.setVerifyInputWhenFocusTarget(true);
	      ws_name_weight.setValue(1);
	      ws_name_weight.setHorizontalAlignment(JTextField.CENTER);
	      jpanel1.add(ws_name_weight,cc.xy(3,6));

	      ws_operation_weight.setName("ws_operation_weight");
	      ws_operation_weight.setColumns(3);
	      ws_operation_weight.setVerifyInputWhenFocusTarget(true);
	      ws_operation_weight.setValue(1);
	      ws_operation_weight.setHorizontalAlignment(JTextField.CENTER);
	      jpanel1.add(ws_operation_weight,cc.xy(3,8));

	      JLabel jlabel4 = new JLabel();
	      jlabel4.setFont(new Font("Dialog",Font.BOLD,11));
	      jlabel4.setText("Operations Weights");
	      jpanel1.add(jlabel4,new CellConstraints(1,10,3,1,CellConstraints.CENTER,CellConstraints.DEFAULT));

	      op_name_weight.setName("op_name_weight");
	      op_name_weight.setColumns(3);
		  op_name_weight.setVerifyInputWhenFocusTarget(true);
		  op_name_weight.setValue(1);
		  op_name_weight.setHorizontalAlignment(JTextField.CENTER);
	      jpanel1.add(op_name_weight,cc.xy(3,11));

	      op_documentation_weight.setName("op_documentation_weight");
	      op_documentation_weight.setColumns(3);
	      op_documentation_weight.setVerifyInputWhenFocusTarget(true);
	      op_documentation_weight.setValue(1);
	      op_documentation_weight.setHorizontalAlignment(JTextField.CENTER);
	      jpanel1.add(op_documentation_weight,cc.xy(3,12));

	      op_message_weight.setName("op_message_weight");
	      op_message_weight.setColumns(3);
	      op_message_weight.setVerifyInputWhenFocusTarget(true);
	      op_message_weight.setValue(1);
	      op_message_weight.setHorizontalAlignment(JTextField.CENTER);
	      jpanel1.add(op_message_weight,cc.xy(3,13));

	      JLabel jlabel5 = new JLabel();
	      jlabel5.setFont(new Font("Dialog",Font.PLAIN,12));
	      jlabel5.setText("Messages");
	      jpanel1.add(jlabel5,new CellConstraints(1,13,1,1,CellConstraints.RIGHT,CellConstraints.DEFAULT));

	      JLabel jlabel6 = new JLabel();
	      jlabel6.setFont(new Font("Dialog",Font.PLAIN,12));
	      jlabel6.setText("Documentation");
	      jpanel1.add(jlabel6,new CellConstraints(1,12,1,1,CellConstraints.RIGHT,CellConstraints.DEFAULT));

	      JLabel jlabel7 = new JLabel();
	      jlabel7.setFont(new Font("Dialog",Font.BOLD,11));
	      jlabel7.setText("Messages Weights");
	      jpanel1.add(jlabel7,new CellConstraints(1,15,3,1,CellConstraints.CENTER,CellConstraints.DEFAULT));

	      ms_name_weight.setName("ms_name_weight");
	      ms_name_weight.setColumns(3);
		  ms_name_weight.setVerifyInputWhenFocusTarget(true);
		  ms_name_weight.setValue(1);
		  ms_name_weight.setHorizontalAlignment(JTextField.CENTER);
	      jpanel1.add(ms_name_weight,cc.xy(3,16));

	      ms_documentation_weight.setName("ms_documentation_weight");
	      ms_documentation_weight.setColumns(3);
	      ms_documentation_weight.setVerifyInputWhenFocusTarget(true);
	      ms_documentation_weight.setValue(1);
	      ms_documentation_weight.setHorizontalAlignment(JTextField.CENTER);
	      jpanel1.add(ms_documentation_weight,cc.xy(3,17));

	      ms_parameter_weight.setName("ms_parameter_weight");
	      ms_parameter_weight.setColumns(3);
	      ms_parameter_weight.setVerifyInputWhenFocusTarget(true);
	      ms_parameter_weight.setValue(1);
	      ms_parameter_weight.setHorizontalAlignment(JTextField.CENTER);
	      
		  jpanel1.add(ms_parameter_weight,cc.xy(3,18));

	      JLabel jlabel8 = new JLabel();
	      jlabel8.setFont(new Font("Dialog",Font.PLAIN,12));
	      jlabel8.setText("Names");
	      jpanel1.add(jlabel8,new CellConstraints(1,11,1,1,CellConstraints.RIGHT,CellConstraints.DEFAULT));

	      JLabel jlabel9 = new JLabel();
	      jlabel9.setFont(new Font("Dialog",Font.PLAIN,12));
	      jlabel9.setText("Names");
	      jpanel1.add(jlabel9,new CellConstraints(1,16,1,1,CellConstraints.RIGHT,CellConstraints.DEFAULT));

	      JLabel jlabel10 = new JLabel();
	      jlabel10.setFont(new Font("Dialog",Font.PLAIN,12));
	      jlabel10.setText("Documentation");
	      jpanel1.add(jlabel10,new CellConstraints(1,17,1,1,CellConstraints.RIGHT,CellConstraints.DEFAULT));

	      JLabel jlabel11 = new JLabel();
	      jlabel11.setFont(new Font("Dialog",Font.PLAIN,12));
	      jlabel11.setText("Parameters");
	      jpanel1.add(jlabel11,new CellConstraints(1,18,1,1,CellConstraints.RIGHT,CellConstraints.DEFAULT));

	      JLabel jlabel12 = new JLabel();
	      jlabel12.setFont(new Font("Dialog",Font.BOLD,11));
	      jlabel12.setText("WebService Weights");
	      jpanel1.add(jlabel12,new CellConstraints(1,5,3,1,CellConstraints.CENTER,CellConstraints.DEFAULT));

	      jpanel1.add(jpanels1,new CellConstraints(1,4,3,1,CellConstraints.CENTER,CellConstraints.CENTER));
	      jpanel1.add(jpanely1,new CellConstraints(1,2,3,1,CellConstraints.CENTER,CellConstraints.DEFAULT));
	      JLabel jlabel13 = new JLabel();
	      jlabel13.setFont(new Font("Dialog",Font.BOLD,11));
	      jlabel13.setText("Semantic Metrics");
	      jpanel1.add(jlabel13,new CellConstraints(1,1,3,1,CellConstraints.CENTER,CellConstraints.DEFAULT));

	      JLabel jlabel14 = new JLabel();
	      jlabel14.setFont(new Font("Dialog",Font.BOLD,11));
	      jlabel14.setText("Structural Metrics");
	      jpanel1.add(jlabel14,new CellConstraints(1,3,3,1,CellConstraints.CENTER,CellConstraints.DEFAULT));

	      addFillComponents(jpanel1,new int[]{ 2,3 },new int[]{ 2,4,9,14 });
	      //jpanel1.setBackground(new Color(171,189,234));
	    //  properPane.setBackground(new Color(171,189,234));
				
	      properPane.add(jpanel1);
	     
	      progressPanel = new JPanel(new GridLayout(3,1));
	      progressPanel.setBackground(Color.white);
	      progressPanel.add(new JLabel());
	      progressPanel.add(new JLabel("Computing In progress"));
	      // progressBar.setIndeterminate(true);
	      // progressPanel.add(progressBar);
	      // progressPanel.setVisible(false);
	      
	      properPane.add(progressPanel);
	      
	      
	}
	
	private class Ws1btnListner implements ActionListener {
		public void actionPerformed(ActionEvent e)
		{
			// to choose the location of WSDL 1
			openWs1btn();  

		}
	}
	
	// file Chooser for the first WS1
	private void openWs1btn()
	{
		JFileChooser jFileChooser1 = new JFileChooser(new File(defaultPath));
		
		jFileChooser1.addChoosableFileFilter(wsdlfilter);
		
		jFileChooser1.showOpenDialog(this);
		try{
		ws1Text.setText(jFileChooser1.getSelectedFile().getPath());
		}
		catch (Exception e)
		{
			// Don't do anything !
		}
	}
	
	
	private class Ws2btnListner implements ActionListener {
		public void actionPerformed(ActionEvent e)
		{
			// to choose the location of WSDL 2
			openWs2btn();
		}
	}
	
	private class WsbListner implements ActionListener {
		public void actionPerformed(ActionEvent e)
		{
			cardLayout.show(cardPanel, "Web Services");
			wsBtn.setBackground(newColor);
			opBtn.setBackground(oldColor);
			msBtn.setBackground(oldColor);
			pmBtn.setBackground(oldColor);
			sfBtn.setBackground(oldColor);
		}
	}
	
	private class OpbListner implements ActionListener {
		public void actionPerformed(ActionEvent e)
		{
			cardLayout.show(cardPanel, "Operations");
			opBtn.setBackground(newColor);
			wsBtn.setBackground(oldColor);
			msBtn.setBackground(oldColor);
			pmBtn.setBackground(oldColor);
			sfBtn.setBackground(oldColor);
		}
	}
	
	
	private class MsbListner implements ActionListener {
		public void actionPerformed(ActionEvent e)
		{
			cardLayout.show(cardPanel, "Messages");
			msBtn.setBackground(newColor);
			opBtn.setBackground(oldColor);
			wsBtn.setBackground(oldColor);
			pmBtn.setBackground(oldColor);
			sfBtn.setBackground(oldColor);
		}
	}
	
	private class PmbListner implements ActionListener {
		public void actionPerformed(ActionEvent e)
		{
			cardLayout.show(cardPanel, "Parameters");
			pmBtn.setBackground(newColor);
			opBtn.setBackground(oldColor);
			msBtn.setBackground(oldColor);
			wsBtn.setBackground(oldColor);
			sfBtn.setBackground(oldColor);
		}
	}
	
	private class SfListner implements ActionListener {
		public void actionPerformed(ActionEvent e)
		{
			cardLayout.show(cardPanel, "SFMessages");
			sfBtn.setBackground(newColor);
			pmBtn.setBackground(oldColor);
			opBtn.setBackground(oldColor);
			msBtn.setBackground(oldColor);
			wsBtn.setBackground(oldColor);
		}
	}
	
	
	private class ComputeListner implements ActionListener {
		public void actionPerformed(ActionEvent e)
		{
			progressPanel.setVisible(true);
			if(ws1Text.getText().equals("") || ws2Text.getText().equals(""))
			{
				JOptionPane.showMessageDialog(null, "Please, Choose two Web services description Files ","Selection Error", JOptionPane.INFORMATION_MESSAGE);
			}
			else
			{
				progressPanel.setVisible(true);
				ws = new WebServSimilarityAssessor(ws1Text.getText(),ws2Text.getText());
				ws.setSemanticMetric(semanticMetric);
				ws.setStructuralMetric(structuralMetric);
				
				ws.setWs_NameWeight(Float.valueOf(ws_name_weight.getText()));
				ws.setWs_DocumentationWeight(Float.valueOf(ws_documentation_weight.getText()));
				ws.setWs_OperationSimilarityWeight(Float.valueOf(ws_operation_weight.getText()));
				
				ws.setOp_NameWeight(Float.valueOf(op_name_weight.getText()));
				ws.setOp_DocumentationWeight(Float.valueOf(op_documentation_weight.getText()));
				ws.setOp_MessageSimilarityWeight(Float.valueOf(op_message_weight.getText()));
				
				ws.setMs_NameWeight(Float.valueOf(ms_name_weight.getText()));
				ws.setMs_DocumentationWeight(Float.valueOf(ms_documentation_weight.getText()));
				ws.setMs_parametersSimilarityWeight(Float.valueOf(ms_parameter_weight.getText()));
								
				System.out.println("________________________________________________________________________________________");
				
				long pgstart = System.currentTimeMillis();
				similarityScore = ws.getSimilarityScore();
				long pgend = System.currentTimeMillis();
				southtlab.setText( "Execution time is : "+((long)(pgend-pgstart)/1000)+" sec.");
				
				//computed = true;
				progressPanel.setVisible(false);
				wstableModel.setValueAt(formatedNumber(ws.getWs_NameWeight()), 0, 1);
				wstableModel.setValueAt(formatedNumber(ws.getWs_OperationSimilarityWeight()), 0, 2);
				wstableModel.setValueAt(formatedNumber(ws.getWs_DocumentationWeight()), 0, 3);
				
				wstableModel.setValueAt(formatedNumber(ws.getWs_NameScore()), 1, 1);
				wstableModel.setValueAt(formatedNumber(ws.getWs_OperationSimilarityScore()), 1, 2);
				wstableModel.setValueAt(formatedNumber(ws.getWs_DocumentationScore()), 1, 3);
				
				wsSimScore.setText(formatedNumber(similarityScore));
				ws1Name.setText(ws.getWs1_Name());
				ws2Name.setText(ws.getWs2_Name());
				centerPanel.setVisible(true);
				ws1Operations = ws.getWs1Operations();
				ws2Operations = ws.getWs2Operations();
				operationPaires = ws.getOperationPairs();
				opSimMatrix = ws.getOpSimMatrix();
				op1ComboBox.removeAllItems();
				for( int i=0; i< ws1Operations.length;i++)
				op1ComboBox.addItem(ws1Operations[i]);
				
				//if( allOptableModel.getColumnCount()<=1)
				ws2OperListModel.removeAllElements();
				for (int i=0; i< ws2Operations.length;i++)
					ws2OperListModel.addElement(ws2Operations[i]);
				
				ws1OperlistModel.removeAllElements();
				for( int i=0; i< ws1Operations.length;i++)
					ws1OperlistModel.addElement(ws1Operations[i]);	
				
			   
				ws1InputMessages=ws.get_leftInMessage();
				ws1OutputMessages=ws.get_leftOutMessage();
				ws2InputMessages=ws.get_rightInMessage();
				ws2OutputMessages=ws.get_rightOutMessage();
				
				Ws1_MessageListCBX.removeAllItems();
				sfWs1_MessageListCBX.removeAllItems();
				ws1InMessageListModel.removeAllElements();
				
				for( int i=0; i< ws1InputMessages.length;i++)
				{
					ws1InMessageListModel.addElement(ws1InputMessages[i]);
					Ws1_MessageListCBX.addItem(ws1InputMessages[i]); // for the parameter pane
					sfWs1_MessageListCBX.addItem(ws1InputMessages[i]); // for the sf pane
				}
					
				
				ws1OutMessageListModel.removeAllElements();
				for( int i=0; i< ws1OutputMessages.length;i++){
					ws1OutMessageListModel.addElement(ws1OutputMessages[i]);
					Ws1_MessageListCBX.addItem(ws1OutputMessages[i]); // for the parameter pane
					sfWs1_MessageListCBX.addItem(ws1OutputMessages[i]); // for the sf pane
				}
				
				Ws2_MessageListCBX.removeAllItems();
				sfWs2_MessageListCBX.removeAllItems();
				ws2InMessageListModel.removeAllElements();
				for( int i=0; i< ws2InputMessages.length;i++){
					ws2InMessageListModel.addElement(ws2InputMessages[i]);
					Ws2_MessageListCBX.addItem(ws2InputMessages[i]); // for the parameter pane
					sfWs2_MessageListCBX.addItem(ws2InputMessages[i]); // for the sf pane
				}
				
				ws2OutMessageListModel.removeAllElements();
				for( int i=0; i< ws2OutputMessages.length;i++){
					ws2OutMessageListModel.addElement(ws2OutputMessages[i]);
					Ws2_MessageListCBX.addItem(ws2OutputMessages[i]); // for the parameter pane
					sfWs2_MessageListCBX.addItem(ws2OutputMessages[i]); // for the sf pane
				}
				
				s1=ws.getWebServInfo1();
				s2=ws.getWebServInfo2();
				
				// gather information
				opsNameMatrix=ws.getOpsNameMatrix();
				opsDocMatrix=ws.getOpsDocMatrix();
				opsInMessMatrix=ws.getOpsInMesMatrix();
				opsOutMessMatrix=ws.getOpsOutMesMatrix();
				opsIn_OutMessMatrix=ws.getOpsIn_OutMesMatrix();
				opsOut_InMessMatrix=ws.getOpsOut_InMesMatrix();
				
				System.out.println("________________________________________________________________________________________");
				System.out.println("similarity between the two web services = "+similarityScore);
				System.out.println("________________________________________________________________________________________");

			}
		}
	}
	
	private class Op1CmbListner implements ActionListener {
		public void actionPerformed(ActionEvent e)
		{
			int index=-1;
			
			if(operationPaires!=null){
			for (int i=0; i<operationPaires.length;i++)
			{
				if (op1ComboBox.getSelectedIndex()==operationPaires[i][0])
				{
					index=i; break;
				}
			}
			
			if(index!=-1 && operationPaires[index][1]<ws2Operations.length)
			{
				op2Name.setText(ws2Operations[operationPaires[index][1]]);
				
				if(operationPaires[index][1]<ws2Operations.length)
				{
				opScore.setText(formatedNumber(opSimMatrix[operationPaires[index][0]][operationPaires[index][1]]));
				}
				else
				opScore.setText(formatedNumber(0));
			
			    opsMatchingLabel.setText(op1ComboBox.getSelectedItem().toString()+" / " + ws2Operations[operationPaires[index][1]]);
				
			    optableModel.setValueAt(ws.getOp_NameWeight(), 0, 1);
				optableModel.setValueAt(ws.getOp_MessageSimilarityWeight(), 0, 2);
				optableModel.setValueAt(ws.getOp_MessageSimilarityWeight(), 0, 3);
				optableModel.setValueAt(ws.getOp_DocumentationWeight(), 0, 4);
				
			}
			else
				{
				op2Name.setText("____NO MATCHING FOUND____");
				opScore.setText("");
				opsMatchingLabel.setText("NO MATCHING");
				}
			}
		}
	}
	
	private class Ws1_MessageListCBXListner implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			
			Iterator iter = s1.getOperations();
			while (iter.hasNext()) {
				OperationInfo oper = (OperationInfo) iter.next();
				if (oper.getInputMessageName().equals(Ws1_MessageListCBX.getSelectedItem())){
					// add elements
					
					tree_Ms1.removeAllChildren();
					addTotree(tree_Ms1,oper.getInparametersComplex());
					((DefaultTreeModel)(tree1.getModel())).reload();
					
					break;
				}
				if (oper.getOutputMessageName().equals(Ws1_MessageListCBX.getSelectedItem())){
					// add elements
					tree_Ms1.removeAllChildren();
					addTotree(tree_Ms1,oper.getOutparametersComplex());
					((DefaultTreeModel)(tree1.getModel())).reload();
					break;
				}
			}
		}
	}
	
	private class Ws2_MessageListCBXListner implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			
			Iterator iter = s2.getOperations();
			while (iter.hasNext()) {
				OperationInfo oper = (OperationInfo) iter.next();
				if (oper.getInputMessageName().equals(Ws2_MessageListCBX.getSelectedItem())){
					// add elements
					tree_Ms2.removeAllChildren();
					addTotree(tree_Ms2,oper.getInparametersComplex());
					((DefaultTreeModel)(tree2.getModel())).reload();
					
					break;
				}
				if (oper.getOutputMessageName().equals(Ws2_MessageListCBX.getSelectedItem())){
					// add elements
					tree_Ms2.removeAllChildren();
					addTotree(tree_Ms2,oper.getOutparametersComplex());
					((DefaultTreeModel)(tree2.getModel())).reload();
					break;
				}
			}
		}
	}

	

	private void addTotree(DefaultMutableTreeNode treeMs, List inpsc) {
			
		String strList = null;			
		
		if (inpsc.size() != 0) {
			for (Iterator iterator1 = inpsc.iterator(); iterator1.hasNext();) {
				
				ParameterInfo element = (ParameterInfo) iterator1.next();
				if (element.isComplex())
				{
					strList =element.getName()+" : "+element.getKind();
					DefaultMutableTreeNode sub = new DefaultMutableTreeNode(strList);
					addTotree(sub,(List)element.getSubParameters());
					treeMs.add(sub);
								
				}
				else
				{
					strList=element.getName()+" : "+element.getKind();
					treeMs.add(new DefaultMutableTreeNode(strList));
					
				}
				
			}
		}			
		
	}
	
	
	private void openWs2btn()
	{
		JFileChooser jFileChooser2 = new JFileChooser(new File(defaultPath));
		jFileChooser2.addChoosableFileFilter(wsdlfilter);
		jFileChooser2.showOpenDialog(this);
		try{
			
		ws2Text.setText(jFileChooser2.getSelectedFile().getPath());
		}
		catch (Exception e)
		{
			// don't do anything !
		}
	}
	
	// selection of an Element from op1 list
	private class ws1OperListSelectionListener implements  ListSelectionListener{
		public void valueChanged(ListSelectionEvent e) {
			
			if(ws2OperationList.getSelectedIndex()!=-1)
			{
				opsMatchingLabel.setText("SIM("+ws1OperationList.getSelectedValue()+" / "+ws2OperationList.getSelectedValue()+ ") = "+ formatedNumber(opSimMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]));
				// more table info have to be added here after 
				optableModel.setValueAt(formatedNumber(opsNameMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]), 1, 1);
				optableModel.setValueAt(formatedNumber(opsInMessMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]), 1, 2);
				optableModel.setValueAt(formatedNumber(opsOutMessMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]), 1, 3);
				optableModel.setValueAt(formatedNumber(opsDocMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]), 1, 4);
				optableModel.setValueAt(ws.getOp_NameWeight(), 0, 1);
				optableModel.setValueAt(ws.getOp_MessageSimilarityWeight(), 0, 2);
				optableModel.setValueAt(ws.getOp_MessageSimilarityWeight(), 0, 3);
				optableModel.setValueAt(ws.getOp_DocumentationWeight(), 0, 4);
			}
		}
	}
	
	// selection of an Element from op2 list
	private class ws2OperListSelectionListener implements  ListSelectionListener{
		public void valueChanged(ListSelectionEvent e) {
			if(ws1OperationList.getSelectedIndex()!=-1 && ws2OperationList.getSelectedIndex()!=-1 )
			{
				opsMatchingLabel.setText("SIM("+ws1OperationList.getSelectedValue()+" / "+ws2OperationList.getSelectedValue()+ ") = "+ formatedNumber(opSimMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]));
				// more table info have to be added here after 	
				optableModel.setValueAt(formatedNumber(opsNameMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]), 1, 1);
				optableModel.setValueAt(formatedNumber(opsNameMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]), 1, 1);
				optableModel.setValueAt(formatedNumber(opsInMessMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]), 1, 2);
				optableModel.setValueAt(formatedNumber(opsOutMessMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]), 1, 3);
				optableModel.setValueAt(formatedNumber(opsDocMatrix[ws1OperationList.getSelectedIndex()][ws2OperationList.getSelectedIndex()]), 1, 4);
				
				optableModel.setValueAt(ws.getOp_NameWeight(), 0, 1);
				optableModel.setValueAt(ws.getOp_MessageSimilarityWeight(), 0, 2);
				optableModel.setValueAt(ws.getOp_MessageSimilarityWeight(), 0, 3);
				optableModel.setValueAt(ws.getOp_DocumentationWeight(), 0, 4);
			}
		}
	}
	
	private class ws1InMessSelectionListener implements  ListSelectionListener{
		public void valueChanged(ListSelectionEvent e) {
			
			if(ws1InputMessageList.getSelectedIndex()!=-1)
			{
				ws1In=true;
				if (ws1Out){
					ws1Out=false;
					ws1OutputMessageList.clearSelection();
					msMatchingLabel.setText(" ");
				}
				else
				{
					mstableModel.setValueAt(ws.getMs_NameWeight(), 0, 1);
					mstableModel.setValueAt(ws.getMs_parametersSimilarityWeight(), 0, 2);
					mstableModel.setValueAt(ws.getMs_DocumentationWeight(), 0, 3);
					
					if(ws2In)
					{// case of in in
						
						ws2Out=false;
						ws2OutputMessageList.clearSelection();
						msMatchingLabel.setText( " Sim ("+ ws1InputMessageList.getSelectedValue()+" / "+ws2InputMessageList.getSelectedValue()+" ) = "+
								formatedNumber(opsInMessMatrix[ws1InputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]));
						
						mstableModel.setValueAt(formatedNumber(ws.getMs_InMessages_Name()[ws1InputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 1);
						mstableModel.setValueAt(formatedNumber(ws.getMs_InMessages_Par()[ws1InputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 2);
						mstableModel.setValueAt(formatedNumber(ws.getMs_InMessages_Doc()[ws1InputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 3);
						
					}
					if(ws2Out)
					{
						//case in/out
						
						ws2In=false;
						ws2InputMessageList.clearSelection();
						msMatchingLabel.setText( " Sim ("+ ws1InputMessageList.getSelectedValue()+" / "+ws2OutputMessageList.getSelectedValue()+" ) = "+
								formatedNumber(opsIn_OutMessMatrix[ws1InputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]));
						
						mstableModel.setValueAt(formatedNumber(ws.getMs_InOutMessages_Name()[ws1InputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 1);
						mstableModel.setValueAt(formatedNumber(ws.getMs_InOutMessages_Par()[ws1InputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 2);
						mstableModel.setValueAt(formatedNumber(ws.getMs_InOutMessages_Doc()[ws1InputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 3);
						
					}
				}
							
				//System.err.println("ws1InputMessageList");
			}
		}
	}
	
	private class ws2InMessSelectionListener implements  ListSelectionListener{
		public void valueChanged(ListSelectionEvent e) {
			
			if(ws2InputMessageList.getSelectedIndex()!=-1)
			{
				ws2In=true;
				if (ws2Out){
					ws2Out=false;
					ws2OutputMessageList.clearSelection();
					msMatchingLabel.setText(" ");
				}
				else
				{
					mstableModel.setValueAt(ws.getMs_NameWeight(), 0, 1);
					mstableModel.setValueAt(ws.getMs_parametersSimilarityWeight(), 0, 2);
					mstableModel.setValueAt(ws.getMs_DocumentationWeight(), 0, 3);
					
					if(ws1In)
					{// case of in/In
						
						ws1Out=false;
						ws1OutputMessageList.clearSelection();
						
						msMatchingLabel.setText( " Sim ("+ ws1InputMessageList.getSelectedValue()+" / "+ws2InputMessageList.getSelectedValue()+" ) = "+
								formatedNumber(opsInMessMatrix[ws1InputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]));
					
						mstableModel.setValueAt(formatedNumber(ws.getMs_InMessages_Name()[ws1InputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 1);
						mstableModel.setValueAt(formatedNumber(ws.getMs_InMessages_Par()[ws1InputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 2);
						mstableModel.setValueAt(formatedNumber(ws.getMs_InMessages_Doc()[ws1InputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 3);
						
					}
					if(ws1Out)
					{
						//case out/In
						
						ws1In=false;
						ws1InputMessageList.clearSelection();
						msMatchingLabel.setText( " Sim ("+ ws1OutputMessageList.getSelectedValue()+" / "+ws2InputMessageList.getSelectedValue()+" ) = "+
								formatedNumber(opsOut_InMessMatrix[ws1OutputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]));
						
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutInMessages_Name()[ws1OutputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 1);
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutInMessages_Par()[ws1OutputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 2);
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutInMessages_Doc()[ws1OutputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 3);
						
					}
					
				}
			//	System.err.println("ws2InputMessageList");
			}
		}
	}
	
	private class ws1OutMessSelectionListener implements  ListSelectionListener{
		public void valueChanged(ListSelectionEvent e) {
			
			if(ws1OutputMessageList.getSelectedIndex()!=-1)
			{
				ws1Out=true;
				if (ws1In){
					ws1In=false;
					msMatchingLabel.setText(" ");
					ws1InputMessageList.clearSelection();
			}
			else
			{
					mstableModel.setValueAt(ws.getMs_NameWeight(), 0, 1);
					mstableModel.setValueAt(ws.getMs_parametersSimilarityWeight(), 0, 2);
					mstableModel.setValueAt(ws.getMs_DocumentationWeight(), 0, 3);
					
				if(ws2In)
					{// case of in in
						
						ws2Out=false;
						ws2OutputMessageList.clearSelection();
						msMatchingLabel.setText( " Sim ("+ ws1OutputMessageList.getSelectedValue()+" / "+ws2InputMessageList.getSelectedValue()+" ) = "+
								formatedNumber(opsOut_InMessMatrix[ws1OutputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]));
						
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutInMessages_Name()[ws1OutputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 1);
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutInMessages_Par()[ws1OutputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 2);
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutInMessages_Doc()[ws1OutputMessageList.getSelectedIndex()][ws2InputMessageList.getSelectedIndex()]), 1, 3);
						
					}
					if(ws2Out)
					{
						//case Out/out
						
						ws2In=false;
						ws2InputMessageList.clearSelection();
						
						msMatchingLabel.setText( " Sim ("+ ws1OutputMessageList.getSelectedValue()+" / "+ws2OutputMessageList.getSelectedValue()+" ) = "+
								formatedNumber(opsOutMessMatrix[ws1OutputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]));
						
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutMessages_Name()[ws1OutputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 1);
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutMessages_Par()[ws1OutputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 2);
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutMessages_Doc()[ws1OutputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 3);
						
					}
					
				}
				//System.err.println("ws1OutputMessageList");
			}
		}
	}
	
	private class ws2outMessSelectionListener implements  ListSelectionListener{
		public void valueChanged(ListSelectionEvent e) {
			
			if(ws2OutputMessageList.getSelectedIndex()!=-1)
			{
				ws2Out=true;
				if (ws2In)
				{
					ws2In=false;
					ws2InputMessageList.clearSelection();
					msMatchingLabel.setText(" ");
				}
				else
				{
					mstableModel.setValueAt(ws.getMs_NameWeight(), 0, 1);
					mstableModel.setValueAt(ws.getMs_parametersSimilarityWeight(), 0, 2);
					mstableModel.setValueAt(ws.getMs_DocumentationWeight(), 0, 3);
					
					if(ws1In)
					{// case of in/ out
						
						ws1Out=false;
						ws1OutputMessageList.clearSelection();
						msMatchingLabel.setText( " Sim ("+ ws1InputMessageList.getSelectedValue()+" / "+ws2OutputMessageList.getSelectedValue()+" ) = "+
								formatedNumber(opsIn_OutMessMatrix[ws1InputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]));
						
						mstableModel.setValueAt(formatedNumber(ws.getMs_InOutMessages_Name()[ws1InputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 1);
						mstableModel.setValueAt(formatedNumber(ws.getMs_InOutMessages_Par()[ws1InputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 2);
						mstableModel.setValueAt(formatedNumber(ws.getMs_InOutMessages_Doc()[ws1InputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 3);
						
					}
					if(ws1Out)
					{
						//case Out/out
						
						ws1In=false;
						ws1InputMessageList.clearSelection();
						msMatchingLabel.setText( " Sim ("+ ws1OutputMessageList.getSelectedValue()+" / "+ws2OutputMessageList.getSelectedValue()+" ) = "+
								formatedNumber(opsOutMessMatrix[ws1OutputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]));
						
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutMessages_Name()[ws1OutputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 1);
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutMessages_Par()[ws1OutputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 2);
						mstableModel.setValueAt(formatedNumber(ws.getMs_OutMessages_Doc()[ws1OutputMessageList.getSelectedIndex()][ws2OutputMessageList.getSelectedIndex()]), 1, 3);
					}
					
				}
				//System.err.println("ws2OutputMessageList");
			}
		}
	}
	
	
	private class SfActionListner implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent arg0) {
			
			System.err.println(sfFlowGraphTypeCBX.getSelectedIndex()+1);
			
			if(sfWs1_MessageListCBX.getSelectedItem()!=null &&sfWs2_MessageListCBX.getSelectedItem()!=null)
			{
				Iterator it1=s1.getOperations();
				Iterator it2=s2.getOperations();
				String messageName1=null;
				List parameterlist1=null;
				
				String messageName2=null;
				List parameterlist2=null;
				
				while (it1.hasNext()) {
					
					OperationInfo oper = (OperationInfo) it1.next();
					if(oper.getInputMessageName().equals(sfWs1_MessageListCBX.getSelectedItem()))
					{
						messageName1=oper.getInputMessageName();
						parameterlist1=OperationInfo.complexToFlat(oper.getInparametersComplex());
					}
					else
					{
						messageName1=oper.getOutputMessageName();
						parameterlist1=OperationInfo.complexToFlat(oper.getOutparametersComplex());
					}
					
					if(messageName1!=null) break;
				}
				
				while (it2.hasNext()) {
					
					OperationInfo oper = (OperationInfo) it2.next();
					if(oper.getInputMessageName().equals(sfWs2_MessageListCBX.getSelectedItem()))
					{
						messageName2=oper.getInputMessageName();
						parameterlist2=OperationInfo.complexToFlat(oper.getInparametersComplex());
					}
					else
					{
						messageName2=oper.getOutputMessageName();
						parameterlist2=OperationInfo.complexToFlat(oper.getOutparametersComplex());
					}
					
					if(messageName2!=null) break;
				}
				
				if(messageName1!=null && messageName2!=null)
				{
					sfMatcher= new SF_MessageVsMessage(messageName1,parameterlist1,messageName2,parameterlist2);
					// set the flow graph type
					if(sfFlowGraphTypeCBX.getSelectedIndex()>=0 && sfFlowGraphTypeCBX.getSelectedIndex()<8)
						sfMatcher.setSimFloodFlowGraphType(sfFlowGraphTypeCBX.getSelectedIndex()+1);
					
					// set the formula	
					switch (sfForumlaCBX.getSelectedIndex())
					{
					case 0:
						sfMatcher.setSimFloodFormula(Match.FORMULA_FFT);
						break;
					case 1:
						sfMatcher.setSimFloodFormula(Match.FORMULA_FTF);
						break;
					case 3:
						sfMatcher.setSimFloodFormula(Match.FORMULA_FTT);
						break;
					case 4:
						sfMatcher.setSimFloodFormula(Match.FORMULA_TFF);
						break;
					case 5:
						sfMatcher.setSimFloodFormula(Match.FORMULA_TFT);
						break;
					case 6:
						sfMatcher.setSimFloodFormula(Match.FORMULA_TTF);
						break;
					case 7:
						sfMatcher.setSimFloodFormula(Match.FORMULA_TTT);
						break;
					default: break;
						
					}
					
									
					try {
						sfMatcher.Match();
						sfMatcher.filterResult(Message2Model.node_ParameterIdentifier);
						sfMatcher.printFiltredResult();
						ArrayList<PGNode> result= sfMatcher.getFiltResult();
						
						while(sftableModel.getRowCount()>0)
						{
							sftableModel.removeRow(sftableModel.getRowCount()-1);	
						}
						
						Object [] data=new Object[6];
						for (int i=0; i<result.size();i++)
						{
							PGNode node=result.get(i);
														
							data[0]=((Resource)node.getLeft()).getLocalName();
							data[1]=((Resource)node.getRight()).getLocalName();
							data[2]=formatedNumber((float)node.sim);
							data[3]=formatedNumber((float)node.getSim0());
							data[4]=formatedNumber((float)node.getSimN());
							data[5]=formatedNumber((float)node.getSimN1());
							sftableModel.addRow(data);
							
						}
						
						sfScore.setText(formatedNumber(sfMatcher.getSimilarity(1)));
						
					} catch (ModelException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	
	public static void main(String[] args) {
		JFrame frame = new WssimGUI();
		frame.setTitle("Web Service Similarity");
		frame.setSize(1024,768);
		//frame.pack();
		frame.setLocationRelativeTo(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);
			
	}
	
	 void addFillComponents( Container panel, int[] cols, int[] rows )
	   {
	      Dimension filler = new Dimension(10,10);
	      boolean filled_cell_11 = false;
	      CellConstraints cc = new CellConstraints();
	      if ( cols.length > 0 && rows.length > 0 )
	      {
	         if ( cols[0] == 1 && rows[0] == 1 )
	         {
	            /** add a rigid area  */
	            panel.add( Box.createRigidArea( filler ), cc.xy(1,1) );
	            filled_cell_11 = true;
	         }
	      }

	      for( int index = 0; index < cols.length; index++ )
	      {
	         if ( cols[index] == 1 && filled_cell_11 )
	         {
	            continue;
	         }
	         panel.add( Box.createRigidArea( filler ), cc.xy(cols[index],1) );
	      }

	      for( int index = 0; index < rows.length; index++ )
	      {
	         if ( rows[index] == 1 && filled_cell_11 )
	         {
	            continue;
	         }
	         panel.add( Box.createRigidArea( filler ), cc.xy(1,rows[index]) );
	      }
   }
	
	/** this method formats a number to a desired format*/
	private String formatedNumber(float d) 
	{
		String ret="0";
		NumberFormat numberFormat = NumberFormat.getInstance(Locale.getDefault());
		DecimalFormat decimalFormat = (DecimalFormat)numberFormat;
		decimalFormat.applyPattern("0.###");
		ret =decimalFormat.format(d);
		return ret;
	}
}
