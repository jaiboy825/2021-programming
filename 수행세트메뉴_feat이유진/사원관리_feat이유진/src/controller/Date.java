package controller;

public class Date {
	public static void main(String[] args) {
		String date = "2020-10-21";
		
		String y = date.substring(0, 4);
		System.out.println(y);
		
		String m = date.substring(5, 7);
		System.out.println(m);
		
		String d = date.substring(8, 10);
		System.out.println(d);
	}
}
