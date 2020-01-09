package net.wanho.utils;

import redis.clients.jedis.Jedis;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieAndRedisUtils {

    public static void writeCookie(HttpServletResponse response,String key,String value)
    {

        Cookie cookie = new Cookie(key, value);
        cookie.setPath("/");
        cookie.setMaxAge(60);
        response.addCookie(cookie);
    }


    public static String readCookie(HttpServletRequest request,String key)
    {

        String ret = "";
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie:cookies)
        {
            if(key.equalsIgnoreCase(cookie.getName()))
            {
                ret = cookie.getValue();
                break;
            }
        }
        return ret;
    }

    public static void writeRedis(String key,String value,int expiredTime)
    {
        Jedis jedis = new Jedis("localhost",6379);
        jedis.set(key,value);
        jedis.expire(key,expiredTime);
    }

    public static String readRedis(String key)
    {
        Jedis jedis = new Jedis("localhost",6379);
        return jedis.get(key);
    }
}
