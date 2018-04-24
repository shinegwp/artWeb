package test;

import java.util.HashMap;
import java.util.Map;

import redis.clients.jedis.Jedis;

public class Test {

	public static void main(String[] args) {
		Jedis jedis = new Jedis("192.168.200.128",6379);
		//对String类型的操作
		
		//存值
		jedis.set("name", "nan");
		//取值
		System.out.println(jedis.get("name"));
		//递增数
		jedis.incr("num");
		System.out.println(jedis.get("num"));
		
		//递增指定数
		jedis.incrBy("num", 2);
		System.out.println(jedis.get("num"));
		
		//递减数
		jedis.decr("num");
		System.out.println(jedis.get("num"));
		
		//递减指定数
		jedis.decrBy("num", 2);
		System.out.println(jedis.get("num"));
		
		//向尾部追加值
		jedis.set("name", jedis.get("name").concat("a"));
		System.out.println(jedis.get("name"));
		
		//获取长度
		System.out.println(jedis.strlen("name"));
		
		//同时设置多个值
		jedis.mset("1","11","2","22","3","33");
		//同时取多个值
		System.out.println(jedis.mget("1","2","name"));
		
		
		//对Hash类型的操作（应用于对象）
		//存取值
		Map<String, String> map = new HashMap<String,String>();
		map.put("name", "酱油三人组");
		map.put("time", "2018.4");
		map.put("number", "3");
		jedis.hmset("team", map);
		System.out.println(jedis.hmget("team", "name", "number"));
		//删除字段
		jedis.hdel("team", "time");
		//判断字段是否存在
		System.out.println(jedis.hexists("team","time")+ " " + jedis.hexists("team","name"));
		//增加人数（模拟增加ID）
		jedis.hincrBy("team", "number", 3);
		System.out.println(jedis.hget("team", "number"));
		
		//获取字段名
		System.out.println(jedis.hkeys("team"));
		//获取字段值
		System.out.println(jedis.hvals("team"));
		//
		
	}
}
