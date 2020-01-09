package net.wanho.sso.controller;

import com.alibaba.fastjson.JSONObject;
import net.wanho.model.TbUser;
import net.wanho.sso.service.UserService;
import net.wanho.utils.CookieAndRedisUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {
    @Resource
    UserService userService;

    @Resource
    JedisPool jedisPool;

    @RequestMapping("/user/toLogin")
    public ModelAndView toLogin(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }
    @RequestMapping("/user/toRegister")
    public ModelAndView toRegister(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register");
        return modelAndView;
    }
    @RequestMapping("/user/check/{username}/1")
    @ResponseBody
    public JSONObject check1(@PathVariable("username") String userName){
        JSONObject jsonObject = new JSONObject();
        List<TbUser> tbUsers = userService.queryUserByName(userName);
        jsonObject.put("status",200);
        if(tbUsers!=null && tbUsers.size()!=0){
            jsonObject.put("data",false);
            return jsonObject;
        }
        return jsonObject;
    }

    @RequestMapping("/user/check/{phone}/2")
    @ResponseBody
    public JSONObject check2(@PathVariable("phone") String phone){
        JSONObject jsonObject = new JSONObject();
        List<TbUser> tbUsers = userService.queryUserByPhone(phone);
        jsonObject.put("status",200);
        if(tbUsers!=null && tbUsers.size()!=0){
            jsonObject.put("data",false);
            return jsonObject;
        }
        return jsonObject;
    }

    @RequestMapping("/user/check/{email}/3")
    @ResponseBody
    public JSONObject check3(@PathVariable("email") String email){
        JSONObject jsonObject = new JSONObject();
        List<TbUser> tbUsers = userService.queryUserByEmail(email);
        jsonObject.put("status",200);
        if(tbUsers!=null && tbUsers.size()!=0){

            jsonObject.put("data",false);
            return jsonObject;
        }
        return jsonObject;
    }

    @RequestMapping(value = "/user/register", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addUser(TbUser user){
        JSONObject jsonObject = new JSONObject();
        try {
            userService.addUser(user);
            jsonObject.put("status",200);
        }catch (Exception e){
            e.printStackTrace();
            jsonObject.put("status",400);
        }
        return jsonObject;
    }

    @RequestMapping(value = "/user/login", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject login(HttpServletResponse res,TbUser user){
        JSONObject jsonObject = new JSONObject();
        String loginName = user.getUserName();
        String password = user.getPassword();
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(loginName, password);
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            String uid = UUID.randomUUID().toString();
//            登录验证成功，再查一遍获取用户信息，存到redis中
            List<TbUser> tbUsers = userService.queryUserByName(loginName);
            TbUser tbUser = tbUsers.get(0);
            tbUser.setPassword("");
            jedisPool.getResource().set(uid,JSONObject.toJSONString(tbUser));
            jedisPool.getResource().expire(uid,1800);
            CookieAndRedisUtils.writeCookie(res,"USER_TOKEN",uid);
//            CookieAndRedisUtils.writeRedis(uid,JSONObject.toJSONString(tbUser),1800);
            jsonObject.put("status",200);
        }catch (Exception e){
            e.printStackTrace();
            jsonObject.put("status",400);
            jsonObject.put("msg","账号或密码错误");
        }
        return jsonObject;

    }

    @CrossOrigin
    @RequestMapping("/user/token/{uid}")
    @ResponseBody
    public JSONObject token(@PathVariable("uid") String uid,HttpServletResponse response){

//        String tbUser = CookieAndRedisUtils.readRedis(uid);
        String userinfo = jedisPool.getResource().get(uid);
        TbUser user = JSONObject.parseObject(userinfo, TbUser.class);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("userName",user.getUserName());
        jsonObject.put("roleId",user.getRoleId());
//        response.addHeader("Access-Control-Allow-Origin", "*");
        return jsonObject;
    }
}
