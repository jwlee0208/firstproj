package com.firstproj.testtwo.web;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class Test {
	
//	private static Jedis jedis = new Jedis("127.0.0.1");
	
	public static void main(String[] args) throws Exception{
		
//		jedis.set("foo", "bar");
//		String value = jedis.get("foo");
//		System.out.println("value : " + value);
		
//		System.out.println("jpg".compareTo("jpg, jpeg, png, gif, bmp"));
//		System.out.println("jpg, jpeg, png, gif, bmp".compareTo("jpg"));
//		System.out.println("jpg".matches(".*jpg, jpeg, png, gif, bmp.*"));
//		System.out.println("jpg, jpeg, png, gif, bmp".matches(".*jpg.*"));

		JedisPool pool = new JedisPool(new JedisPoolConfig(), "127.0.0.1");
		
		Jedis jedis = pool.getResource();
		jedis.set("foo", "bar");
		
		jedis.del("boardArticleFive01");
		
		System.out.println(jedis.get("foo"));
		
		
	}	
}
