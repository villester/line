package c4.base;

import java.util.Random;

public class RandomBot extends Ai{
	int move(){
		Random token = new Random();
		int col = token.nextInt(5) + 0;
		return col;
	}

}
