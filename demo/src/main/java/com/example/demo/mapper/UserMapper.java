package com.example.demo.mapper;

import com.example.demo.entity.User;

import java.util.List;


public interface UserMapper {

  User getUserByAccount(String account);

  User getUserById(Integer id);

  int deleteUserByAccount(String account);

  int insert(User user);

  int updateByPrimaryKey(User user);

  List<User> getUserList(User user);

  int getCount();

}
