package com.service.RedisOption;

import org.apache.log4j.Logger;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import java.io.Serializable;
import java.util.concurrent.TimeUnit;

public class RedisUtil {
    private Logger logger = Logger.getLogger(RedisUtil.class);
    private RedisTemplate<Serializable, Object> redisTemplate;

    /**
     * 判断缓存中是否有对应的key
     *
     * @param key
     * @return
     */
    public boolean exists(final String key) {
        return redisTemplate.hasKey(key);
    }

    /**
     * 删除key 和对应的 value
     *
     * @param key
     */
    public void remove(final String key) {
        if (exists(key)) {
            redisTemplate.delete(key);
        }
    }

    /**
     * 批量删除key
     *
     * @param keys
     */
    public void batchRemove(final String... keys) {
        for (String key : keys) {
            remove(key);
        }
    }

    /**
     * 读取缓存
     *
     * @param key
     * @return
     */
    public Object get(final String key) {
        Object result = null;
        ValueOperations<Serializable, Object> operations = redisTemplate.opsForValue();
        result = operations.get(key);
        return result;
    }

    /**
     * 写入缓存
     *
     * @param key
     * @param value
     * @return
     */
    public boolean set(final String key, Object value) {
        boolean result = false;
        ValueOperations<Serializable, Object> operations = redisTemplate.opsForValue();
        try {
            operations.set(key, value);
            result = true;
        } catch (Exception e) {
            logger.error("get()| redis写入错误", e);
        }
        return result;
    }

    /**
     * 写入带有有效时间的 缓存
     * @param key
     * @param value
     * @param expireTime
     * @return
     */
    public boolean set(final String key, Object value, Long expireTime) {
        boolean result = false;
        ValueOperations<Serializable, Object> operations = redisTemplate.opsForValue();
        try {
            operations.set(key,value);
            redisTemplate.expire(key,expireTime, TimeUnit.SECONDS);
            result =true;
        }catch (Exception e){
            logger.error("get()| redis写入(含有expireTime)错误", e);
        }
        return result;
    }

    public void setRedisTemplate(RedisTemplate<Serializable, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
}
