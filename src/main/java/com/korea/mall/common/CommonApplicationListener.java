package com.korea.mall.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CommonApplicationListener implements ApplicationListener<ContextRefreshedEvent>{

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		// TODO Auto-generated method stub
		System.out.println("############################");
		System.out.println("############################");
		System.out.println("############################");
		
		test();
		System.out.println("############################");
		System.out.println("############################");
		System.out.println("############################");
		System.out.println("############################");
		
		
	}
	
	@Cacheable(value="testCache")
	public List<String> test(){
		
		List<String> out = new ArrayList<String>();
		
		out.add("1");
		out.add("2");
		out.add("3");
		out.add("4");
		out.add("5");
		out.add("6");
		out.add("7");
		out.add("8");
		log.debug(out.toString());
		return out;
	
		
	}
	
}
