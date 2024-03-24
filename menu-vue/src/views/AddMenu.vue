<template>
    <div class="form-wrapper" v-loading="loading" element-loading-text="loading...">
        <el-form ref="form" :model="foodObj" label-width="130px"  label-suffix=":">
             <el-form-item label="sort" > 
               <el-select v-model="foodObj.sort" placeholder="请选择">
                  <el-option
                    v-for="item in footSorts"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                  </el-option>
               </el-select>
             </el-form-item>
            <el-form-item label="name" >
                <el-input v-model="foodObj.name" placeholder="enter food name"></el-input>
            </el-form-item>
            <el-form-item label="info" >
                <el-input v-model="foodObj.info" placeholder="enter food info"></el-input>
            </el-form-item>


            <el-form-item label="icon" prop="icon">
              <div @click="uploadImage(0)">
                <el-image :src="getImagePath(foodObj.icon)" >
                  <div slot="error" class="image-slot">
                   <i  class="el-icon-plus"></i>
                  </div>
                </el-image>
               </div>
            </el-form-item>



            <el-form-item label="ingredients" >
                <div class="ingredient-wrapper" v-for="(item,index) in foodObj.ingredients">
                    <el-input  v-model="item.name" placeholder="enter food desc"></el-input>
                    <el-input class="number-input"  v-model="item.number" placeholder="enter food desc"></el-input>
                    <el-select v-model="item.unit" placeholder="请选择">
                      <el-option
                    v-for="(item,index) in footUnits"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                      </el-option>
                    </el-select>
                    <i  @click="addIngredient" class="el-icon-circle-plus-outline" style="color: #409eff;"></i>
                    <i  @click="minusIngredient(index)" class="el-icon-remove-outline"  style="color: #409eff;"></i>
                </div>
            </el-form-item>
            <div style="height: 40px;"></div>

            <el-form-item label="practice" >
                <div v-if="foodObj.practice.length == 0" style="padding-top: 10px;">
                  <i  @click="addSpractice" class="el-icon-circle-plus-outline" style="color: #409eff;"></i>
                </div>
               
                <div class="practice-wrapper"  v-for="(item,index) in foodObj.practice">
                  <div @click="uploadImage(1,index)">
                    <el-image :src="getImagePath(item.icon)" >
                    <div slot="error" class="image-slot">
                     <i  class="el-icon-plus"></i>
                    </div>
                  </el-image>
                  </div>
                  


                  <el-input type="textarea" :rows="5"  class="number-input"  v-model="item.name" placeholder="enter food desc"></el-input>
                  
                  <i  @click="addSpractice" class="el-icon-circle-plus-outline" style="color: #409eff;"></i>
                  <i   @click="minusSpractice(index)"   class="el-icon-remove-outline" style="color: #409eff;"></i>
                  
                </div>
            </el-form-item>

        

            <div class="btn-wrapper">
                <el-button @click="$router.go(-1) ">Cancel</el-button>
                <el-button type="primary" @click="onSubmit">Save</el-button> 
            </div>






            
        </el-form>

        <input accept="image/*"   style="height: 0;" ref="file" type="file" @change="fileChange"/>
    </div>
  </template>
  
<script>
// import user from '@/store/modules/user';
import request from '@/utils/request'
import { spliceUrl, getFormData,picPath } from "@/utils/urlUtil";
import { footSorts,footUnits } from "@/utils/enmu";
  
export default {
    name: 'AddMenu',

    data() {
        return {
            loading: false,
            footSorts:footSorts,
            footUnits:footUnits,
            foodObj: {
              name:'',
              sort:'',
              info:'',
              icon:'',
              ingredients:[{name:'姜片',number:1,unit:'g'}],
              practice:[{icon:'姜片',info:1}]
            },
            imageUrl:'',
            uploadType:0,
            uploadIndex:0,
            rules: {
               password: [
                    { required: true, message: 'password is empty!' }
                ],
                nickName: [
                    { required: true, message: 'nickName is empty!' },
              
                ],
                phone: [
                    { required: true, message: 'phone is empty!' }
                ],
                hobby: [
                    { required: true, message: 'hobby is empty!' }
                ]
            }
  
        };
    },
    created() {

      if(this.$route.query.id != undefined){
        this.getMenuData(this.$route.query.id);
      }
      
        // this.getUserInfo()
    },
    methods: {
        onSubmit: function () {
            this.$refs.form.validate((valid) => {
                if (valid) {
                    this.saveData()
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });
        },
        getImagePath:function(path){
          let absolutePath = picPath(path);
          return absolutePath;
        },
        saveData:async function () {
            this.loading = true;
            let params = JSON.parse(JSON.stringify(this.foodObj));
            params.ingredients = JSON.stringify(params.ingredients);
            params.practice = JSON.stringify(params.practice);
            params.userId = this.$store.getters.userId;
            let url = this.foodObj.id == undefined?'menu/add':'menu/update';
          let res = await request({
                url: url,
                method: 'post',
                data: getFormData(params)
            }).catch(err =>-1);
            this.loading = false;
         if(res == -1)return;
          this.modal('save success');
          this.$router.go(-1)    
        
        },
        getMenuData: async function (id) {
            this.loading = true;
            let params = {
              id
            }
          let res = await request({
                url: spliceUrl('/menu/load', params),
                method: 'get'
            }).catch(er=>-1);
            this.loading = false;
          if(res == 1)return;
          let menu = res.data || {};
          menu.ingredients = JSON.parse(menu.ingredients);
          menu.practice = JSON.parse(menu.practice);
          this.foodObj = menu;
        },
        uploadImage:function(type,index){
          this.$refs.file.click();
          this.uploadType = type;
          this.uploadIndex = index;
        },
        fileChange:async function(e){
          const file = event.target.files[0]; 
          let formdata = new FormData();
          formdata.append("file",file);
          let res = await request({url: 'upload',method: 'post',data:formdata}).catch(err=>-1);
          this.loading = false;
          if (res == -1) {
            this.modal("upload fail");
            return;
          }
          this.modal("upload success");
          debugger
          let pic = res.data||'';
          if (this.uploadType == 0) {
            this.foodObj.icon = pic;
            return;
          }
          this.foodObj.practice[this.uploadIndex].icon = pic;
          this.$forceUpdate();

        },
        addIngredient:function(){
          this.foodObj.ingredients.push({name:'姜片',number:1,unit:'g'});
        },
        minusIngredient:function(index){
          this.foodObj.ingredients.splice(index, 1)
        },
        addSpractice:function(){
          this.foodObj.practice.push({icon:'姜片',info:1});
        },
        minusSpractice:function(index){
          this.foodObj.practice.splice(index, 1)
        },
  
    },
};
  </script>
  
  <style lang="scss" >
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