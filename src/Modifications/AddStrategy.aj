package Modifications;
import java.awt.*;
import java.awt.event.*;

import javax.swing.*;
import c4.base.BoardPanel;
import java.util.LinkedList;
import java.util.Queue;
import java.util.concurrent.Callable;
import c4.base.C4Dialog;

public aspect AddStrategy { 
	public JComboBox comboBox;
	pointcut createBox(C4Dialog opt): execution (JPanel C4Dialog.makeControlPanel())&&this(opt);
	
	JPanel around(C4Dialog opt): createBox(opt){
		JPanel content = proceed(opt);
		JPanel buttons = (JPanel) opt.playButton.getTarget().getParent();
		String[] options = {"human","Random","Smart"};
		comboBox = new JComboBox();
		comboBox.setModel(new DefaultComboBoxModel(options));
		comboBox.setBounds(400, 300, 100, 20);
		buttons.add(comboBox,BorderLayout.WEST);
		return content;
		
	}
	
}
