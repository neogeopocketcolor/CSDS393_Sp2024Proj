<template>
    <div class="food-wrapper" v-loading="loading" element-loading-text="loading...">
       <div class="name">
        <div>
          <span class="line"></span>
          <span>{{ foodObj.name }}</span>
          <span class="category">({{ foodObj.category }})</span>
        </div>
        <div class="right-wrapper">

        </div>
      
      </div>
      <div class="info-wrapper">
        <div class="icon-wrapper">
          <span class="title">Icon:</span>
          <el-image :src="getImagePath(foodObj.icon)" />
        </div>
        <p class="info"><span class="title">Info:</span>{{ foodObj.info }}</p>
        <div class="ingredients-wrapper">
           <span class="title">Ingredients:</span>
            <p class="ingredient" v-for="(item,index) in foodObj.ingredients">
              <span class="ingredient-name">{{ item.name }}:</span>
              {{ item.number }}
              {{ getFoodUnit(item.unit) }}
            </p>
        </div>
        <div class="practice-wrapper">
          <span class="title">Practice:</span>
          <div class="practice-item" v-for="(item,index) in foodObj.practice">
            <el-image :src="getImagePath(item.icon)" />
            <p>{{ index+1 }}: {{item.name}}</p>
          </div>

        </div>

      </div>
   
    </div>
  </template>
  
<script>
// import user from '@/store/modules/user';
import request from '@/utils/request'
import { spliceUrl, getFormData,picPath } from "@/utils/urlUtil";
import { footCategorys,footUnits } from "@/utils/enmu";
  
export default {
    name: 'DetailRecipe',
    data() {
        return {
            loading: false,
            footCategorys:footCategorys,
            footUnits:footUnits,
            foodObj: {
              name:'',
              category:'',
              info:'',
              icon:'',
              ingredients:[],
              practice:[]
            }
        };
    },
    created() {
      this.getMenuData(this.$route.query.id);
    },
    methods: {
        getImagePath:function(path){
          let absolutePath = picPath(path);
          return absolutePath;
        },
        getFoodUnit:function(unit){
         let unitObj =  footUnits.find(item =>item.value == unit);
          return unitObj.label;
        },
        getMenuData: async function (id) {
            this.loading = true;
            let params = {id}
           let res = await request({
                url: spliceUrl('recipe/load', params),
                method: 'get'
            }).catch(er=>-1);
            this.loading = false;
          if(res == 1)return;
          let menu = res.data || {};
          menu.ingredients = JSON.parse(menu.ingredients);
          menu.practice = JSON.parse(menu.practice);
          let category=  footCategorys.find(item=>item.value == menu.category).label;
          menu.category = category;
          this.foodObj = menu;
        }
  
    },
};
  </script>
  
<style lang="scss" scoped>
.food-wrapper {
  padding: 10px 25px;
  .name {
     line-height: 60px;
     font-weight: 600;
     display: flex;
     align-items: center;
     justify-content: space-between;
     border-bottom: 1px solid rgb(102, 177, 255);
     .line {
      margin-right: 10px;
       width: 4px;
       height: 20px;
       border-radius: 2px;
       background-color: rgb(102, 177, 255);
     }
     .category {
       margin-left: 5px;
       color:  red;
     }
    
  
   
  }
  .info-wrapper {
    padding: 15px;
    .title {
      margin-right: 10px;
      font-size: 16px;
      font-weight: 600;
    }
    .icon-wrapper {
      display: flex;
      align-items: center;
    }
    .ingredients-wrapper {
      font-size: 14px;
      font-weight: 600;
      .ingredient {
        padding-left: 15px;
        color: gray;
        .ingredient-name {
          margin-right: 5px;
          color: black;
        }
      }
     
    }
    .practice-wrapper {
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: flex-start;
      .practice-item {
        padding: 10px 15px;
        display: flex;
        .el-image {
          margin-right: 15px;
        }
      }
    }
  }
}







  .form-wrapper {
    padding-top: 50px;
    padding-left: 25px;
    padding-right: 100px;
    padding-bottom: 100px;
  }



  .ingredient-wrapper {
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    .el-input {
        width: 200px;
        &.number-input {
            margin-left: 20px;
            width: 100px;
        }
    }
    .el-select {
      width: 100px;
      .el-input {
        width: 100px;
      }
    }
  


  }
  .practice-wrapper {
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    .el-textarea {
      margin-left: 20px;
      flex: 1;
    }


    
  }
  .el-icon-remove-outline,.el-icon-circle-plus-outline {
        margin-left: 20px;
        font-size: 30px;
    }
    .btn-wrapper {
        text-align: center;
    }
    .el-image {
      width: 120px;
      height: 120px;
    }
    .image-slot {
      height: 100%;
      border: 1px dashed #409eff;
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
      .el-icon-plus {
        font-size: 35px;
      }
    }
  </style>