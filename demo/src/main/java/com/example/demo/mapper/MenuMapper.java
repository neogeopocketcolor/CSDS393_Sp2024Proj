package com.example.demo.mapper;

import com.example.demo.entity.Menu;
import com.example.demo.entity.User;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


public interface MenuMapper {


  int insert(Menu menu);

  int delete(int id);


  int update(Menu menu);


  Menu load(int id);

  List<Menu> pageList(@RequestParam(name = "offset")int offset, @RequestParam(name = "pagesize")int pagesize);

  int pageListCount();

}