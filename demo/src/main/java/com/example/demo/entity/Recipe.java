package com.example.demo.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @description menu
 * @author BEJSON
 * @date 2024-03-24
 */
@Data
public class Recipe implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private Integer id;

    /**
     * name
     */
    private String name;

    /**
     * 0 1 2 3 4
     */
    private Integer category;

    /**
     * image
     */
    private String icon;

    /**
     * departShortName
     */
    private String createdTime;

    /**
     * user_id
     */
    private Integer userId;

    /**
     * practice
     */
    private String practice;

    /**
     * desc
     */
    private String info;

    /**
     * ingredients
     */
    private String ingredients;


    public Recipe() {
    }


}
