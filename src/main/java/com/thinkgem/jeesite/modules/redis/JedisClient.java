package com.thinkgem.jeesite.modules.redis;

/**
 * Jedis客户端接口
 */
public interface JedisClient {

    /**
     * 设置
     * @param key
     * @return
     */
	String get(String key);

    /**
     * 取值
     * @param key
     * @param value
     * @return
     */
	String set(String key, String value);

    /**
     * 哈希类型的取值
     * @param hkey
     * @param key
     * @return
     */
	String hget(String hkey, String key);

    /**
     * 哈希类型的设置
     * @param hkey
     * @param key
     * @param value
     * @return
     */
	long hset(String hkey, String key, String value);

    /**
     * 整型值的自增
     * @param key
     * @return
     */
	long incr(String key);

    /**
     * 整型值的自减
     * @param key
     * @return
     */
    long decr(String key);

    /**
     * 设置键的过期时间(通过秒数表示有效期)
     * @param key
     * @param seconds
     * @return
     */
	long expire(String key, int seconds);

    /**
     * 对于设置过有效期的键，我们可以通过TTL或PTTL查看键的过期时间，前者使用秒数表示，后者使用毫秒数表示。
     * @param key
     * @return
     */
	long ttl(String key);

    /**
     * 删除
     * @param key
     * @return
     */
	long del(String key);

    /**
     * 哈希类型的删除
     * @param key
     * @param fields
     * @return
     */
	long hdel(String key, String... fields);
	
}
