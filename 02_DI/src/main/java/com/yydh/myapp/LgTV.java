package com.yydh.myapp;

public class LgTV implements TV{

	@Override
	public void powerOn() {
		System.out.println("LgTV ----전원을 켠다");
	}

	@Override
	public void powerOff() {
		System.out.println("LgTV ----전원을 끈다");
	}

	@Override
	public void volumeUp() {
		System.out.println("LgTV ----볼륨을 올린다");
	}

	@Override
	public void voilumeDown() {
		System.out.println("LgTV ----볼륨을 내린다");
	}

}
