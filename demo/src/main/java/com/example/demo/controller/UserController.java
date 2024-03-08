package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.entity.ComResult;
import com.example.demo.mapper.UserMapper;
import com.example.demo.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    UserMapper userMapper;



    //regist
    @RequestMapping(value = "/registUser", method = RequestMethod.POST)
    public ComResult registUser(User user) {
        ComResult result = new ComResult<>();
        User userInfo = userMapper.getUserByAccount(user.getAccount());
        if (userInfo != null) {
            result.setCode(-1);
            result.setMsg("the account is exist!");
        } else {
            user.setCreatedTime(DateUtil.DateNow());
            int index = userMapper.insert(user);
            result.setCode(index);
            result.setMsg("resgist success!");
        }
        return result;
    }








    //update
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public ComResult updateUser(User user) {
        int index = userMapper.updateByPrimaryKey(user);
        ComResult result = new ComResult<>();
        result.setCode(index);
        return result;
    }


    @RequestMapping(value = "/getUserByAccount", method = RequestMethod.POST)
    public ComResult<User> getUserByAccount(@RequestParam String account) {
        User user = userMapper.getUserByAccount(account);
        ComResult<User> result = new ComResult<>();
        result.setCode(1);
        result.setData(user);
        return result;
    }



    @RequestMapping(value = "/getUserList", method = RequestMethod.GET)
    public ComResult getUserList(User user) {
        Integer offset = (user.getPage() - 1) * user.getPageSize();
        user.setPage(offset);
        List<User> users = userMapper.getUserList(user);

        Integer count = userMapper.getCount();
        ComResult result = new ComResult<>();
        result.setCode(1);
        result.setCount(count);
        result.setData(users);
        return result;
    }











}
