package com.example.demo.mapper;

import com.example.demo.entity.Recipe;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


public interface RecipeMapper {


  int insert(Recipe recipe);

  int delete(int id);


  int update(Recipe recipe);


  Recipe load(int id);

  List<Recipe> pageList(@RequestParam(name = "offset")int offset, @RequestParam(name = "pagesize")int pagesize,
                        @RequestParam(name = "userId")int userId);

  int pageListCount(@RequestParam(name = "userId")int userId);

}