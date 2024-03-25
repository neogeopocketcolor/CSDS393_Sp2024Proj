package com.example.demo.controller;

import com.example.demo.entity.ComResult;
import com.example.demo.entity.Recipe;
import com.example.demo.mapper.RecipeMapper;
import com.example.demo.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping(value = "/recipe")
public class RecipeController {

    @Autowired
    private RecipeMapper recipeMapper;

    @RequestMapping("/add")
    public ComResult insert(Recipe recipe){
        ComResult result = new ComResult();
        recipe.setCreatedTime(DateUtil.DateNow());
        recipeMapper.insert(recipe);
        result.setCode(0);
        return result;
    }


    @RequestMapping("/delete")
    public ComResult delete(int id){
        ComResult result = new ComResult();
        result.setCode(recipeMapper.delete(id));
        return result;
    }


    @RequestMapping("/update")
    public Object update(Recipe recipe){
        return recipeMapper.update(recipe);
    }


    @RequestMapping("/load")
    public ComResult<Recipe> load(int id){
        ComResult result = new ComResult();
        result.setData(recipeMapper.load(id));
        result.setCode(0);
        return result;
    }

    @RequestMapping("/pageList")
    public ComResult<List<Recipe>> pageList(@RequestParam(required = false, defaultValue = "1") int page,
                                            @RequestParam(required = false, defaultValue = "10") int pagesize,
                                            @RequestParam(required = false,defaultValue = "0") int userId) {
        List<Recipe> dataList = recipeMapper.pageList((page-1)*pagesize, pagesize,userId);
        ComResult result = new ComResult();
        result.setCode(0);
        result.setData(dataList);
        result.setCount(recipeMapper.pageListCount(userId));
        return result;
    }

}