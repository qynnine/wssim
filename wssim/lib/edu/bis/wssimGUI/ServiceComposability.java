package edu.bis.wssimGUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.table.DefaultTableModel;
import javax.swing.JTextField;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.io.File;
import java.awt.Font;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.border.EtchedBorder;
import javax.swing.UIManager;

public class ServiceComposability extends JFrame {

	private JPanel contentPane;
	private JTextField ws1Text;
	private JTextField ws2Text;
	private FileNameExtensionFilter wsdlfilter = new FileNameExtensionFilter("WSDL files (wsdl, xml, asmx)", "wsdl","xml","asmx");
	private String defaultPath=".\\WSDL_Collection";

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
		setBounds(100, 100, 1057, 720);
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
		
		JButton CheckComposBtn = new JButton("Check Composability");
		CheckComposBtn.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				// Travail à faire 
				
				
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
					.addContainerGap(77, Short.MAX_VALUE)
					.addGroup(gl_panel.createParallelGroup(Alignment.TRAILING)
						.addComponent(lblWebService)
						.addComponent(lblWebService_1, GroupLayout.PREFERRED_SIZE, 92, GroupLayout.PREFERRED_SIZE))
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addGroup(gl_panel.createParallelGroup(Alignment.TRAILING, false)
						.addComponent(ws2Text)
						.addComponent(ws1Text, GroupLayout.DEFAULT_SIZE, 543, Short.MAX_VALUE))
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(gl_panel.createParallelGroup(Alignment.LEADING, false)
						.addComponent(Ws1btn, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
						.addComponent(Ws2btn, GroupLayout.DEFAULT_SIZE, 55, Short.MAX_VALUE))
					.addGap(49)
					.addComponent(CheckComposBtn)
					.addGap(45))
		);
		gl_panel.setVerticalGroup(
			gl_panel.createParallelGroup(Alignment.LEADING)
				.addGroup(gl_panel.createSequentialGroup()
					.addContainerGap()
					.addGroup(gl_panel.createParallelGroup(Alignment.LEADING)
						.addComponent(Ws1btn, GroupLayout.DEFAULT_SIZE, 38, Short.MAX_VALUE)
						.addGroup(gl_panel.createParallelGroup(Alignment.BASELINE)
							.addComponent(ws1Text, GroupLayout.PREFERRED_SIZE, 38, GroupLayout.PREFERRED_SIZE)
							.addComponent(lblWebService)))
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addGroup(gl_panel.createParallelGroup(Alignment.TRAILING)
						.addGroup(gl_panel.createParallelGroup(Alignment.BASELINE)
							.addComponent(ws2Text, GroupLayout.PREFERRED_SIZE, 34, GroupLayout.PREFERRED_SIZE)
							.addComponent(lblWebService_1))
						.addComponent(Ws2btn, GroupLayout.PREFERRED_SIZE, 38, GroupLayout.PREFERRED_SIZE))
					.addGap(19))
				.addGroup(gl_panel.createSequentialGroup()
					.addGap(39)
					.addComponent(CheckComposBtn, GroupLayout.PREFERRED_SIZE, 34, GroupLayout.PREFERRED_SIZE)
					.addContainerGap(48, Short.MAX_VALUE))
		);
		panel.setLayout(gl_panel);
		
		
		String[] columnNames = {" ", "Names similarity ", "Operations similarity", "Documentation similarity"};
		// Create table data
		Object[][] data = {{" Weight", "","",""},
							{" Score" }};//formatedNumber(0),formatedNumber(0),formatedNumber(0)}};
		DefaultTableModel wstableModel = new DefaultTableModel(data, columnNames);
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
