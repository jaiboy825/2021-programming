package com.yydh.myapp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {

	public static void main(String[] args) {
		// POJO 방식

//		TV tv = new SamsungTV();
//		tv.powerOn();
//		tv.volumeUp();
//		tv.voilumeDown();
//		tv.powerOff();
		// POJO End
		
//		XML 방식
		AbstractApplicationContext factory = new GenericXmlApplicationContext("ApplicationContext.xml");
		TV tv = (TV)factory.getBean("tv");
		tv.powerOn();
		tv.volumeUp();
		tv.voilumeDown();
		tv.powerOff();
		factory.close();
	}

}
