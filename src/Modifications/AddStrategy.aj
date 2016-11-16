package Modifications;
import java.awt.*;
import java.awt.event.*;

import javax.swing.*;
import c4.base.BoardPanel;
import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.Callable;
import c4.base.C4Dialog;

privileged public aspect AddStrategy { 
	JComboBox dropDown;
	
	pointcut createBox(C4Dialog opt) : execution (JPanel C4Dialog.makeControlPanel())&&this(opt);
	
	JPanel around(C4Dialog opt) : createBox(opt){
		JPanel set = proceed(opt);
		JPanel buttons = (JPanel) opt.playButton.getParent();
		String[] content = {"Human","CPU Random","CPU Smart"};
		dropDown = new JComboBox();
		dropDown.setModel(new DefaultComboBoxModel(content));
		dropDown.setBounds(400, 300, 100, 20);
		buttons.add(dropDown,BorderLayout.WEST);
		return set;
		
	}
	
	pointcut initGame(C4Dialog opt) : call(void C4Dialog.startNewGame())&&target(opt);
	after(C4Dialog opt) returning : initGame(opt){
		String selection = (String) dropDown.getSelectedItem();
		if (selection.equals("Human")){
			
		}else if(selection.equals("CPU Random")){
			
		}else if(selection.equals("CPU Smart")){
			
		}
		
	}
	
}
