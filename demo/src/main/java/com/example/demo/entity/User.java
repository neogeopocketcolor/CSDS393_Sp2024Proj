package com.example.demo.entity;

import lombok.Data;

@Data
public class User {
    private  Integer id;
    private  String account;
    private  String password;
    private  String newPass;
    private  String nickName;
    private  Integer sex;
    private  String birthday;
    private  String phone;
    private  String idcard;
    private  String address;
    private  String avatar;
    private  String hobby;
    private  Boolean isBank;
    private  Integer role;
    private  String createdTime;
    private  Integer page = 1;
    private  Integer pageSize = 10;


}
