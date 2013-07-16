package edu.bis.wssimGUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.DefaultListModel;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.ListModel;
import javax.swing.border.EmptyBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.JTextField;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.awt.Font;
import javax.swing.JLabel;
import edu.bis.similarity.WebServSimilarityAssessor;
import edu.bis.wsmodel.ComponentBuilder;
import edu.bis.wsmodel.ServiceInfo;
import javax.swing.JTree;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreePath;

import com.jgoodies.forms.layout.FormLayout;
import com.jgoodies.forms.layout.ColumnSpec;
import com.jgoodies.forms.factories.FormFactory;
import com.jgoodies.forms.layout.RowSpec;
import java.awt.SystemColor;
import javax.swing.JTextArea;
import javax.swing.JList;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EtchedBorder;
import javax.swing.AbstractListModel;
import javax.swing.ListSelectionModel;
import javax.swing.UIManager;
import java.awt.Color;
import javax.swing.SwingConstants;

public class ServiceComposability extends JFrame {

	private JPanel contentPane;
	private JTextField ws1Text;
	private JTextField ws2Text;
	private FileNameExtensionFilter wsdlfilter = new FileNameExtensionFilter("WSDL files (wsdl, xml, asmx)", "wsdl","xml","asmx");
	private String defaultPath=".\\WSDL_Collection";
	private JPanel panel_1;
	JTree tree;
	JList<String> list ;
	WebServSimilarityAssessor ws ;
	private JTextField textScore;
	int x;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ServiceComposability frame = new ServiceComposability();
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
	public ServiceComposability() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 921, 459);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(new BorderLayout(0, 0));
		
		JPanel panel = new JPanel();
		contentPane.add(panel, BorderLayout.NORTH);
		
		ws1Text = new JTextField();
		ws1Text.setFont(new Font("Arial", Font.PLAIN, 13));
		ws1Text.setColumns(10);
		
		ws2Text = new JTextField();
		ws2Text.setFont(new Font("Arial", Font.PLAIN, 13));
		ws2Text.setColumns(10);
		
		JButton CheckComposBtn = new JButton("Composability");
		CheckComposBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				// Travail à faire 
				if(ws1Text.getText().equals("") || ws2Text.getText().equals(""))
				{
					JOptionPane.showMessageDialog(null, "Please, Choose two Web services description Files ","Selection Error", JOptionPane.INFORMATION_MESSAGE);
				}
				else
				{
					check_composability();
				}
			}
		});
		
		JButton Ws1btn = new JButton("...");
		Ws1btn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				openWs1btn();
			}
	
		});
		
				
		JButton Ws2btn = new JButton("...");
		Ws2btn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				openWs2btn();
			}
		});
		
		JLabel lblWebService = new JLabel("Web Service 1 :");
		
		JLabel lblWebService_1 = new JLabel("Web Service 2 :");
		GroupLayout gl_panel = new GroupLayout(panel);
		gl_panel.setHorizontalGroup(
			gl_panel.createParallelGroup(Alignment.TRAILING)
				.addGroup(gl_panel.createSequentialGroup()
					.addGap(25)
					.addGroup(gl_panel.createParallelGroup(Alignment.TRAILING)
						.addComponent(lblWebService)
						.addComponent(lblWebService_1, GroupLayout.PREFERRED_SIZE, 92, GroupLayout.PREFERRED_SIZE))
					.addGap(18)
					.addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
						.addComponent(ws1Text, GroupLayout.DEFAULT_SIZE, 543, Short.MAX_VALUE)
						.addComponent(ws2Text, 543, 543, 543))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
						.addComponent(Ws1btn, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
						.addComponent(Ws2btn, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addComponent(CheckComposBtn, GroupLayout.PREFERRED_SIZE, 120, GroupLayout.PREFERRED_SIZE)
					.addGap(31))
		);
		gl_panel.setVerticalGroup(
			gl_panel.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel.createSequentialGroup()
					.addContainerGap(25, Short.MAX_VALUE)
					.addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
						.addGroup(gl_panel.createSequentialGroup()
							.addGroup(gl_panel.createParallelGroup(Alignment.TRAILING, false)
								.addComponent(Ws1btn, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
								.addComponent(ws1Text, GroupLayout.DEFAULT_SIZE, 26, Short.MAX_VALUE))
							.addGap(25)
							.addGroup(gl_panel.createParallelGroup(Alignment.TRAILING, false)
								.addComponent(Ws2btn, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
								.addGroup(gl_panel.createParallelGroup(Alignment.BASELINE)
									.addComponent(ws2Text, GroupLayout.DEFAULT_SIZE, 26, Short.MAX_VALUE)
									.addComponent(lblWebService_1))))
						.addComponent(lblWebService))
					.addGap(19))
				.addGroup(gl_panel.createSequentialGroup()
					.addGap(54)
					.addComponent(CheckComposBtn)
					.addContainerGap(42, Short.MAX_VALUE))
		);
		panel.setLayout(gl_panel);
		
		panel_1 = new JPanel();
		contentPane.add(panel_1, BorderLayout.WEST);
		panel_1.setLayout(new FormLayout(new ColumnSpec[] {
				ColumnSpec.decode("40px"),
				ColumnSpec.decode("177px:grow"),},
			new RowSpec[] {
				RowSpec.decode("39px"),
				FormFactory.PREF_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,}));
		
		JLabel lblWebService_2 = new JLabel("Web Service 1");
		panel_1.add(lblWebService_2, "2, 1");
		
		tree = new JTree();
		tree.setBackground(Color.WHITE);
		tree.setModel(new DefaultTreeModel(
			new DefaultMutableTreeNode("Web Service") {
				/**
				 * 
				 */
				private static final long serialVersionUID = 1L;

				{
					add(new DefaultMutableTreeNode("Operation 1"));
					add(new DefaultMutableTreeNode("Operation 2"));
					add(new DefaultMutableTreeNode("Operation 3"));
				}
			}
		));
		


		panel_1.add(tree, "2, 2, fill, fill");
		
		JPanel panel_2 = new JPanel();
		panel_2.setForeground(new Color(0, 0, 139));
		contentPane.add(panel_2, BorderLayout.CENTER);
		
		list = new JList<String>();
		list.setBackground(new Color(230, 230, 250));
		list.setVisibleRowCount(10);
		list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		list.setLayoutOrientation(JList.HORIZONTAL_WRAP);
		list.setForeground(SystemColor.activeCaptionText);
	/*	list.setModel(new AbstractListModel() {
			String[] values = new String[] {"Line 1", "Line2", "Line 3"};
			public int getSize() {
				return values.length;
			}
			public Object getElementAt(int index) {
				return values[index];
			}
		});*/
		list.setBorder(UIManager.getBorder("FormattedTextField.border"));
		
		textScore = new JTextField();
		textScore.setFont(new Font("Tahoma", Font.BOLD, 13));
		textScore.setForeground(new Color(255, 255, 255));
		textScore.setHorizontalAlignment(SwingConstants.CENTER);
		textScore.setBackground(new Color(0, 206, 209));
		textScore.setColumns(10);
		
		JLabel lblCandidate = new JLabel("Candidate :");
		GroupLayout gl_panel_2 = new GroupLayout(panel_2);
		gl_panel_2.setHorizontalGroup(
			gl_panel_2.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_2.createSequentialGroup()
					.addGap(96)
					.addGroup(gl_panel_2.createParallelGroup(Alignment.LEADING)
						.addComponent(lblCandidate)
						.addComponent(list, GroupLayout.PREFERRED_SIZE, 485, GroupLayout.PREFERRED_SIZE))
					.addContainerGap(95, Short.MAX_VALUE))
				.addGroup(gl_panel_2.createSequentialGroup()
					.addGap(295)
					.addComponent(textScore, GroupLayout.DEFAULT_SIZE, 74, Short.MAX_VALUE)
					.addGap(294))
		);
		gl_panel_2.setVerticalGroup(
			gl_panel_2.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel_2.createSequentialGroup()
					.addContainerGap()
					.addComponent(lblCandidate)
					.addGap(10)
					.addComponent(list, GroupLayout.PREFERRED_SIZE, 111, GroupLayout.PREFERRED_SIZE)
					.addGap(18)
					.addComponent(textScore, GroupLayout.PREFERRED_SIZE, 30, GroupLayout.PREFERRED_SIZE)
					.addContainerGap(85, Short.MAX_VALUE))
		);
		panel_2.setLayout(gl_panel_2);
		
	}
	
	private void openWs1btn(){
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
	
	private void check_composability(){
		 ServiceInfo webServInfo1 = new ServiceInfo();
		 ServiceInfo webServInfo2 = new ServiceInfo();
		 BuildServiceInfo(webServInfo1,ws1Text.getText());
		 BuildServiceInfo(webServInfo2,ws2Text.getText());
		 ws = new WebServSimilarityAssessor();
		 ws.setWebServInfo1(webServInfo1);
		 ws.setWebServInfo2(webServInfo2);
		 ws.getSimilarityScore();
		 
		for (int i=0; i<ws.getWs1Operations().length;i++)
			for (int j=0;j<ws.getWs2Operations().length;j++)
				if (ws.getOpsIn_OutMesMatrix()[i][j]>0.5)
					System.out.println(ws.getWs1Operations()[i]+" - "+ws.getWs2Operations()[j]+" = "+ws.getOpsIn_OutMesMatrix()[i][j]);
	
		DefaultMutableTreeNode dmt = new DefaultMutableTreeNode(ws.getWs1_Name());
		for (int i=0; i<ws.getWs1Operations().length;i++)
			dmt.add(new DefaultMutableTreeNode(ws.getWs1Operations()[i]));
			
		tree.setModel(new DefaultTreeModel(dmt));
		tree.addMouseListener(new MouseAdapter() {
		      public void mouseClicked(MouseEvent me) {
		        doMouseClicked(me);
		      }
		    });
		
		 
	}
	
	void doMouseClicked(MouseEvent me) {
	    TreePath tp = tree.getPathForLocation(me.getX(), me.getY());
	    DefaultListModel<String> listModel= new DefaultListModel<String>();
	    listModel.clear();
	    if (tp != null)
	    {
	    	if (tp.getPathCount()>1){
	    		x=-1;
	    		for (int i=0; i<ws.getWs1Operations().length;i++)
	    			if ( ws.getWs1Operations()[i].equals(tp.getLastPathComponent().toString()))
	    			{
	    				x=i;
	    				break;
	    			}
	    		
	    		listModel.removeAllElements();
	    		if (x!=-1)
	    		{
	    			for (int j=0;j<ws.getWs2Operations().length;j++)
	    			if (ws.getOpsIn_OutMesMatrix()[x][j]>=0.3)
	    			listModel.addElement(ws.getWs2Operations()[j]);
	    			
	    			list.setModel(listModel);
	    			list.addListSelectionListener(new ListSelectionListener() {
						
						@Override
						public void valueChanged(ListSelectionEvent arg0) {
							 if (!arg0.getValueIsAdjusting()) {
								 int y=-1;
								 for (int j=0; j<ws.getWs2Operations().length;j++)
						    			if ( ws.getWs2Operations()[j].equals(list.getSelectedValue().toString()))
						    			{
						    				y=j;
						    				break;
						    			}
				                  if (y!=-1)textScore.setText(String.format("%.2f", ws.getOpsIn_OutMesMatrix()[x][y]));
				                  else 
				                	  textScore.setText("");
				                  
				                }
							
						}
					});
	    			
	    		}	    	
	    		
	    	}
	    }
	    else
	    	System.out.println("");
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

	private void openWs2btn(){
		JFileChooser jFileChooser2 = new JFileChooser(new File(defaultPath));
		
		jFileChooser2.addChoosableFileFilter(wsdlfilter);
		
		jFileChooser2.showOpenDialog(this);
		try{
		ws2Text.setText(jFileChooser2.getSelectedFile().getPath());
		}
		catch (Exception e)
		{
			// Don't do anything !
		}	
		
	}
}
