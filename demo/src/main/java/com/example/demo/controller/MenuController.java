package com.example.demo.controller;

import com.example.demo.entity.ComResult;
import com.example.demo.entity.Menu;
import com.example.demo.mapper.MenuMapper;
import com.example.demo.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @description menu
 * @author BEJSON
 * @date 2024-03-24
 */
@RestController
@RequestMapping(value = "/menu")
public class MenuController {

    @Autowired
    private MenuMapper menuMapper;

    /**
     * 新增
     * @author BEJSON
     * @date 2024/03/24
     **/
    @RequestMapping("/add")
    public ComResult insert(Menu menu){
        ComResult result = new ComResult();
        menu.setCreateTime(DateUtil.DateNow());
        menuMapper.insert(menu);
        result.setCode(0);
        return result;
    }

    /**
     * 刪除
     * @author BEJSON
     * @date 2024/03/24
     **/
    @RequestMapping("/delete")
    public Object delete(int id){
        return menuMapper.delete(id);
    }

    /**
     * 更新
     * @author BEJSON
     * @date 2024/03/24
     **/
    @RequestMapping("/update")
    public Object update(Menu menu){
        return menuMapper.update(menu);
    }

    /**
     * 查询 根据主键 id 查询
     * @author BEJSON
     * @date 2024/03/24
     **/
    @RequestMapping("/load")
    public ComResult<Menu> load(int id){
        ComResult result = new ComResult();
        result.setData(menuMapper.load(id));
        result.setCode(0);
        return result;
    }

    /**
     * 查询 分页查询
     * @author BEJSON
     * @date 2024/03/24
     **/
    @RequestMapping("/pageList")
    public ComResult<List<Menu>> pageList(@RequestParam(required = false, defaultValue = "1") int page,
                                        @RequestParam(required = false, defaultValue = "10") int pagesize) {
        List<Menu> dataList = menuMapper.pageList((page-1)*pagesize, pagesize);

        ComResult result = new ComResult();
        result.setCode(0);
        result.setData(dataList);
        result.setCount(menuMapper.pageListCount());
        return result;
    }

}