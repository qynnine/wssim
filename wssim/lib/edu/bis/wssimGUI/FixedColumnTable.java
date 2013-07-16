package edu.bis.wssimGUI;

import java.awt.Color;
import java.awt.Component;
import java.awt.Point;
import java.awt.event.MouseEvent;
import java.beans.*;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.swing.*;
import javax.swing.event.*;
import javax.swing.table.*;


public class FixedColumnTable implements ChangeListener, PropertyChangeListener
{
	private JTable main;
	private JTable fixed;
	private JScrollPane scrollPane;

	public FixedColumnTable(int fixedColumns, JScrollPane scrollPane) {
		
			this.scrollPane = scrollPane;

			main = ((JTable)scrollPane.getViewport().getView());
			main.setAutoCreateColumnsFromModel( false );
			main.addPropertyChangeListener( this );
			main.setBackground(new Color(255,255,255));

			//  Use the existing table to create a new table sharing
			//  the DataModel and ListSelectionModel

			int totalColumns = main.getColumnCount();

			fixed = new JTable();
			fixed.setAutoCreateColumnsFromModel( false );
			fixed.setModel( main.getModel() );
			fixed.setSelectionModel( main.getSelectionModel() );
			fixed.setFocusable( false );
			
			for (int i = 0; i < totalColumns; i++)
			{
				main.getColumnModel().getColumn(i).setPreferredWidth(40);
				
			}
			//  Remove the fixed columns from the main table
			//  and add them to the fixed table

			for (int i = 0; i < fixedColumns; i++)
			{
		        TableColumnModel columnModel = main.getColumnModel();
		        TableColumn column = columnModel.getColumn( 0 );
	    	    columnModel.removeColumn( column );
				fixed.getColumnModel().addColumn( column );
			}

			//  Add the fixed table to the scroll pane

	        fixed.setPreferredScrollableViewportSize(fixed.getPreferredSize());
			scrollPane.setRowHeaderView( fixed );
			scrollPane.setCorner(JScrollPane.UPPER_LEFT_CORNER, fixed.getTableHeader());

			// Synchronize scrolling of the row header with the main table
			fixed.setBackground(new Color(238,238,238));
			fixed.setRowSelectionAllowed(false);
			fixed.setEnabled(false);
			//centrerTable(fixed);
			//centrerTable(main);
			main.setDefaultRenderer(Object.class , new jTableRender());
			
			
			
			JTableHeader th = main.getTableHeader();
			TableColumnModel tcm = th.getColumnModel();
			Enumeration<TableColumn> tc = tcm.getColumns();
			ArrayList<String> headernames = new ArrayList<String>();
			while (tc.hasMoreElements()){
				TableColumn t= tc.nextElement();
				headernames.add((String)t.getHeaderValue());
			}
			
			String [] newHeaderName = new String[headernames.size()+1];
			newHeaderName = headernames.toArray(newHeaderName);
			
			for (int i=newHeaderName.length-1;i>0;i--)
				newHeaderName[i]=newHeaderName[i-1];
						
			TTHeader tth = new TTHeader (main.getColumnModel ());
			tth.setToolTipsText(newHeaderName);
			main.setTableHeader (tth);
			
			scrollPane.getRowHeader().addChangeListener( this );
		}
	

		
	/*
	 *  Specify the number of columns to be fixed and the scroll pane
	 *  containing the table.
	 */
		
	/*
	 *  Return the table being used in the row header
	 */
	public JTable getFixedTable()
	{
		return fixed;
	}
//
//  Implement the ChangeListener
//
	public void stateChanged(ChangeEvent e)
	{
		//  Sync the scroll pane scrollbar with the row header

		JViewport viewport = (JViewport) e.getSource();
		scrollPane.getVerticalScrollBar().setValue(viewport.getViewPosition().y);
	}
//
//  Implement the PropertyChangeListener
//
	public void propertyChange(PropertyChangeEvent e)
	{
		//  Keep the fixed table in sync with the main table

		if ("selectionModel".equals(e.getPropertyName()))
		{
			fixed.setSelectionModel( main.getSelectionModel() );
		}

		if ("model".equals(e.getPropertyName()))
		{
			fixed.setModel( main.getModel() );
		}
	}
	
	
	public class jTableRender extends DefaultTableCellRenderer {

	    @Override
	    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
	        Component component = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
	        /**
	         * Fixer la couleur de fond de la première colonne en jaune
	         */
	      
	        if (column != 0) {
	            Color clr = new Color(255, 255, 255);
	            component.setBackground(clr);
	        }
	        /**
	         * Colorier les cellules en orange si le montant est négatif
	         */
	        Object o = table.getValueAt(row, column);
	        if (o != null && component instanceof JLabel) {
	            JLabel label = (JLabel) component;
	            String lab=label.getText();
	            if (row == column)
	            {
	            	Color clr = new Color(238,238,238);
	            	 component.setBackground(clr);
	            }else
	            if (lab==" ")
	            {
	            	Color clr = new Color(255,255,255);
	            	 component.setBackground(clr);
	            }
	            else
	            if (column>=0)
	             {
	            	float val= Float.parseFloat(lab);
	                                       	
	            	Color clr = new Color(255,255,255);
	            
	               	
	           	if(val>=0 && val<0.1) clr = new Color(248, 105, 107);
	               	else 
	               		if(val>=0.1 && val<0.2) clr = new Color(248, 129, 131);
	               		else if(val>=0.2 && val<0.3) clr = new Color(249, 153, 156);
	               		else if(val>=0.3 && val<0.4) clr = new Color(249, 178, 180);
	               		else if(val>=0.4 && val<0.5) clr = new Color(251, 202, 205);
	               		else if(val>=0.5 && val<0.6) clr = new Color(251, 227, 230);
	               		else if(val>=0.6 && val<0.7) clr = new Color(212, 224, 241);
	               		else if(val>=0.7 && val<0.8) clr = new Color(204, 218, 238);
	               		else if(val>=0.8 && val<0.9) clr = new Color(172, 196, 227);
	               		else if(val>=0.9 && val<1) clr = new Color(121, 160, 209);
	               		else if(val==1 ) clr = new Color(90, 138, 198);
	               		else clr = new Color(255,255,255);
	           	
	            	
	                component.setBackground(clr);
	                        	
	            	
	             }
	            /**
	             * Center le texte 
	             */
	            
	                label.setHorizontalAlignment(CENTER);
	            
	        }
	        return component;
	    }
	}
	
	
	// change Theader to support tooltip
	class TTHeader extends JTableHeader
	{
	  // The following String array holds all ToolTip text, with one entry
	  // for each table column. If a column is to display default ToolTip
	  // text, the corresponding entry is "".

	  private String [] allToolTipsText;

	  TTHeader (TableColumnModel tcm)
	  {
	   // Pass the TableColumnModel object to the superclass, which 
	   // takes care of that object.

	   super (tcm);
	  }

	  // The following method is automatically called when the mouse 
	  // cursor hotspot moves over any one of the header rectangles in a
	  // table header.

	  public String getToolTipText (MouseEvent e)
	  {
	   // Return the pixel position of the mouse cursor hotspot.

	   Point p = e.getPoint ();

	   // Convert the pixel position to the zero-based column index of
	   // the table header column over which the mouse cursor hotspot is
	   // located. The result is a view-based column index.

	   int viewColumnIndex = columnAtPoint (p);

	   // Retrieve a reference to the JTable object associated with the
	   // table header.

	   JTable jt = getTable ();

	   // Convert the view-based column index to a model-based column
	   // index.

	   int modelColumnIndex = 
	     jt.convertColumnIndexToModel (viewColumnIndex);

	   // If model's ToolTip text is not present in allToolTipsText, 
	   // that means the default ToolTip text should be returned. 
	   // Otherwise, return the actual ToolTip text.

	   if (allToolTipsText [modelColumnIndex].length () == 0)
	     return super.getToolTipText (e);
	   else
	     return allToolTipsText [modelColumnIndex];
	  }

	  void setToolTipsText (String [] myToolTipsText)
	  {
	   // Save the ToolTips text array for use by getToolTipText().

	   allToolTipsText = myToolTipsText;
	  }
	}
	
}
