package com.firstproj.testtwo.web;

import java.util.HashSet;
import java.util.Set;

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.JedisSentinelPool;
import redis.clients.jedis.Protocol;

public class Test {
	
//	private static Jedis jedis = new Jedis("127.0.0.1");
	
	private static void checkoutCompareWay(){
		System.out.println("jpg".compareTo("jpg, jpeg, png, gif, bmp"));
		System.out.println("jpg, jpeg, png, gif, bmp".compareTo("jpg"));
		System.out.println("jpg".matches(".*jpg, jpeg, png, gif, bmp.*"));
		System.out.println("jpg, jpeg, png, gif, bmp".matches(".*jpg.*"));

	}
	
	private static void useJedisPool() throws InterruptedException{
		
		JedisPool master_pool = new JedisPool(new JedisPoolConfig(), "127.0.0.1", 6379, 0, "123456");
		JedisPool slave_pool = new JedisPool(new JedisPoolConfig(), "127.0.0.1", 6380, 0);
		
		
		Jedis master_jedis = master_pool.getResource();		
		Jedis slave_jedis =  slave_pool.getResource();
		
		int count = 0;
		
		for(int i = 0 ; i < 5 ; i++){
			master_jedis.set("count", String.valueOf(count) );	
			System.out.println("master_jedis count : " + master_jedis.get("count"));
			System.out.println("slave_jedis  count : " + slave_jedis.get("count"));

			Thread.sleep(1);
			System.out.println("> master_jedis count : " + master_jedis.get("count"));
			System.out.println("> slave_jedis  count : " + slave_jedis.get("count"));
			count++;
			
		}
	}
	
	private static void useJedisSentinelPool() throws Exception{
		Set<String> sentinels = new HashSet<String>();
		GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
		sentinels.add("127.0.0.1:26379");
		
		JedisSentinelPool pool = new JedisSentinelPool("mymaster", sentinels, poolConfig, Protocol.DEFAULT_TIMEOUT, "123456", Protocol.DEFAULT_DATABASE); 	
		
		Jedis jedis = pool.getResource();
		
		System.out.println("jedis host : " + pool.getCurrentHostMaster());
		jedis.set("sentinel", "{\"J\":5,\"0\":\"N\"}");
		
		System.out.println("GET --> " + jedis.get("sentinel"));
		
		pool.returnResource(jedis);		
	}
	
	
	public static void main(String[] args) throws Exception{
		Test.checkoutCompareWay();
		
		// JedisPool
//		Test.useJedisPool();
		
		// JedisSentinelPool
		Test.useJedisSentinelPool();	
	}	
}
