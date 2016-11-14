package Modifications;

import java.io.IOException;
import javax.sound.sampled.*;
import c4.model.Player;
import c4.model.Board;

public aspect AddSound {
	
	private static final String SOUND_DIR = "/sounds/";
	public static void playAudio(String filename) {
	      try {
	          AudioInputStream audioIn = AudioSystem.getAudioInputStream(
		    AddSound.class.getResource(SOUND_DIR + filename));
	          Clip clip = AudioSystem.getClip();
	          clip.open(audioIn);
	          clip.start();
	      } catch (UnsupportedAudioFileException 
	            | IOException | LineUnavailableException e) {
	          e.printStackTrace();
	      }
	    }
		
	pointcut chipAudio(int slot, Player player) : call(int Board.dropInSlot(int, Player)) && args(slot,player);
	
	int around(int slot, Player player): chipAudio(slot, player){
		System.out.println(slot);
		System.out.println(player.name());
		String name=player.name();
		
		//playAudio("c.wav");
		if (name.equals("Blue")){
			playAudio("c.wav");
			System.out.println("playc");
		}
		else{
			playAudio("e.wav");
			System.out.println("playd");
		}
		
		return proceed(slot, player);
	}
	
	pointcut winAudio(Player player) : call(boolean Board.isWonBy(Player)) && args(player);
	boolean around(Player player): winAudio(player){
		//boolean hn = proceed(player);
		if (proceed(player) == true){
			playAudio("applause.wav");
			
		}
		return proceed(player);
		
	}
		

}
