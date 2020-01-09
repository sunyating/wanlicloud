package net.wanho.sso.service;

import com.alibaba.fastjson.JSONObject;
import net.wanho.model.TbUser;

import java.util.List;

public interface UserService {
    List<TbUser> queryUserByName(String userName);
    List<TbUser> queryUserByPhone(String phone);
    List<TbUser> queryUserByEmail(String email);
    void addUser(TbUser user);
}
