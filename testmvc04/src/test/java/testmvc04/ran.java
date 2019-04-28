package testmvc04;

import java.util.Random;

public class ran {

	public static void main(String[] args) {
		Random random = new Random();
		
		
		for(int i=0;i<100;i++) {
			System.out.println(random.nextInt(9999));
		}
		System.out.println("************************");

		for(int i=0;i<100;i++) {
			System.out.println((int)(Math.random()*8998)+1000+1);
		}

	}

}
