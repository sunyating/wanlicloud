package net.wanho.sso.service.impl;

import com.alibaba.fastjson.JSONObject;
import net.wanho.mapper.TbUserMapper;
import net.wanho.model.TbUser;
import net.wanho.model.TbUserExample;
import net.wanho.sso.service.UserService;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    TbUserMapper tbUserMapper;

    @Override
    public List<TbUser> queryUserByName(String userName) {
        TbUserExample tbUserExample = new TbUserExample();
        TbUserExample.Criteria criteria = tbUserExample.createCriteria();
        criteria.andUserNameEqualTo(userName);
        List<TbUser> tbUsers = tbUserMapper.selectByExample(tbUserExample);
        return tbUsers;
    }

    @Override
    public List<TbUser> queryUserByPhone(String phone) {
        TbUserExample tbUserExample = new TbUserExample();
        TbUserExample.Criteria criteria = tbUserExample.createCriteria();
        criteria.andPhoneEqualTo(phone);
        List<TbUser> tbUsers = tbUserMapper.selectByExample(tbUserExample);
        return tbUsers;
    }

    @Override
    public List<TbUser> queryUserByEmail(String email) {
        TbUserExample tbUserExample = new TbUserExample();
        TbUserExample.Criteria criteria = tbUserExample.createCriteria();
        criteria.andEmailEqualTo(email);
        List<TbUser> tbUsers = tbUserMapper.selectByExample(tbUserExample);
        return tbUsers;
    }

    @Override
    public void addUser(TbUser user) {
        String salt = UUID.randomUUID().toString();//盐值
        String password = user.getPassword();//要加密的密码
        Integer hashIterations = 2;//散列次数
        Sha256Hash sha = new Sha256Hash(password, salt, hashIterations);
        user.setPassword(sha.toString());
        user.setSalt(salt);
        user.setStatus("1");
        user.setCreateTime(new Date());
        tbUserMapper.insert(user);
    }
}
