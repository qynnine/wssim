package edu.bis.wssimGUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EmptyBorder;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import java.awt.SystemColor;
import javax.swing.JButton;

public class Test extends JFrame {
	
	Object [][] data;
	String [] headerNames;
	
	private JPanel contentPane;
	private JTable table;
	private JButton btnNewButton;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Test frame = new Test();
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
	public Test() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1359, 710);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		
		table = new JTable();
		table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		table.setBackground(SystemColor.inactiveCaption);
		
		table.setModel(new DefaultTableModel(
			new Object[][] {
				{"1", null, 0.1, 0.2, 0.3, 0.4, 0.49, null, null, null, null,null, null, null,  null},
				{"2", null, 0.6, 0.7, 0.8, 0.9,1, null, null, null, null,null, null, null, null, null},
				{"3", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"4", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"5", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"6", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"7", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"1", null, null, null, null, null, null, null, null, null, null,null, null, null,  null},
				{"2", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"3", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"4", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"5", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"6", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"7", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"1", null, null, null, null, null, null, null, null, null, null,null, null, null,  null},
				{"2", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"3", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"4", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"5", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"6", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"7", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"1", null, null, null, null, null, null, null, null, null, null,null, null, null,  null},
				{"2", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"3", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"4", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"5", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"6", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
				{"7", null, null, null, null, null,null, null, null, null, null,null, null, null, null, null},
			},
			new String[] {
				"A", "B", "C", "D", "E", "F","A", "B", "C", "D", "E", "F","A", "B", "C", "D", "E", "F"
			}
		));
		table.getColumnModel().getColumn(0).setPreferredWidth(50);
		JScrollPane scrollPane= new JScrollPane( table );
		FixedColumnTable fct = new FixedColumnTable(1, scrollPane);
		
				
			contentPane.add(scrollPane, BorderLayout.CENTER);
			
			btnNewButton = new JButton("New button");
			scrollPane.setColumnHeaderView(btnNewButton);
	}
	
public Test(Object [][] data, String[] headerName){
	this.data=data;
	this.headerNames=headerName;
	
	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	setBounds(100, 100, 622, 411);
	contentPane = new JPanel();
	contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
	contentPane.setLayout(new BorderLayout(0, 0));
	setContentPane(contentPane);
	
	table = new JTable();
	table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
	table.setBackground(SystemColor.inactiveCaption);
	
	table.setModel(new DefaultTableModel(data, headerName));
	table.getColumnModel().getColumn(0).setPreferredWidth(50);
	JScrollPane scrollPane= new JScrollPane( table );
	FixedColumnTable fct = new FixedColumnTable(1, scrollPane);

		
	contentPane.add(scrollPane, BorderLayout.CENTER);
	
}
}
