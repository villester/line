package Modifications;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.lang.reflect.Array;

import javax.swing.AbstractAction;
import javax.swing.ActionMap;
import javax.swing.InputMap;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.KeyStroke;
import c4.base.BoardPanel;
import c4.base.BoardPanel.Game;
import c4.model.*;
import c4.model.Board.Place;
import c4.base.BoardPanel;

public privileged aspect AddCheatKey{
	static int secBoard[][] = {{9,9,9,9,9,9,9},{9,9,9,9,9,9,9},{9,9,9,9,9,9,9},{9,9,9,9,9,9,9},{9,9,9,9,9,9,9},{9,9,9,9,9,9,9}};


	pointcut panel (BoardPanel board): target(board) && 	initialization(BoardPanel.new(Board, Game));
	before(BoardPanel board) : panel(board){
		ActionMap actionMap = board.getActionMap();
		int condition = JComponent.WHEN_IN_FOCUSED_WINDOW;
		InputMap inputMap = board.getInputMap(condition);
		String cheat = "Cheat";
		inputMap.put(KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0), cheat);
		actionMap.put(cheat, new KeyAction(board, cheat));
	}

	@SuppressWarnings("serial")
	private static class KeyAction extends AbstractAction {
		private final BoardPanel boardPanel;

		public KeyAction(BoardPanel boardPanel, String command) {
			this.boardPanel = boardPanel;
			putValue(ACTION_COMMAND_KEY, command);
		}

		/** Called when a cheat is requested. */
		public void actionPerformed(ActionEvent event) {
			
			System.out.println("F5 pressed");
//			g = getBoardPanel();


		}
	}

	//	pointcut token(int slot, Player player) : call(int Board.dropInSlot(int, Player)) && args(slot,player);
	//	int around(int slot, Player player): token(slot, player){
	//		int cont=5;
	//		int test = 1;
	//		while (test == 1){
	//			if (secBoard[cont][slot] == 9){
	//				if(player.name().equals("Blue")){
	//					
	//					secBoard[cont][slot] = 1;
	//					test = 0;
	//					
	//				}else{
	//					secBoard[cont][slot] = 0;
	//					test=0;
	//				}
	//			
	//			}else{
	//				cont--;
	//			}
	//		}
	//		
	//		return proceed(slot, player);	
	//	}




//	pointcut highlight(Graphics g, Color color, int slot, int y, boolean highlighted): 
//		call(void BoardPanel.drawChecker(Graphics,Color,int,int,boolean))&&args(g, color,slot,y,highlighted);
//	void around (Graphics g, Color color, int slot, int y, boolean highlighted):highlight(g,color,slot,y,highlighted){
//
//		return proceed(g, color, slot, y, true);
//	}


}