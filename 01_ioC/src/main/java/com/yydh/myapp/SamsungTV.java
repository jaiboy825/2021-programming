package com.yydh.myapp;

public class SamsungTV implements TV{
	public SamsungTV() {
		System.out.println("객체 생성 완료");
	}
	@Override
	public void powerOn() {
		System.out.println("SamsungTV ----전원을 켠다");
	}

	@Override
	public void powerOff() {
		System.out.println("SamsungTV ----전원을 끈다");
	}

	@Override
	public void volumeUp() {
		System.out.println("SamsungTV ----볼륨을 올린다");
	}

	@Override
	public void voilumeDown() {
		System.out.println("SamsungTV ----볼륨을 내린다");
	}
	
	public void initMethod() {
		System.out.println("객체 초기화 작업처리..");
	}
	public void destroyMethod() {
		System.out.println("객체 삭제 전에 처리할 로직");
		
	}
}
