package com.korea.mall.common;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.cache.ehcache.EhCacheManagerFactoryBean;
import org.springframework.cache.jcache.JCacheCacheManager;
import org.springframework.cache.jcache.JCacheManagerFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;

//@Configuration
//@EnableCaching
public class CacheConfig {
//	@Bean
//    public EhCacheCacheManager ehCacheCacheManager() {
//
//        return new EhCacheCacheManager(ehCacheManagerFactoryBean().getObjectType());
//    }
//
//
//    @Bean
//    public EhCacheManagerFactoryBean ehCacheManagerFactoryBean() {
//
//        EhCacheManagerFactoryBean cacheManagerFactoryBean = new EhCacheManagerFactoryBean();
//
//        cacheManagerFactoryBean.setConfigLocation(new ClassPathResource("ehcache.xml"));
//        cacheManagerFactoryBean.setShared(true);
//
//        return cacheManagerFactoryBean;
//    }
	
//	@Configuration
//	@EnableCaching
//	public class CacheConfiguration {
//	    @Bean
//	    public JCacheManagerFactoryBean cacheManagerFactoryBean() throws Exception {
//	        JCacheManagerFactoryBean jCacheManagerFactoryBean = new JCacheManagerFactoryBean();
//	        jCacheManagerFactoryBean.setCacheManagerUri(new ClassPathResource("ehcache.xml").getURI());
//	        return jCacheManagerFactoryBean;
//	    }
//
//	    @Bean
//	    public CacheManager cacheManager() throws Exception {
//	        final JCacheCacheManager jCacheCacheManager = new JCacheCacheManager();
//	        jCacheCacheManager.setCacheManager(cacheManagerFactoryBean().getObject());
//	        return jCacheCacheManager;
//	    }
//	}
}
