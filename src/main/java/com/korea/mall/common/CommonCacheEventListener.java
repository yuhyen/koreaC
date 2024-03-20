package com.korea.mall.common;

import org.ehcache.event.CacheEvent;
import org.ehcache.event.CacheEventListener;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CommonCacheEventListener implements CacheEventListener<Object, Object>{
	
	@Override
	public void onEvent(CacheEvent<? extends Object, ? extends Object> event) {
		// TODO Auto-generated method stub
		log.error("cache event logger start@@@@@@@@@@@");
		log.debug("cache event logger message. getKey: {} / getOldValue: {} / getNewValue:{}", event.getKey(), event.getOldValue(), event.getNewValue());
    }

}
