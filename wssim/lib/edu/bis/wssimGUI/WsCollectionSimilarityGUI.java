package edu.bis.wssimGUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.SystemColor;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EmptyBorder;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableModel;
import javax.swing.JTextField;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FilenameFilter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.awt.Font;
import javax.swing.JLabel;
import javax.swing.JTable;

import edu.bis.similarity.WebServSimilarityAssessor;
import edu.bis.wsmodel.ComponentBuilder;
import edu.bis.wsmodel.ServiceInfo;
import javax.swing.LayoutStyle.ComponentPlacement;
import java.awt.Color;
import javax.swing.JSeparator;
import javax.swing.SwingConstants;

public class WsCollectionSimilarityGUI extends JFrame {

    float [][] matrix1 ;
	float [][] matrix2 ;
	String[] dir=null;
	ArrayList <ServiceInfo> wsdlList = new ArrayList<ServiceInfo>();
	private JPanel contentPane;
	private JTextField ws1Text;
	private FileNameExtensionFilter wsdlfilter = new FileNameExtensionFilter("WSDL files (wsdl, xml, asmx)", "wsdl","xml","asmx");
	private String defaultPath=".\\";
	
	int numberOfOperation=0;
	int numberOfMessage=0;
	int numberOfMessageParameter=0;
	boolean cnumber =false;
	private JTable table;
	private static DefaultTableModel tableModel;
	JLabel txtOutput = new JLabel("...");
	
	String [][] data={{" ",null}};
	String [] headerNames={"A","B"};
	private JTextField txt_numservice;
	private JTextField txt_numOperation;
	private JTextField txt_numMessages;
	private JTextField txt_numParameters;
	private JTextField txt_exec;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					WsCollectionSimilarityGUI frame = new WsCollectionSimilarityGUI();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public WsCollectionSimilarityGUI() {
		setTitle("Web Service Collection Similarity - WsSim");
		wsdlList.clear();
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1057, 720);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(new BorderLayout(0, 0));
		
		JPanel panel = new JPanel();
		contentPane.add(panel, BorderLayout.NORTH);
		
		ws1Text = new JTextField();
		ws1Text.setBackground(SystemColor.info);
		ws1Text.setFont(new Font("Arial", Font.PLAIN, 13));
		ws1Text.setColumns(10);
		
		JButton CheckComposBtn = new JButton("Compute Similarity");
		CheckComposBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				// Travail à faire 
			
				if(ws1Text.getText().contains(":"))	
				{
					long startTime = System.nanoTime();
					assessCollection();	
					  long endTime = System.nanoTime();

					  long duration = endTime - startTime;
					 txt_exec.setText(""+(duration/1000000000.0));
				}
				
			}
		});
		
		JButton Ws1btn = new JButton("...");
		Ws1btn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				openWs1btn();
			}
	
		});
		
		JLabel lblWebService = new JLabel("Collection Path :");
		lblWebService.setForeground(SystemColor.activeCaptionText);
		GroupLayout gl_panel = new GroupLayout(panel);
		gl_panel.setHorizontalGroup(
			gl_panel.createParallelGroup(Alignment.TRAILING)
				.addGroup(gl_panel.createSequentialGroup()
					.addContainerGap(90, Short.MAX_VALUE)
					.addComponent(lblWebService)
					.addGap(28)
					.addComponent(ws1Text, GroupLayout.PREFERRED_SIZE, 543, GroupLayout.PREFERRED_SIZE)
					.addGap(18)
					.addComponent(Ws1btn)
					.addGap(42)
					.addComponent(CheckComposBtn, GroupLayout.PREFERRED_SIZE, 158, GroupLayout.PREFERRED_SIZE)
					.addContainerGap())
		);
		gl_panel.setVerticalGroup(
			gl_panel.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel.createSequentialGroup()
					.addGap(39)
					.addGroup(gl_panel.createParallelGroup(Alignment.BASELINE)
						.addComponent(Ws1btn, GroupLayout.DEFAULT_SIZE, 38, Short.MAX_VALUE)
						.addComponent(ws1Text, GroupLayout.PREFERRED_SIZE, 29, GroupLayout.PREFERRED_SIZE)
						.addComponent(lblWebService)
						.addComponent(CheckComposBtn, GroupLayout.PREFERRED_SIZE, 34, GroupLayout.PREFERRED_SIZE))
					.addContainerGap(48, Short.MAX_VALUE))
		);
		panel.setLayout(gl_panel);
		
		JPanel panel_1 = new JPanel();
		contentPane.add(panel_1, BorderLayout.SOUTH);
		
		JLabel lblWssimToolUniversity = new JLabel("WSSIM TOOL University of Biskra - ALGERIA");
		
		
		GroupLayout gl_panel_1 = new GroupLayout(panel_1);
		gl_panel_1.setHorizontalGroup(
			gl_panel_1.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_1.createSequentialGroup()
					.addContainerGap()
					.addComponent(txtOutput)
					.addGap(364)
					.addComponent(lblWssimToolUniversity)
					.addGap(389))
		);
		gl_panel_1.setVerticalGroup(
			gl_panel_1.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_1.createSequentialGroup()
					.addContainerGap()
					.addGroup(gl_panel_1.createParallelGroup(Alignment.LEADING)
						.addComponent(txtOutput)
						.addComponent(lblWssimToolUniversity))
					.addContainerGap(GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
		);
		panel_1.setLayout(gl_panel_1);
		
		JPanel panel_Stat = new JPanel();
		panel_Stat.setBackground(SystemColor.control);
		contentPane.add(panel_Stat, BorderLayout.EAST);
		
		JLabel lblNewLabel = new JLabel("Number of Services");
		lblNewLabel.setBackground(new Color(0, 0, 0));
		lblNewLabel.setForeground(SystemColor.desktop);
		
		JLabel lblNumberOfOperations = new JLabel("Number of Operations");
		lblNumberOfOperations.setForeground(Color.BLACK);
		lblNumberOfOperations.setBackground(Color.BLACK);
		
		JLabel lblNumberOfMessages = new JLabel("Number of Messages");
		lblNumberOfMessages.setForeground(Color.BLACK);
		lblNumberOfMessages.setBackground(Color.BLACK);
		
		JLabel lblNumberOfMessage = new JLabel("Number of Paramaters");
		lblNumberOfMessage.setForeground(Color.BLACK);
		lblNumberOfMessage.setBackground(Color.BLACK);
		
		txt_numservice = new JTextField();
		txt_numservice.setHorizontalAlignment(SwingConstants.CENTER);
		txt_numservice.setText("0");
		txt_numservice.setColumns(10);
		
		txt_numOperation = new JTextField();
		txt_numOperation.setHorizontalAlignment(SwingConstants.CENTER);
		txt_numOperation.setText("0");
		txt_numOperation.setColumns(10);
		
		txt_numMessages = new JTextField();
		txt_numMessages.setHorizontalAlignment(SwingConstants.CENTER);
		txt_numMessages.setText("0");
		txt_numMessages.setColumns(10);
		
		txt_numParameters = new JTextField();
		txt_numParameters.setHorizontalAlignment(SwingConstants.CENTER);
		txt_numParameters.setText("0");
		txt_numParameters.setColumns(10);
		
		JLabel lblExecutionTime = new JLabel("Execution Time");
		lblExecutionTime.setForeground(Color.BLACK);
		lblExecutionTime.setBackground(Color.BLACK);
		
		txt_exec = new JTextField();
		txt_exec.setHorizontalAlignment(SwingConstants.CENTER);
		txt_exec.setText("0");
		txt_exec.setColumns(10);
		
		JLabel lblSec = new JLabel("sec");
		
		JButton btnClustering = new JButton("Clustering");
		
		GroupLayout gl_panel_Stat = new GroupLayout(panel_Stat);
		gl_panel_Stat.setHorizontalGroup(
			gl_panel_Stat.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_Stat.createSequentialGroup()
					.addGap(23)
					.addComponent(lblNewLabel)
					.addContainerGap(24, Short.MAX_VALUE))
				.addGroup(gl_panel_Stat.createSequentialGroup()
					.addGap(28)
					.addComponent(txt_numservice, GroupLayout.DEFAULT_SIZE, 103, Short.MAX_VALUE)
					.addGap(28))
				.addGroup(Alignment.TRAILING, gl_panel_Stat.createSequentialGroup()
					.addContainerGap(37, Short.MAX_VALUE)
					.addComponent(lblExecutionTime)
					.addGap(35))
				.addGroup(Alignment.TRAILING, gl_panel_Stat.createSequentialGroup()
					.addContainerGap(23, Short.MAX_VALUE)
					.addGroup(gl_panel_Stat.createParallelGroup(Alignment.LEADING, false)
						.addGroup(Alignment.TRAILING, gl_panel_Stat.createSequentialGroup()
							.addComponent(txt_exec, 0, 0, Short.MAX_VALUE)
							.addPreferredGap(ComponentPlacement.RELATED)
							.addComponent(lblSec)
							.addGap(13))
						.addGroup(Alignment.TRAILING, gl_panel_Stat.createSequentialGroup()
							.addComponent(btnClustering, GroupLayout.PREFERRED_SIZE, 124, GroupLayout.PREFERRED_SIZE)
							.addContainerGap())))
				.addGroup(Alignment.TRAILING, gl_panel_Stat.createSequentialGroup()
					.addContainerGap(17, Short.MAX_VALUE)
					.addGroup(gl_panel_Stat.createParallelGroup(Alignment.LEADING, false)
						.addComponent(lblNumberOfMessage)
						.addGroup(gl_panel_Stat.createSequentialGroup()
							.addGap(10)
							.addComponent(txt_numParameters, 0, 0, Short.MAX_VALUE)
							.addGap(16)))
					.addContainerGap())
				.addGroup(gl_panel_Stat.createSequentialGroup()
					.addContainerGap()
					.addGroup(gl_panel_Stat.createParallelGroup(Alignment.LEADING)
						.addGroup(gl_panel_Stat.createSequentialGroup()
							.addComponent(lblNumberOfMessages)
							.addPreferredGap(ComponentPlacement.RELATED, 2, GroupLayout.PREFERRED_SIZE))
						.addGroup(gl_panel_Stat.createSequentialGroup()
							.addGap(13)
							.addComponent(txt_numMessages, GroupLayout.PREFERRED_SIZE, 109, GroupLayout.PREFERRED_SIZE)))
					.addContainerGap(25, Short.MAX_VALUE))
				.addGroup(gl_panel_Stat.createSequentialGroup()
					.addContainerGap()
					.addGroup(gl_panel_Stat.createParallelGroup(Alignment.LEADING)
						.addGroup(gl_panel_Stat.createSequentialGroup()
							.addGap(17)
							.addComponent(txt_numOperation, GroupLayout.DEFAULT_SIZE, 101, Short.MAX_VALUE)
							.addGap(10))
						.addComponent(lblNumberOfOperations, GroupLayout.DEFAULT_SIZE, 128, Short.MAX_VALUE))
					.addGap(19))
		);
		gl_panel_Stat.setVerticalGroup(
			gl_panel_Stat.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_Stat.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblNewLabel)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(txt_numservice, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
					.addGap(32)
					.addComponent(lblNumberOfOperations)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(txt_numOperation, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED, 31, Short.MAX_VALUE)
					.addComponent(lblNumberOfMessages)
					.addGap(12)
					.addComponent(txt_numMessages, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
					.addGap(27)
					.addComponent(lblNumberOfMessage, GroupLayout.PREFERRED_SIZE, 24, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addComponent(txt_numParameters, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
					.addGap(31)
					.addComponent(lblExecutionTime, GroupLayout.PREFERRED_SIZE, 24, GroupLayout.PREFERRED_SIZE)
					.addGap(13)
					.addGroup(gl_panel_Stat.createParallelGroup(Alignment.BASELINE)
						.addComponent(txt_exec, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addComponent(lblSec))
					.addGap(37)
					.addComponent(btnClustering, GroupLayout.PREFERRED_SIZE, 39, GroupLayout.PREFERRED_SIZE)
					.addGap(36))
		);
		panel_Stat.setLayout(gl_panel_Stat);
		
		
		
			
	}
	
	// Do assessing work
	public void assessCollection(){
	 dir = listWsdls(ws1Text.getText());
		 matrix1 =new float[dir.length][dir.length];
		 matrix2 =new float[dir.length][dir.length];
		 System.out.println(dir.length);
		 for(int i=0;i<dir.length;i++){
			 ServiceInfo webServInfo = new ServiceInfo();
			 BuildServiceInfo(webServInfo,ws1Text.getText()+"//"+dir[i]);
			 wsdlList.add(webServInfo);
			 txtOutput.setText("Parsing : "+ws1Text.getText()+"//"+dir[i]);
			 
		 }
		  txtOutput.setText("Parsing Done ...\n");
		  
		    // computation of similarities
		  numberOfOperation=0;
		  numberOfMessage=0;
		  numberOfMessageParameter=0;
		  cnumber =false;
		  
		  for (int i=0; i<dir.length; i++)
			{
				cnumber =true;
				for (int j=i;j<dir.length;j++)
				{
					
					WebServSimilarityAssessor ws = new WebServSimilarityAssessor();
					ws.setWebServInfo1(wsdlList.get(i));
					ws.setWebServInfo2(wsdlList.get(j));
					matrix1[i][j]=ws.getSimilarityScore();
					matrix1[j][i]=-1;
					if(cnumber) {
						numberOfOperation += ws.getWs1Operations().length;
						numberOfMessage+=ws.get_leftInMessage().length+ws.get_leftOutMessage().length;
						if (ws.getMs_InOutMessages_Par()!=null )
						numberOfMessageParameter+=ws.getMs_InOutMessages_Par().length * ws.getMs_InOutMessages_Par()[0].length;
						cnumber=false;
					}
					
					WebServSimilarityAssessor ws2 = new WebServSimilarityAssessor();
					ws.setWebServInfo1(wsdlList.get(i));
					ws.setWebServInfo2(wsdlList.get(j));
					matrix2[i][j]=ws2.getSimilarityScore();
					
				}
			}
		 
		  txt_numservice.setText(""+dir.length);
		  txt_numOperation.setText(""+numberOfOperation);
		  txt_numMessages.setText(""+numberOfMessage);
		  txt_numParameters.setText(""+numberOfMessageParameter);
		  populateDataModel();
	}
	
	// convert the matrix to Data
	private void populateDataModel() {
		
		table = new JTable();
		table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		table.setBackground(SystemColor.inactiveCaption);
		data = new String[dir.length][dir.length+1];
		
		String [] head = new String[dir.length+1];
		head[0]=" ";
		for (int i=1;i<=dir.length;i++)
			head[i]=dir[i-1];
		 DecimalFormat df = new DecimalFormat("#.##");
		for (int i=0;i<dir.length;i++){
			data[i][0]=dir[i];
			for (int j=0;j<dir.length;j++)
				if(matrix1[i][j]!=-1)
				data[i][j+1]=(String.format("%.2f", matrix1[i][j])).replace(",", ".");
				else
					data[i][j+1]=" ";
				//df.format();
		}
		
		
		table.setModel(new DefaultTableModel(data, head));
	
		if (table.getColumnCount()>0) 
			table.getColumnModel().getColumn(0).setPreferredWidth(50);
		
	//	table.setVisibleColumnCount(40);
		
		JScrollPane scrollPane= new JScrollPane( table );
		FixedColumnTable fct = new FixedColumnTable(1, scrollPane);
		
		contentPane.add(scrollPane, BorderLayout.CENTER);
		System.out.println(dir.length);
	}

	protected void BuildServiceInfo(ServiceInfo serviceinfo, String wsdlLocation )
	{
		try
		{
		ComponentBuilder builder = new ComponentBuilder();
		String wsdllocation = wsdlLocation;
		serviceinfo.setWsdllocation(wsdllocation);
		serviceinfo = builder.buildserviceinformation(serviceinfo);
		
		}
		catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
	
	private void openWs1btn(){
		JFileChooser jFileChooser1 = new JFileChooser(new File(defaultPath));
		jFileChooser1.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		
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
	
		public static String[] listWsdls(String folderPath)
	{
		String[] dir = new java.io.File(folderPath).list(new OnlyWsdls());
		java.util.Arrays.sort(dir); 
		
		return dir;
	}
}


/** This class implements the FilenameFilter interface.
* The Accepted method only returns true for .wsdl and .XML, .asmx files.
*/
class OnlyWsdls implements FilenameFilter {
	public boolean accept(File dir, String s) {
		if (s.endsWith(".wsdl") || s.endsWith(".xml") ||s.endsWith(".asmx"))
			return true;

		return false;
	}
}
