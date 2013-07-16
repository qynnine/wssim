package edu.bis.wssimGUI;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JLabel;
import javax.swing.JScrollPane;

import java.awt.Font;
import java.util.ArrayList;

import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import net.miginfocom.swing.MigLayout;

public class SubstitutesGUI extends JFrame {

	private JPanel contentPane;
	private JTable table;
	//private ArrayList <String> substitutes = new ArrayList<String>();
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ArrayList <String> s = new ArrayList();
					s.add("1#2#3#4#5#6#7#8#9");
					s.add("1#2#3#4#5#6#7#8#9");
					s.add("1#2#3#4#5#6#7#8#9");
					SubstitutesGUI frame = new SubstitutesGUI(s);
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
	public SubstitutesGUI(ArrayList <String> substitutes) {
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1092, 647);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		
		JLabel lblListOfPossible = new JLabel("List of possible Substitutes ");
		lblListOfPossible.setFont(new Font("Tahoma", Font.PLAIN, 14));
		
		table = new JTable();
		
		Object [][] data = new Object [substitutes.size()][9];
		for(int i=0;i<substitutes.size();i++)
		{
			String line = substitutes.get(i);
			int f =line.indexOf("#");
			data[i][0]=line.substring(0,f);
			int d=f+1;
			line=line.substring(d,line.length());
			f =line.indexOf("#");
			data[i][1]=line.substring(0,f);
			d=f+1;
			line=line.substring(d,line.length());
			f =line.indexOf("#");
			data[i][2]=line.substring(0,f);
			d=f+1;
			line=line.substring(d,line.length());
			f =line.indexOf("#");
			data[i][3]=line.substring(0,f);
			d=f+1;
			line=line.substring(d,line.length());
			f =line.indexOf("#");
			data[i][4]=line.substring(0,f);
			d=f+1;
			line=line.substring(d,line.length());
			f =line.indexOf("#");
			data[i][5]=line.substring(0,f);
			d=f+1;
			line=line.substring(d,line.length());
			f =line.indexOf("#");
			data[i][6]=Double.parseDouble(line.substring(0,f));
			d=f+1;
			line=line.substring(d,line.length());
			f =line.indexOf("#");
			data[i][7]=Double.parseDouble(line.substring(0,f));
			data[i][8]=Double.parseDouble(line.substring(f+1,line.length()));
			
			
		}
		
		table.setModel(new DefaultTableModel(data,
			new String[] {
				"File 1", "Service", "Operation 1", "File2", "Service 2", "Operation2", "SimScore", "IN SimScore", "Out Sim Score"
			}
		) {
			Class[] columnTypes = new Class[] {
				String.class, String.class, String.class, Object.class, Object.class, Object.class, Object.class, Object.class, Object.class
			};
			public Class getColumnClass(int columnIndex) {
				return columnTypes[columnIndex];
			}
		});
		contentPane.setLayout(new MigLayout("", "[1050.00px]", "[27.00px][512.00px]"));
		contentPane.add(lblListOfPossible, "cell 0 0,alignx left,aligny top");
		contentPane.add(new JScrollPane(table), "cell 0 1,grow");
	}
}
