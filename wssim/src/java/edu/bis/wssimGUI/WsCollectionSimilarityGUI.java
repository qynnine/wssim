package edu.bis.wssimGUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.SystemColor;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
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
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.jgoodies.forms.layout.FormLayout;
import com.jgoodies.forms.layout.ColumnSpec;
import com.jgoodies.forms.factories.FormFactory;
import com.jgoodies.forms.layout.RowSpec;

/**
 * 
 * @author Okba Tibermacine -University of Biskra - Algeria 
 * {@link WsCollectionSimilarityGUI} provides a GUI to assess similarity between a group of services
 *
 */
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
	private ArrayList <String> substitutes = new ArrayList<String>();
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
		panel.setBackground(SystemColor.control);
		contentPane.add(panel, BorderLayout.NORTH);
		
		ws1Text = new JTextField();
		ws1Text.setBackground(SystemColor.control);
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
					 txt_exec.setText(""+String.format("%.3f",duration/1000000000.0));
					 
					 save_result();
				}
				else JOptionPane.showMessageDialog(null, "Select a valid directory");
				
			}
			
		});
		
		JButton Ws1btn = new JButton("...");
		Ws1btn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				openWs1btn();
			}
	
		});
		
		JLabel lblWebService = new JLabel("Collection Path :");
		lblWebService.setHorizontalAlignment(SwingConstants.RIGHT);
		lblWebService.setForeground(SystemColor.activeCaptionText);
		GroupLayout gl_panel = new GroupLayout(panel);
		gl_panel.setHorizontalGroup(
			gl_panel.createParallelGroup(Alignment.TRAILING)
				.addGroup(Alignment.LEADING, gl_panel.createSequentialGroup()
					.addGap(59)
					.addComponent(lblWebService)
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addComponent(ws1Text, GroupLayout.PREFERRED_SIZE, 543, GroupLayout.PREFERRED_SIZE)
					.addGap(18)
					.addComponent(Ws1btn)
					.addGap(42)
					.addComponent(CheckComposBtn, GroupLayout.PREFERRED_SIZE, 158, GroupLayout.PREFERRED_SIZE)
					.addContainerGap(59, Short.MAX_VALUE))
		);
		gl_panel.setVerticalGroup(
			gl_panel.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel.createSequentialGroup()
					.addGap(39)
					.addGroup(gl_panel.createParallelGroup(Alignment.BASELINE)
						.addComponent(Ws1btn, GroupLayout.DEFAULT_SIZE, 38, Short.MAX_VALUE)
						.addComponent(ws1Text, GroupLayout.PREFERRED_SIZE, 29, GroupLayout.PREFERRED_SIZE)
						.addComponent(CheckComposBtn, GroupLayout.PREFERRED_SIZE, 34, GroupLayout.PREFERRED_SIZE)
						.addComponent(lblWebService))
					.addGap(48))
		);
		panel.setLayout(gl_panel);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBackground(SystemColor.control);
		contentPane.add(panel_1, BorderLayout.SOUTH);
		
		JLabel lblWssimToolUniversity = new JLabel("WsSIM @ 2013");
		
		
		GroupLayout gl_panel_1 = new GroupLayout(panel_1);
		gl_panel_1.setHorizontalGroup(
			gl_panel_1.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_1.createSequentialGroup()
					.addContainerGap()
					.addComponent(txtOutput)
					.addGap(880)
					.addComponent(lblWssimToolUniversity)
					.addGap(37))
		);
		gl_panel_1.setVerticalGroup(
			gl_panel_1.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_1.createSequentialGroup()
					.addContainerGap()
					.addGroup(gl_panel_1.createParallelGroup(Alignment.BASELINE)
						.addComponent(txtOutput)
						.addComponent(lblWssimToolUniversity, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
					.addContainerGap())
		);
		panel_1.setLayout(gl_panel_1);
		
		JPanel panel_2 = new JPanel();
		panel_2.setBackground(SystemColor.control);
		contentPane.add(panel_2, BorderLayout.EAST);
		panel_2.setLayout(new FormLayout(new ColumnSpec[] {
				FormFactory.RELATED_GAP_COLSPEC,
				ColumnSpec.decode("max(12dlu;default)"),
				FormFactory.LABEL_COMPONENT_GAP_COLSPEC,
				ColumnSpec.decode("97px"),
				FormFactory.LABEL_COMPONENT_GAP_COLSPEC,
				ColumnSpec.decode("26px"),},
			new RowSpec[] {
				FormFactory.PARAGRAPH_GAP_ROWSPEC,
				RowSpec.decode("22px"),
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,}));
		
		JLabel lblNewLabel = new JLabel("Number of Services");
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		panel_2.add(lblNewLabel, "2, 2, 5, 1");
		lblNewLabel.setBackground(new Color(0, 0, 0));
		lblNewLabel.setForeground(SystemColor.desktop);
		
		txt_numservice = new JTextField();
		panel_2.add(txt_numservice, "4, 4");
		txt_numservice.setHorizontalAlignment(SwingConstants.CENTER);
		txt_numservice.setText("0");
		txt_numservice.setColumns(10);
		
		JLabel lblNumberOfOperations = new JLabel("Number of Operations");
		lblNumberOfOperations.setHorizontalAlignment(SwingConstants.CENTER);
		panel_2.add(lblNumberOfOperations, "1, 8, 6, 1");
		lblNumberOfOperations.setForeground(Color.BLACK);
		lblNumberOfOperations.setBackground(Color.BLACK);
		
		txt_numOperation = new JTextField();
		panel_2.add(txt_numOperation, "4, 10");
		txt_numOperation.setHorizontalAlignment(SwingConstants.CENTER);
		txt_numOperation.setText("0");
		txt_numOperation.setColumns(10);
		
		JLabel lblNumberOfMessages = new JLabel("Number of Messages");
		lblNumberOfMessages.setHorizontalAlignment(SwingConstants.CENTER);
		panel_2.add(lblNumberOfMessages, "2, 14, 5, 1");
		lblNumberOfMessages.setForeground(Color.BLACK);
		lblNumberOfMessages.setBackground(Color.BLACK);
		
		txt_numMessages = new JTextField();
		panel_2.add(txt_numMessages, "4, 16");
		txt_numMessages.setHorizontalAlignment(SwingConstants.CENTER);
		txt_numMessages.setText("0");
		txt_numMessages.setColumns(10);
		
		JLabel lblNumberOfMessage = new JLabel("Number of Paramaters");
		lblNumberOfMessage.setHorizontalAlignment(SwingConstants.CENTER);
		panel_2.add(lblNumberOfMessage, "1, 20, 6, 1");
		lblNumberOfMessage.setForeground(Color.BLACK);
		lblNumberOfMessage.setBackground(Color.BLACK);
		
		txt_numParameters = new JTextField();
		panel_2.add(txt_numParameters, "4, 22");
		txt_numParameters.setHorizontalAlignment(SwingConstants.CENTER);
		txt_numParameters.setText("0");
		txt_numParameters.setColumns(10);
		
		JLabel lblExecutionTime = new JLabel("Execution Time");
		lblExecutionTime.setHorizontalAlignment(SwingConstants.CENTER);
		panel_2.add(lblExecutionTime, "4, 26");
		lblExecutionTime.setForeground(Color.BLACK);
		lblExecutionTime.setBackground(Color.BLACK);
		
		txt_exec = new JTextField();
		panel_2.add(txt_exec, "4, 28");
		txt_exec.setHorizontalAlignment(SwingConstants.CENTER);
		txt_exec.setText("0");
		txt_exec.setColumns(10);
		
		JLabel lblSec = new JLabel("sec");
		panel_2.add(lblSec, "6, 28");
		
		JButton btnClustering = new JButton("Substitutes");
		btnClustering.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				SubstitutesGUI s = new SubstitutesGUI(substitutes);
				s.setVisible(true);
				
			}
		});
		panel_2.add(btnClustering, "4, 32");
		
		
		
			
	}
	
	// Do assessing work
	public void assessCollection(){
	 dir = listWsdls(ws1Text.getText());
		 matrix1 =new float[dir.length][dir.length];
		 matrix2 =new float[dir.length][dir.length];
		 
		 if (dir.length==0)
			 JOptionPane.showMessageDialog(null, "No WSDL files Found in the Directory");
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
		  
		  
		  
		  String folder = ws1Text.getText().substring(ws1Text.getText().lastIndexOf("/")+1,ws1Text.getText().length());
			File file = new File(folder+"OPSIM.txt");
			PrintWriter output = null;
			try {
				output = new PrintWriter(file);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			substitutes.clear();
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
					
			/*		WebServSimilarityAssessor ws2 = new WebServSimilarityAssessor();
					ws.setWebServInfo1(wsdlList.get(i));
					ws.setWebServInfo2(wsdlList.get(j));
					matrix2[i][j]=ws2.getSimilarityScore();
			*/		
					
					// for operations 
					
				for (int x=0; x<ws.getWs1Operations().length;x++)
								for (int y=0;y<ws.getWs2Operations().length;y++)
									if(ws.getOpSimMatrix()[x][y]>0.6 && i!=j)
										{
											output.println(dir[i]+"( "+wsdlList.get(i).getName()+") | "+ws.getWs1Operations()[x]+" # "+dir[j]+"( "+wsdlList.get(j).getName()+") | "+ws.getWs2Operations()[y]+" = "+ws.getOpSimMatrix()[x][y]+" | "+ws.getOpsInMesMatrix()[x][y]+" | "+ws.getOpsOutMesMatrix()[x][y]);
											if (ws.getOpSimMatrix()[x][y]>0.75 &&ws.getOpsInMesMatrix()[x][y]>0.7 && ws.getOpsOutMesMatrix()[x][y]>0.7)
											{
												substitutes.add(dir[i]+"#"+wsdlList.get(i).getName()+"#"+ws.getWs1Operations()[x]+"#"+dir[j]+"#"+wsdlList.get(j).getName()+"#"+ws.getWs2Operations()[y]+"#"+ws.getOpSimMatrix()[x][y]+"#"+ws.getOpsInMesMatrix()[x][y]+"#"+ws.getOpsOutMesMatrix()[x][y]);
											}
										}
						
				}
			}
		  output.close();
		 
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

	/**
	 * Save_results 
	 * -1 in file mean it's blank !
	 */
	private void save_result() {
		
		String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
		String folder = ws1Text.getText().substring(ws1Text.getText().lastIndexOf("/")+1,ws1Text.getText().length());
		
		File file = new File(folder+"AB"+timeStamp+".txt");
		File file2 = new File(folder+"BA"+timeStamp+".txt");
		PrintWriter output;
		PrintWriter output2;
		try {
			output= new PrintWriter(file);
			output2 = new PrintWriter(file2);
			// file header
			for (int i=0;i<dir.length;i++)
			{
				output.print("\t"+dir[i]+"\t");
				output2.print("\t"+dir[i]+"\t");
			}
			output.println();
			output2.println();
			
			
			for (int i=0;i<dir.length;i++)
			{
				output.print(dir[i]+"\t");
				output2.print(dir[i]+"\t");
				
				for (int j=0;j<dir.length;j++)
				{
					output.print(matrix1[i][j]+"\t");
					output2.print(matrix2[i][j]+"\t");
				}
				output.println();
				output2.println();
			}
				
			output.close();
			output2.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
